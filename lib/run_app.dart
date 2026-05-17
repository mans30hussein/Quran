import 'package:flutter/material.dart';
import 'package:quran_app/admin/core/admin_app.dart';
import 'package:quran_app/app_config/app_config.dart';

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  const MyApp({super.key, required this.appConfig});

  @override
  Widget build(BuildContext context) {
    return AdminApp(appConfig: appConfig);
  }
}
