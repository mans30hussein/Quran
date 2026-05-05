import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_strings.dart';
import '../../../../../core/theme/app_dimens.dart';
import '../pickers/date_time_pickers.dart';
import '../shared/duration_slider.dart';
import '../shared/section_header.dart';

class ScheduleSection extends StatelessWidget {
  final DateTime?       selectedDate;
  final TimeOfDay?      selectedTime;
  final int             durationMinutes;
  final String          formattedDuration;
  final VoidCallback    onPickDate;
  final VoidCallback    onPickTime;
  final ValueChanged<int> onDurationChanged;

  const ScheduleSection({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.durationMinutes,
    required this.formattedDuration,
    required this.onPickDate,
    required this.onPickTime,
    required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: AppStrings.sectionSchedule,
          icon: Icons.event_rounded,
        ),
        Row(
          children: [
            Expanded(
              child: DatePickerButton(
                selectedDate: selectedDate,
                onTap: onPickDate,
              ),
            ),
            const SizedBox(width: AppDimens.sm),
            Expanded(
              child: TimePickerButton(
                selectedTime: selectedTime,
                onTap: onPickTime,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.md),
        DurationSlider(
          minutes: durationMinutes,
          formatted: formattedDuration,
          onChanged: onDurationChanged,
        ),
      ],
    );
  }
}
