import 'package:flutter/material.dart';


import '../../../../../core/theme/app_dimens.dart';
import '../../../../../core/theme/app_text_styles.dart';

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.xs),
      child: Text(text, style: AppTextStyles.labelMedium),
    );
  }
}
