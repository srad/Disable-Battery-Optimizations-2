# disable_battery_optimization_2

<p align="center">
  <a href="https://pub.dev/packages/disable_battery_optimization_2"><img src="https://img.shields.io/pub/v/disable_battery_optimization_2.svg?style=for-the-badge&logo=dart&logoColor=white&label=pub.dev" alt="pub package"></a>
  <a href="https://pub.dev/packages/disable_battery_optimization_2/score"><img src="https://img.shields.io/pub/points/disable_battery_optimization_2?style=for-the-badge&logo=dart&logoColor=white&label=points" alt="pub points"></a>
  <a href="https://pub.dev/packages/disable_battery_optimization_2"><img src="https://img.shields.io/pub/popularity/disable_battery_optimization_2?style=for-the-badge&logo=flutter&logoColor=white" alt="popularity"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge" alt="License: MIT"></a>
</p>

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/Platform-Android-3DDC84?style=flat-square&logo=android&logoColor=white" alt="Android"></a>
  <a href="#"><img src="https://img.shields.io/badge/Flutter-%3E%3D3.10-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter"></a>
  <a href="#"><img src="https://img.shields.io/badge/Dart-%3E%3D3.0-0175C2?style=flat-square&logo=dart&logoColor=white" alt="Dart"></a>
  <a href="#"><img src="https://img.shields.io/badge/AGP-8.x%20%2F%209.x-4285F4?style=flat-square&logo=gradle&logoColor=white" alt="AGP"></a>
  <a href="#"><img src="https://img.shields.io/badge/compileSdk-35-34A853?style=flat-square&logo=android&logoColor=white" alt="compileSdk 35"></a>
</p>

<p align="center">
  <em>Stop Android from killing your app in the background.<br>Works with manufacturer-specific battery optimizations on 11+ OEM families.</em>
</p>

---

## What is this?

A Flutter plugin that helps your app survive Android's aggressive battery optimization. It provides:

- **Native battery optimization** — request the system to whitelist your app
- **Manufacturer-specific optimization** — guided dialogs for OEM power managers (MIUI, OneUI, ColorOS, EMUI, etc.)
- **Auto-start permission** — prompt users to allow your app to start on boot
- **Status checks** — query whether each optimization is currently disabled

## About this fork

This is a modernized fork of [disable_battery_optimization](https://pub.dev/packages/disable_battery_optimization) by [pvsvamsi](https://github.com/pvsvamsi/Disable-Battery-Optimizations), which hasn't been maintained since 2022 and no longer builds with modern Flutter/AGP.

<details>
<summary><b>Full list of changes from the original</b></summary>

| Area | Before | After |
|------|--------|-------|
| Repositories | jcenter (dead) | `mavenCentral()` |
| Dialog library | Afollestad material-dialogs 0.9.6 (jcenter-only, abandoned) | AndroidX `AlertDialog` |
| Android Gradle Plugin | 4.1.0 | 8.7.3 (AGP 8.x / 9.x compatible) |
| Gradle | 7.0.2 | 8.11.1 |
| compileSdk / targetSdk | 31 | 35 (Android 15) |
| Java compatibility | 1.8 | 17 |
| Gradle plugin style | Legacy `apply` | Declarative Plugin DSL |
| Namespace | In `AndroidManifest.xml` | In `build.gradle` (AGP 7+ requirement) |
| Deprecated flags | `enableR8`, `enableJetifier` | Removed |
| Dart SDK | `>=2.18.0` | `>=3.0.0 <4.0.0` |
| Flutter SDK | `>=1.12.0` | `>=3.10.0` |
| iOS minimum | 8.0 | 12.0 |
| AndroidX deps | 2021 versions | Latest stable |
| Tests | 0 | 9 unit tests |

</details>

> **Migrating from `disable_battery_optimization`?** Just change the dependency name and import path — the Dart API is identical.

---

## Installation

```yaml
dependencies:
  disable_battery_optimization_2: ^2.0.0
```

```dart
import 'package:disable_battery_optimization_2/disable_battery_optimization_2.dart';
```

---

## Usage

### Auto Start

```dart
// Check status
bool? isEnabled = await DisableBatteryOptimization.isAutoStartEnabled;

// Show guided dialog
await DisableBatteryOptimization.showEnableAutoStartSettings(
  "Enable Auto Start",
  "Follow the steps and enable the auto start of this app",
);
```

> **Note:** We can't programmatically verify if the user actually enabled auto-start — we can only show the steps.

### Battery Optimization (System)

```dart
// Check status
bool? isDisabled = await DisableBatteryOptimization.isBatteryOptimizationDisabled;

// Request system whitelist
await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
```

### Battery Optimization (Manufacturer)

```dart
// Check status
bool? isDisabled = await DisableBatteryOptimization.isManufacturerBatteryOptimizationDisabled;

// Show guided dialog
await DisableBatteryOptimization.showDisableManufacturerBatteryOptimizationSettings(
  "Additional battery optimization detected",
  "Follow the steps to allow this app to run in the background",
);
```

### All at Once

```dart
// Check everything
bool? allGood = await DisableBatteryOptimization.isAllBatteryOptimizationDisabled;

// Walk the user through all optimizations
await DisableBatteryOptimization.showDisableAllOptimizationsSettings(
  "Enable Auto Start", "Follow the steps to enable auto start",
  "Battery optimization detected", "Follow the steps to disable optimization",
);
```

---

## Supported Devices

Custom step-by-step dialogs are provided for:

| | | |
|:--|:--|:--|
| **Xiaomi** / Redmi / POCO | **Samsung** | **Huawei** / Honor |
| **Oppo** / Realme | **Vivo** | **OnePlus** |
| **Meizu** | **Asus** | **HTC** |
| **Letv** / LeEco | **ZTE** | Others — system settings |

---

## License

MIT — see [LICENSE](LICENSE) for details.

Original work copyright 2020 [Venkata Sai Vamsi Penupothu](https://github.com/pvsvamsi).