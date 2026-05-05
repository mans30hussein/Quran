import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import 'field_label.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  final Widget? prefixIcon;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),

          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.border, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.borderFocus,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.border, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),

            hintText: hint,
            prefixIcon: prefixIcon != null
                ? IconTheme(
                    data: const IconThemeData(
                      color: AppColors.primary,
                      size: 20,
                    ),
                    child: prefixIcon!,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
