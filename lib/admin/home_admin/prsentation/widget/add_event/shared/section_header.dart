import 'package:flutter/material.dart';
import 'package:quran_app/admin/core/theme/app_colors.dart';
import 'package:quran_app/admin/core/theme/app_text_styles.dart';

import '../../../../../core/theme/app_dimens.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.md),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: AppDimens.sectionIconSize),
          const SizedBox(width: AppDimens.sm),
          Text(title, style: AppTextStyles.headingSmall),
          const SizedBox(width: AppDimens.sm),
          const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1),
          ),
        ],
      ),
    );
  }
}
