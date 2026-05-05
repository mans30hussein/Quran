import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/home_program.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/core/network/api_constants.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/firebase_options.dart';
import 'package:quran_app/run_app.dart';
import 'core/di/dependency_injection.dart';
import 'features/quran_fehres/domain/entity/surah_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    Hive.registerAdapter(SurahEntityAdapter());
    await Hive.openBox<SurahEntity>(TextConstant.kFeaturedsurahBox);
    await setupDependencies();
  } catch (e) {
    runApp(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text("Something went wrong"))),
      ),
    );
  }

  runApp(
    MyApp(
      appConfig: AppConfig(
        apiBaseUrl: ApiConstants.baseUrl,
        environment: AppEnvironment.dev,
      ),
    ),
  );
}
