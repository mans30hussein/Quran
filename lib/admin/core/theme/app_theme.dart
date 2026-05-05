import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimens.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffold,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.gold,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.textOnPrimary,
      onSurface: AppColors.textPrimary,
    ),

    // ── AppBar ───────────────────────────────────────
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: AppDimens.appBarElevation,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
        letterSpacing: 0.2,
      ),
      iconTheme: IconThemeData(color: AppColors.textOnPrimary),
    ),

    // ── Input ────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTextStyles.hint,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.md,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        borderSide: const BorderSide(
          color: AppColors.border,
          width: AppDimens.inputBorderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        borderSide: const BorderSide(
          color: AppColors.border,
          width: AppDimens.inputBorderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        borderSide: const BorderSide(
          color: AppColors.borderFocus,
          width: AppDimens.inputBorderWidthFocus,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: AppDimens.inputBorderWidth,
        ),
      ),
    ),

    // ── Slider ───────────────────────────────────────
    sliderTheme: const SliderThemeData(
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.primarySurface,
      thumbColor: AppColors.gold,
      overlayColor: Color(0x20B7950B),
      valueIndicatorColor: AppColors.primary,
      valueIndicatorTextStyle: TextStyle(
        color: AppColors.textOnPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // ── Elevated button ──────────────────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        disabledBackgroundColor: AppColors.primaryLight,
        elevation: 0,
        minimumSize: const Size(double.infinity, AppDimens.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
        ),
        textStyle: AppTextStyles.buttonPrimary,
      ),
    ),

    // ── Divider ──────────────────────────────────────
    dividerColor: AppColors.divider,
  );
}
