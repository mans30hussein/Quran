---
name: flutter-dependency-injection
description: >
  A skill for Flutter developers to correctly set up and manage dependency injection
  using get_it. Use this skill whenever a Flutter developer wants to: register a new
  service, repository, cubit, data source, or any class into GetIt; asks how to wire
  up a new feature's DI; shares a dependency_injection.dart file for review or editing;
  asks about registerFactory vs registerLazySingleton; or gets a runtime DI error.
  Trigger on keywords like: get_it, getIt, dependency injection, DI, registerFactory,
  registerLazySingleton, setupDependencies, inject, service locator, add dependency,
  register class, di file, injection file.
  ALWAYS use this skill before writing or editing any dependency_injection.dart file.
---

# Flutter Dependency Injection Skill (GetIt)

A skill for correctly setting up and maintaining `dependency_injection.dart` using `get_it`.

---

## Core Rules (Never Break These)

### 1. Registration Order — Dependencies First
Always register a class **before** any class that depends on it.

```dart
// ✅ Correct
getIt.registerLazySingleton<MyDataSource>(() => MyDataSource(getIt<ApiClient>()));
getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt<MyDataSource>()));
getIt.registerFactory<MyCubit>(() => MyCubit(getIt<MyRepo>()));

// ❌ Wrong — MyRepo tries to get MyDataSource before it's registered
getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt<MyDataSource>()));
getIt.registerLazySingleton<MyDataSource>(() => MyDataSource(getIt<ApiClient>()));
```

### 2. Choosing Registration Type

| Type | Use For | Creates |
|------|---------|---------|
| `registerLazySingleton` | ApiClient, DataSources, Repos, Firebase | One instance, reused forever |
| `registerFactory` | Cubits, BLoCs, ViewModels | New instance every time |
| `registerSingleton` | Rarely needed — prefer Lazy | One instance, created immediately at startup |

**Rule of thumb:**
- Stateless infrastructure → `registerLazySingleton`
- Stateful UI logic (Cubit/BLoC) → `registerFactory`

### 3. Register Abstract Types, Not Implementations (for Repos)

```dart
// ✅ Register by interface — allows easy swapping/testing
getIt.registerLazySingleton<ProgramRepo>(
  () => ProgramRepoImpl(getIt<ProgramRemoteDataSource>()),
);

// ❌ Registers by concrete class — tight coupling
getIt.registerLazySingleton<ProgramRepoImpl>(
  () => ProgramRepoImpl(getIt<ProgramRemoteDataSource>()),
);
```

---

## Standard Feature DI Pattern

When adding a new feature (e.g. `UserProfile`), follow this exact order:

```dart
// Step 1 — Remote Data Source
getIt.registerLazySingleton<UserProfileRemoteDataSource>(
  () => UserProfileRemoteDataSource(getIt<ApiClient>()),
);

// Step 2 — (Optional) Local Data Source
getIt.registerLazySingleton<UserProfileLocalDataSource>(
  () => UserProfileLocalDataSourceImpl(),
);

// Step 3 — Repo (abstract type = interface)
getIt.registerLazySingleton<UserProfileRepo>(
  () => UserProfileRepoImpl(
    getIt<UserProfileRemoteDataSource>(),
    getIt<UserProfileLocalDataSource>(), // only if needed
  ),
);

// Step 4 — Cubit / BLoC
getIt.registerFactory<UserProfileCubit>(
  () => UserProfileCubit(getIt<UserProfileRepo>()),
);
```

---

## Full `setupDependencies` Template

```dart
GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // ── Core ────────────────────────────────────────────────
  final apiClient = await ApiClient.create();
  getIt.registerLazySingleton(() => apiClient);

  // ── Firebase ────────────────────────────────────────────
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // ── Feature: <FeatureName> ──────────────────────────────
  // (repeat this block per feature)
  getIt.registerLazySingleton<FeatureRemoteDataSource>(
    () => FeatureRemoteDataSource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<FeatureRepo>(
    () => FeatureRepoImpl(getIt<FeatureRemoteDataSource>()),
  );
  getIt.registerFactory<FeatureCubit>(
    () => FeatureCubit(getIt<FeatureRepo>()),
  );
}
```

---

## Common Mistakes & Fixes

### ❌ Stale context after Navigator.push
```dart
// ❌ context may be disposed after await
Navigator.push(...).then((result) {
  context.read<MyCubit>().reload();
});

// ✅ Capture cubit before pushing
final cubit = context.read<MyCubit>();
final result = await Navigator.push(...);
if (result == true) cubit.reload();
```

### ❌ Using `registerFactory` for repos/data sources
Repos have no state — creating them repeatedly wastes memory.
Always use `registerLazySingleton` for DataSources and Repos.

### ❌ Calling `getIt<X>()` in global scope
Only call `getIt<X>()` inside a registered factory lambda or inside a widget/cubit, never at the top level of a file.

---

## Review Checklist

When reviewing or writing a DI file, verify:

- [ ] Dependencies registered **before** their dependents
- [ ] Repos registered as **abstract type** (interface), not impl
- [ ] Cubits/BLoCs use `registerFactory`
- [ ] DataSources/Repos/ApiClient use `registerLazySingleton`
- [ ] No duplicate registrations
- [ ] Firebase/external services registered before features that use them
- [ ] Features grouped with a comment (e.g. `// ── Feature: Quran Read ──`)

---

## When Asked to Add a New Dependency

1. Identify the feature name
2. Determine what layers are needed (DataSource? Repo? Cubit?)
3. Find the correct position in the file (after its dependencies)
4. Use the **Standard Feature DI Pattern** above
5. Use the **Review Checklist** before outputting