# Biofects Butler Releases

Biofects Butler is an Android dashboard and voice companion for Home Assistant. Download the signed APK from the latest release. Each release lists its minimum Home Assistant integration version. [Android downloads](https://github.com/biofects/Biofects-Butler-Releases/releases/latest) · [Home Assistant integration](https://github.com/biofects/Biofects-Butler)

## Install or update

1. Install the Biofects Butler integration through HACS or its release ZIP. Integration 1.0.0 is the recommended pairing for Android 1.0.0.
2. Download the signed APK and verify it using the instructions below. Enable installation from the source you use to open the APK on your device.
3. Install the APK, open Butler, and connect to Home Assistant. Remote addresses require HTTPS. To use local HTTP, enter the full HTTP address and approve the warning.

Android phones, tablets, Echo Show, and compatible UniFi Connect displays use the same APK if their firmware supports Android 8.0 or later and allows sideloading. Ad availability depends on device firmware and Google services.

On devices with the existing public `com.biofects.butler` app, install the newer signed APK over the current app to retain Home Assistant authorization. If you are moving from Companion Preview, sign in to Home Assistant once from the unified app. Older downloads retain their original filenames and release notes.

## Settings

After connecting, open **Settings** for the optional PayPal donation link. A labeled ad can appear at the top of Settings. **Assist Profile** lets each display choose a Home Assistant pipeline with its own conversation agent, prompt, and voice. **Home Assistant default** follows the preferred pipeline and offers a Piper override when available.

## Verify before installing

Public releases include `SHA256SUMS`, the certificate report `APK-SIGNATURE.txt`, the permissions report `APK-PERMISSIONS.txt`, and `SECURITY-REPORT.md` with build, test, lint, and scanner status.

The expected direct-release certificate SHA-256 is:

```text
6e96ab6b06627371fda1429f90e0792cd88a28311036f3bc8a3aa67a5554d37f
```

Run from the directory containing the downloaded APK and checksum file:

```bash
sha256sum --check SHA256SUMS
apksigner verify --verbose --print-certs Biofects-Butler-*.apk
```

Compare the certificate SHA-256 in the output with the fingerprint above. The security report lists the checks run for the published APK. The optional VirusTotal workflow requires an API key. [Scan workflow](https://github.com/biofects/Biofects-Butler-Releases/actions/workflows/scan-release.yml)

## Support

[Biofects Support](https://biofects.com/support/) · [Privacy policy](https://biofects.com/privacy/)
