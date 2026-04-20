import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/features/quran_fehres/presentation/views/quran_fehres_view.dart';

// import 'features/quran_read/presentation/views/quran.dart';

void runChatApp({required AppConfig appConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: QuranFehresView()),
    ),
  );
}
