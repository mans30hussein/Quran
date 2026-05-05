import 'package:flutter/material.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/home_program.dart';
import 'package:quran_app/app_config/app_config.dart';


// import 'features/quran_read/presentation/views/quran.dart';

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  const MyApp({super.key, required this.appConfig});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeProgram(),
    );
  }
}