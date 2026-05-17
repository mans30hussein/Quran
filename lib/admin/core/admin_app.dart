import 'package:flutter/material.dart';
import 'package:quran_app/admin/core/routing/admin_route_generator.dart';
import 'package:quran_app/admin/core/routing/admin_routes.dart';
import 'package:quran_app/app_config/app_config.dart';

class AdminApp extends StatelessWidget {
  final AppConfig appConfig;

  const AdminApp({super.key, required this.appConfig});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AdminRoutes.home,
      onGenerateRoute: generateAdminRoute,
    );
  }
}
