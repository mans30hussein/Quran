import 'package:flutter/material.dart';
import 'package:quran_app/core/utiles/colores.dart';
import 'package:quran_app/core/utiles/styles.dart';

class CustomNumOfSurah extends StatelessWidget {
  const CustomNumOfSurah({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color ?? AppColors.primaryColor,
      child: Text("1", style: AppStyles.textStyle14MediumWhite),
    );
  }
}