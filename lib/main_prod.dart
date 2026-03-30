import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/run_app.dart';

void main() {
  AppConfig appConfig = AppConfig(apiBaseUrl:" ApiConstants.baseUrl" , environment: AppEnvironment.prod);
  runChatApp(appConfig: appConfig);
}
