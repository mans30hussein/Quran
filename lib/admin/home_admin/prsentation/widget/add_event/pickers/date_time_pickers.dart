import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_dimens.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../shared/field_label.dart';

class DatePickerButton extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onTap;

  const DatePickerButton({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  String get _display {
    if (selectedDate == null) return AppStrings.hintPickDate;
    return '${selectedDate!.day.toString().padLeft(2, '0')}/'
        '${selectedDate!.month.toString().padLeft(2, '0')}/'
        '${selectedDate!.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel(AppStrings.labelDate),
        _PickerButton(
          icon: Icons.calendar_today_rounded,
          label: _display,
          isSelected: selectedDate != null,
          onTap: onTap,
        ),
      ],
    );
  }
}

class TimePickerButton extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onTap;

  const TimePickerButton({
    super.key,
    required this.selectedTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel(AppStrings.labelTime),
        _PickerButton(
          icon: Icons.access_time_rounded,
          label: selectedTime == null
              ? AppStrings.hintPickTime
              : selectedTime!.format(context),
          isSelected: selectedTime != null,
          onTap: onTap,
        ),
      ],
    );
  }
}

// ── Internal shared button ────────────────────────────────
class _PickerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PickerButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.pickerHeight,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 16,
          color: isSelected ? AppColors.gold : AppColors.textDisabled,
        ),
        label: Text(
          label,
          style: isSelected
              ? AppTextStyles.pickerLabel
              : AppTextStyles.hint.copyWith(fontSize: 13),
        ),
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: AppColors.surface,
          side: BorderSide(
            color: isSelected ? AppColors.borderFocus : AppColors.border,
            width: isSelected
                ? AppDimens.inputBorderWidthFocus
                : AppDimens.inputBorderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          ),
        ),
      ),
    );
  }
}
