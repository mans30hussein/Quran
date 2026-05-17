import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLength,
    required this.labelText,
    this.minLines,
  });

  final TextEditingController controller;
  final int? maxLength;
  final int? minLines;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength ?? 120,
      minLines: minLines ?? 1,
      maxLines: minLines != null ? null : 1,
      keyboardType: minLines != null
          ? TextInputType.multiline
          : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: labelText,
      ),
    );
  }
}
