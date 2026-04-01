## 2.0.0

- **BREAKING**: Renamed package from `disable_battery_optimization` to `disable_battery_optimization_2`
- Removed jcenter repository dependencies (jcenter is shut down)
- Replaced deprecated `com.afollestad.material-dialogs` library with AndroidX `AlertDialog`
- Updated Android Gradle Plugin from 4.1.0 to 8.7.3
- Updated Gradle wrapper from 7.0.2 to 8.11.1
- Updated `compileSdk` and `targetSdk` to 35 (Android 15)
- Migrated example app to Flutter declarative Gradle Plugin DSL
- Moved `namespace` from AndroidManifest.xml to build.gradle (AGP 7+ requirement)
- Replaced deprecated `lintOptions` with `lint` block
- Updated Java source/target compatibility from 1.8 to 17
- Updated all AndroidX dependencies to latest versions
- Removed deprecated `android.enableR8` and `android.enableJetifier` flags
- Added `android:exported="true"` to example app launcher activity
- Updated iOS podspec minimum deployment target from 8.0 to 12.0
- Removed deprecated `VALID_ARCHS` from iOS podspec
- Updated Dart SDK constraint to `>=3.0.0 <4.0.0`
- Updated Flutter constraint to `>=3.10.0`
- Updated test file to use modern `setMockMethodCallHandler` API
- Cleaned up material-dialogs style resources

## 1.1.2

- Fix flutter 3.29 build: Remove static registerWith method due to deprecation (PR #21)

## 1.1.1

- Bump to Dart3 + Android gradle namespace fix (PR #13)

## 1.1.0+1

- Added gitignore and pubignore

## 1.1.0

- Migrated to null safety

## 1.0.0

- Fixed issues with flutter version 2 + Upgraded the dependent libraries


## 0.2.0

- Upgraded flutter + Fixed issues

## 0.1.2

- Removed setting false for the auto start, manfact optimizations

## 0.1.1

- Now opening device settings, in case power intent is not available for oneplus and xiaomi

## 0.1.0

- Now supporting oppo and vivo devices

## 0.0.2

- Added support for v1 of flutter embedded.

## 0.0.1

- Initial release with methods to get the optimization status, show disable optimization dialogs