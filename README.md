# Biofects Butler Releases

Official signed Android releases and security reports for Biofects Butler, a companion HUD for an existing Home Assistant installation. Butler is not a standalone smart-home app.

## Download

Use the [latest release](https://github.com/biofects/Biofects-Butler-Releases/releases/latest) to download the standard Free Android APK.

Beta.19 requires version `0.1.0-beta.22` or newer of the [Biofects Butler Home Assistant integration](https://github.com/biofects/Biofects-Butler/releases/tag/v0.1.0-beta.22). It adds a Full Page dashboard layout, scrollable panels, compact greeting weather, and richer entity controls with current weather details and forecasts. Butler Neon and Holographic Interface are the two supported themes. Install a newer APK over the existing same-edition app to preserve Home Assistant authorization; do not uninstall first.

Compatible UniFi Connect displays that run Android 8.0 or newer and permit APK sideloading use the same standard Free APK. UniFi Connect is a supported device category, not a separate Butler edition or release. Physical compatibility can vary by model and firmware, and Google Mobile Ads may be unavailable on restricted firmware.

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

Use the support form at [biofects.com/support](https://biofects.com/support/).
