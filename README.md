# Biofects Butler Releases

Official signed Android releases and security reports for Biofects Butler, a companion HUD for an existing Home Assistant installation. Butler is not a standalone smart-home app.

## Download

Use the [latest release](https://github.com/biofects/Biofects-Butler-Releases/releases/latest) to download the standard Free Android APK.

Compatible UniFi Connect displays that permit APK sideloading can use the [UniFi Connect Free compatibility beta](https://github.com/biofects/Biofects-Butler-Releases/releases/tag/v0.1.0-beta.11-unifi). Physical Connect hardware validation is still pending, and Google Mobile Ads may be unavailable on restricted firmware.

The Paid editions are coming soon and are not currently available. Paid builds are never published in this repository.

## Verify before installing

Every public release includes:

- `SHA256SUMS` for file-integrity verification
- `APK-SIGNATURE.txt` with the signing-certificate identity
- `APK-PERMISSIONS.txt` with the merged manifest permissions
- `SECURITY-REPORT.md` with build, test, lint, and scanner status

The expected direct-release certificate SHA-256 is:

```text
6e96ab6b06627371fda1429f90e0792cd88a28311036f3bc8a3aa67a5554d37f
```

On Linux, verify a downloaded APK from the release directory with:

```bash
sha256sum --check SHA256SUMS
apksigner verify --verbose --print-certs Biofects-Butler-Free-*.apk
```

Security scanning reduces risk but does not guarantee that an application is secure. Download only from this repository or [biofects.com](https://biofects.com/butler/), verify the artifact, and keep Android and Home Assistant updated.

Release APKs are submitted to VirusTotal by the public [Scan release APK workflow](https://github.com/biofects/Biofects-Butler-Releases/actions/workflows/scan-release.yml). Its Markdown and JSON results are attached to the corresponding release. A release report clearly says when the VirusTotal scan is still pending.

## Support

See [biofects.com/support](https://biofects.com/support/) or email support@biofects.com.
