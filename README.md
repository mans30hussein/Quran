# quran_app

Flutter app with three environments:

- `dev`
- `stg`
- `prod`

## Flavor Setup

Android flavors are configured in [android/app/build.gradle.kts](/home/mansour/StudioProjects/quran_app/android/app/build.gradle.kts), and each Dart entrypoint initializes its own environment:

- [lib/main_dev.dart](/home/mansour/StudioProjects/quran_app/lib/main_dev.dart)
- [lib/main_stg.dart](/home/mansour/StudioProjects/quran_app/lib/main_stg.dart)
- [lib/main_prod.dart](/home/mansour/StudioProjects/quran_app/lib/main_prod.dart)

Shared runtime flavor config lives in [lib/app_config/app_config.dart](/home/mansour/StudioProjects/quran_app/lib/app_config/app_config.dart).

## Run Commands

Run `dev`:

```bash
flutter run --flavor dev -t lib/main_dev.dart
```

Run `stg`:

```bash
flutter run --flavor stg -t lib/main_stg.dart
```

Run `prod`:

```bash
flutter run --flavor prod -t lib/main_prod.dart
```

If you run without a flavor, [lib/main.dart](/home/mansour/StudioProjects/quran_app/lib/main.dart) defaults to the production environment.

## Build Commands

Build Android APKs:

```bash
flutter build apk --flavor dev -t lib/main_dev.dart
flutter build apk --flavor stg -t lib/main_stg.dart
flutter build apk --flavor prod -t lib/main_prod.dart
```

Build Android app bundles:

```bash
flutter build appbundle --flavor dev -t lib/main_dev.dart
flutter build appbundle --flavor stg -t lib/main_stg.dart
flutter build appbundle --flavor prod -t lib/main_prod.dart
```

## Current iOS Status

Android flavoring is configured in this project.

iOS still has a single default Xcode target/configuration in [ios/Runner.xcodeproj/project.pbxproj](/home/mansour/StudioProjects/quran_app/ios/Runner.xcodeproj/project.pbxproj). If you want, I can set up the matching iOS schemes and build configurations next.
