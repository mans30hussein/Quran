---
name: flutter-navigation
description: >
  Help Flutter developers navigate using onGenerateRoute and pass arguments between screens.
  Trigger on: navigate, push, pop, onGenerateRoute, route, arguments, pass data, screen.
---

# Flutter Navigation (onGenerateRoute)

## Route Names

```dart
// app_routes.dart
class AppRoutes {
  static const home    = '/home';
  static const profile = '/profile';
  static const details = '/details';
}
```

## Route Generator

```dart
// route_generator.dart
Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case AppRoutes.profile:
      final args = settings.arguments as ProfileArgs;
      return MaterialPageRoute(builder: (_) => ProfileScreen(args: args));

    case AppRoutes.details:
      final args = settings.arguments as DetailsArgs;
      return MaterialPageRoute(builder: (_) => DetailsScreen(args: args));

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
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

## Argument Classes

```dart
class ProfileArgs {
  final String userId;
  final String name;
  ProfileArgs({required this.userId, required this.name});
}
```

## Navigate & Pass Arguments

```dart
// Push
Navigator.pushNamed(context, AppRoutes.profile,
  arguments: ProfileArgs(userId: '1', name: 'Ahmed'),
);

// Replace
Navigator.pushReplacementNamed(context, AppRoutes.home);

// Clear stack
Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);

// Pop
Navigator.pop(context);

// Pop with result
Navigator.pop(context, true);

// Wait for result
final cubit = context.read<MyCubit>();
final result = await Navigator.pushNamed(context, AppRoutes.details,
  arguments: DetailsArgs(id: '1'),
);
if (result == true) cubit.refresh();
```
