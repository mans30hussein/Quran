
import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'field_label.dart';

class DurationSlider extends StatelessWidget {
  final int minutes;
  final String formatted;
  final ValueChanged<int> onChanged;

  const DurationSlider({
    super.key,
    required this.minutes,
    required this.formatted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const FieldLabel(AppStrings.labelDuration),
            const SizedBox(width: 6),
            Text(formatted, style: AppTextStyles.durationValue),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.primarySurface,
            thumbColor: AppColors.gold,
            overlayColor: const Color(0x20B7950B),
            valueIndicatorColor: AppColors.primary,
            valueIndicatorTextStyle: const TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: Slider(
            value: minutes.toDouble(),
            min: 15,
            max: 480,
            divisions: 31,
            label: formatted,
            onChanged: (v) => onChanged(v.round()),
          ),
        ),
      ],
    );
  }
}
