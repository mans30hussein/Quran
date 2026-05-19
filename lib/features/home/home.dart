import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app/constants/app_colors.dart';
import 'package:quran_app/constants/app_dimens.dart';
import 'package:quran_app/constants/app_text_styles.dart';
import 'package:quran_app/constants/noor_mock_data.dart';

/// Noor user-facing app shell — Task 1: RTL locale + [MaterialApp] setup.
///
/// Run from a `main` entry point:
/// ```dart
/// void main() => runApp(const NoorApp());
/// ```
class NoorApp extends StatelessWidget {
  const NoorApp({super.key});

  static const _localeAr = Locale('ar');
  static const _supportedLocales = [
    _localeAr,
    Locale('en'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نور',
      locale: _localeAr,
      supportedLocales: _supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.screenBackground,
        colorScheme: const ColorScheme.dark(
          surface: AppColors.screenBackground,
          onSurface: AppColors.textPrimary,
        ),
      ),
      home: const NoorHomeShell(),
    );
  }
}

/// Task 2: RTL direction smoke test. Replaced by [HomeScreen] in Task 14.
class NoorHomeShell extends StatelessWidget {
  const NoorHomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NoorMockData.greeting,
                  style: AppTextStyles.greeting,
                ),
                const SizedBox(height: 4),
                Text(
                  NoorMockData.appTitle,
                  style: AppTextStyles.appTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
