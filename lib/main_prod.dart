import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/main.dart';

void main() {
  FlavorConfig.init(
    flavor: Flavor.prod,
    appName: 'Quran',
    bundleId: 'com.quran.app',
    baseUrl: 'https://api.quran.example.com',
  );
  runApp(const MyApp());
}
