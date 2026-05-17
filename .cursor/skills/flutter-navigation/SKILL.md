---
name: flutter-navigation
description: >
  Implements Flutter named routes with onGenerateRoute, typed argument classes,
  and Navigator push/pop/replace patterns. Use when adding screens, navigating,
  passing data between screens, onGenerateRoute, route names, arguments, pushNamed,
  pop, or refactoring direct MaterialPageRoute pushes to centralized routing.
---

# Flutter Navigation (onGenerateRoute)

Use **named routes** with a single `generateRoute` function. Pass data via typed argument classes, not raw maps.

## Adding a new screen

1. Add a route constant in `AppRoutes`.
2. Create an `*Args` class if the screen needs parameters.
3. Add a `case` in `generateRoute` (cast `settings.arguments` to the args type).
4. Navigate with `Navigator.pushNamed` and pass `arguments`.

## Route names

```dart
// app_routes.dart
class AppRoutes {
  static const home    = '/home';
  static const profile = '/profile';
  static const details = '/details';
}
```

## Route generator

```dart
// route_generator.dart
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case AppRoutes.profile:
      final args = settings.arguments as ProfileArgs;
      return MaterialPageRoute(builder: (_) => ProfileScreen(args: args));

    case AppRoutes.details:
      final args = settings.arguments as DetailsArgs;
      return MaterialPageRoute(builder: (_) => DetailsScreen(args: args));

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
```

## MaterialApp

```dart
MaterialApp(
  initialRoute: AppRoutes.home,
  onGenerateRoute: generateRoute,
);
```

Do not mix `routes:` map and `onGenerateRoute` for the same paths—pick one approach.

## Argument classes

Prefer dedicated classes over `Map<String, dynamic>`:

```dart
class ProfileArgs {
  final String userId;
  final String name;

  const ProfileArgs({required this.userId, required this.name});
}
```

Screens that need args should take them via constructor: `ProfileScreen({required this.args})`.

## Navigate and pass arguments

```dart
// Push
Navigator.pushNamed(
  context,
  AppRoutes.profile,
  arguments: const ProfileArgs(userId: '1', name: 'Ahmed'),
);

// Replace current route
Navigator.pushReplacementNamed(context, AppRoutes.home);

// Clear stack and go to route
Navigator.pushNamedAndRemoveUntil(
  context,
  AppRoutes.home,
  (_) => false,
);

// Pop
Navigator.pop(context);

// Pop with result
Navigator.pop(context, true);
```

## Await a result from a pushed screen

```dart
final result = await Navigator.pushNamed<bool>(
  context,
  AppRoutes.details,
  arguments: DetailsArgs(id: itemId),
);

if (result == true && context.mounted) {
  context.read<MyCubit>().refresh();
}
```

On the child screen, return a value when popping: `Navigator.pop(context, true)`.

## Refactoring existing code

When replacing `Navigator.push(context, MaterialPageRoute(...))`:

1. Extract parameters into an `*Args` class.
2. Register the route in `generateRoute`.
3. Replace the push with `Navigator.pushNamed` and `arguments`.

## Conventions

- Route strings: leading slash, lowercase (`/profile`).
- One args class per route that needs parameters; name it `{Screen}Args`.
- Cast arguments in `generateRoute` only—screens receive typed args via constructor.
- Check `context.mounted` after any `await` before using `context` again.
