import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/surah_number_widget.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/surah_type_image.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({super.key, required this.surahEntity});

  final SurahEntity surahEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SurahNumberWidget(surahEntity: surahEntity),
          const SizedBox(width: 12),
          Text(
            surahEntity.surahName ?? "",
            style: AppStyles.textStyle24BoldPrimary.copyWith(fontSize: 18),
          ),
          const Expanded(child: SizedBox()),
          Column(
            children: [
              Text(
                TextConstant.verses,
                style: AppStyles.textStyle24BoldPrimary.copyWith(fontSize: 12),
              ),
              Text(
                surahEntity.numberOfAyahs.toString(),
                style: AppStyles.textStyle24BoldPrimary.copyWith(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const SurahTypeImage(),
        ],
      ),
    );
  }
}
