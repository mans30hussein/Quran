import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/core/network/api_constants.dart';
import 'package:quran_app/run_app.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  AppConfig appConfig = AppConfig(
    apiBaseUrl: ApiConstants.baseUrl,
    environment: AppEnvironment.dev,
  );
  await setupDependencies();
  runChatApp(appConfig: appConfig);
}
