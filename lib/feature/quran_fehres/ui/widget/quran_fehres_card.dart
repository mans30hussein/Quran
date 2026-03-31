import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/custom_image_macc_or_madina.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/custom_num_of_surah.dart';

class QuranFehresCard extends StatelessWidget {
  const QuranFehresCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CustomNumOfSurah(),
          SizedBox(width: 12),
          Text(
            TextConstant.surahName,
            style: AppStyles.textStyle24BoldPrimary.copyWith(fontSize: 18),
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              Text(
                TextConstant.verses,
                style: AppStyles.textStyle24BoldPrimary.copyWith(fontSize: 12),
              ),

              Text(
                TextConstant.numberOfAyahs,
                style: AppStyles.textStyle24BoldPrimary.copyWith(fontSize: 12),
              ),
            ],
          ),
          SizedBox(width: 16),
          CustomImageMaccOrMadina(),
        ],
      ),
    );
  }
}
