import 'package:hive_flutter/adapters.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/core/network/api_constants.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/run_app.dart';

import 'core/di/dependency_injection.dart';
import 'features/quran_fehres/domain/entity/surah_entity.dart';

void main() async {
  AppConfig appConfig = AppConfig(
    apiBaseUrl: ApiConstants.baseUrl,
    environment: AppEnvironment.dev,
  );

  await setupDependencies();
  Hive.initFlutter();
  Hive.registerAdapter(SurahEntityAdapter());
  await Hive.openBox(TextConstant.kFeaturedsurahBox);
  runChatApp(appConfig: appConfig);
}
