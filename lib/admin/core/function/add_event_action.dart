import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/core/theme/app_colors.dart';

import '../../home_admin/data/model/event_model.dart';
import '../../home_admin/prsentation/maneger/cubit/event_cubit.dart';
import '../../home_admin/prsentation/widget/add_event/add_event_form_controller.dart';
import '../l10n/app_strings.dart';
import '../theme/app_dimens.dart';

abstract class AddEventActions {
  // ── Date picker ───────────────────────────────────────
  static Future<void> pickDate({
    required BuildContext context,
    required AddEventFormController form,
    required VoidCallback onPicked,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => _pickerTheme(context, child),
    );
    if (picked != null) {
      form.selectedDate = picked;
      onPicked();
    }
  }

  // ── Time picker ───────────────────────────────────────
  static Future<void> pickTime({
    required BuildContext context,
    required AddEventFormController form,
    required VoidCallback onPicked,
  }) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => _pickerTheme(context, child),
    );
    if (picked != null) {
      form.selectedTime = picked;
      onPicked();
    }
  }

  // ── Submit ────────────────────────────────────────────
  static void submit({
    required BuildContext context,
    required AddEventFormController form,
    required String programId,
  }) {
    if (!form.isValid) {
      _showSnackBar(context, AppStrings.validationFillAll);
      return;
    }

    context.read<EventCubit>().addEvent(
      EventModel(
        eventTitle: form.eventTitle.text.trim(),
        desc: form.desc.text.trim(),
        programId: programId,
        zoomLink: form.zoomLink.text.trim(),
        scheduledAt: form.scheduledAt,
        durationMinutes: form.durationMinutes,
      ),
    );
  }

  // ── Shared error snackbar ─────────────────────────────
  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message);
  }

  // ── Private helpers ───────────────────────────────────
  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
      ),
    );
  }

  static Widget _pickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.textOnPrimary,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
        ),
      ),
      child: child!,
    );
  }
}
