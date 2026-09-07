#!/usr/bin/env bash
set -euo pipefail

apk=${1:?Usage: scan-virustotal.sh APK REPORT_MD REPORT_JSON}
report_md=${2:?Usage: scan-virustotal.sh APK REPORT_MD REPORT_JSON}
report_json=${3:?Usage: scan-virustotal.sh APK REPORT_MD REPORT_JSON}
api_key=${VIRUSTOTAL_API_KEY:?VIRUSTOTAL_API_KEY is required}

if [[ ! -f "$apk" ]]; then
    printf 'APK not found: %s\n' "$apk" >&2
    exit 1
fi

apk_sha256=$(sha256sum "$apk" | cut -d' ' -f1)
apk_size=$(stat -c '%s' "$apk")
upload_url=https://www.virustotal.com/api/v3/files

if (( apk_size > 33554432 )); then
    upload_url=$(curl --fail --silent --show-error \
        --header "x-apikey: $api_key" \
        https://www.virustotal.com/api/v3/files/upload_url | jq -r '.data')
fi

analysis_id=$(curl --fail --silent --show-error \
    --request POST \
    --header "x-apikey: $api_key" \
    --form "file=@$apk" \
    "$upload_url" | jq -r '.data.id')

if [[ -z "$analysis_id" || "$analysis_id" == null ]]; then
    printf 'VirusTotal did not return an analysis ID.\n' >&2
    exit 1
fi

analysis_status=queued
for _ in $(seq 1 30); do
    analysis_status=$(curl --fail --silent --show-error \
        --header "x-apikey: $api_key" \
        "https://www.virustotal.com/api/v3/analyses/$analysis_id" | jq -r '.data.attributes.status')
    [[ "$analysis_status" == completed ]] && break
    sleep 20
done

if [[ "$analysis_status" != completed ]]; then
    printf 'VirusTotal analysis did not complete before the timeout.\n' >&2
    exit 1
fi

curl --fail --silent --show-error \
    --header "x-apikey: $api_key" \
    "https://www.virustotal.com/api/v3/files/$apk_sha256" | jq '.' > "$report_json"

malicious=$(jq -r '.data.attributes.last_analysis_stats.malicious // 0' "$report_json")
suspicious=$(jq -r '.data.attributes.last_analysis_stats.suspicious // 0' "$report_json")
undetected=$(jq -r '.data.attributes.last_analysis_stats.undetected // 0' "$report_json")
harmless=$(jq -r '.data.attributes.last_analysis_stats.harmless // 0' "$report_json")
scan_date=$(date -u +'%Y-%m-%dT%H:%M:%SZ')

cat > "$report_md" <<EOF
# VirusTotal APK Scan

- File: \`$(basename "$apk")\`
- SHA-256: \`$apk_sha256\`
- Scanned: \`$scan_date\`
- Malicious: **$malicious**
- Suspicious: **$suspicious**
- Undetected: **$undetected**
- Harmless: **$harmless**
- Public report: https://www.virustotal.com/gui/file/$apk_sha256

VirusTotal results describe what participating engines reported at scan time. They are not a guarantee that an application is secure. Verify the APK checksum and signing certificate before installation.
EOF

if (( malicious > 0 || suspicious > 0 )); then
    printf 'VirusTotal flagged the APK: malicious=%s suspicious=%s\n' "$malicious" "$suspicious" >&2
    exit 2
fi
