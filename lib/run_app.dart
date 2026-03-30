

import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';

void runChatApp({ required AppConfig appConfig}) async{
  WidgetsFlutterBinding.ensureInitialized();
//   getIt.registerLazySingleton(() => appConfig);
//  await setupServiceLocator(); 
//  Bloc.observer = AppBlocObserver();
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Quran App"),
      ),
    );
  }
}