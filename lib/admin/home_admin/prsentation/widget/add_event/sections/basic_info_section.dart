import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_strings.dart';

import '../../../../../core/theme/app_dimens.dart';
import '../shared/app_text_field.dart';
import '../shared/section_header.dart';

class BasicInfoSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;

  const BasicInfoSection({
    super.key,
    required this.titleController,
    required this.descController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: AppStrings.sectionBasicInfo,
          icon: Icons.info_outline_rounded,
        ),
        AppTextField(
          label: AppStrings.labelEventTitle,
          controller: titleController,
          hint: AppStrings.hintEventTitle,
        ),
        const SizedBox(height: AppDimens.md),
        AppTextField(
          label: AppStrings.labelDescription,
          controller: descController,
          hint: AppStrings.hintDescription,
          maxLines: 3,
        ),
      ],
    );
  }
}
