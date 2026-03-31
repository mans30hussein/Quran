import 'package:flutter/material.dart';
import 'package:quran_app/core/utiles/colores.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';

class SurahNumberWidget extends StatelessWidget {
  const SurahNumberWidget({super.key, this.color, required this.surahEntity});
  final Color? color;
  final SurahEntity surahEntity;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color ?? AppColors.primaryColor,
      child: Text(
        surahEntity.number.toString(),
        style: AppStyles.textStyle14MediumWhite,
      ),
    );
  }
}
