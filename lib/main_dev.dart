import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/main.dart';

void main() {
  FlavorConfig.init(
    flavor: Flavor.dev,
    appName: 'Quran Dev',
    bundleId: 'com.quran.app.dev',
    baseUrl: 'https://dev-api.quran.example.com',
  );
  runApp(const MyApp());
}
