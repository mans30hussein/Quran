import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/colores.dart';
import 'package:quran_app/core/utiles/styles.dart';

class LastReadCard extends StatelessWidget {
  const LastReadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 212,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TextConstant.lastRead, style: AppStyles.textStyle14MediumWhite),
          SizedBox(height: 8),
          Text(
            TextConstant.lastReadSurahName,
            style: AppStyles.textStyle24BoldPrimary.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 8),
          Text("Ayah 255 • Juz 3", style: AppStyles.textStyle14MediumWhite),
        ],
      ),
    );
  }
}
