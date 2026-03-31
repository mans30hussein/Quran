import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/feature/quran_fehres/ui/views/quran_fehres_view.dart';

void runChatApp({required AppConfig appConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: QuranFehresView()),
    ),
  );
}
