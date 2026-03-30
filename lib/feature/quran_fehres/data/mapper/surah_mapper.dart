import 'package:quran_app/feature/quran_fehres/data/model/surah_model/surah_model.dart';
import 'package:quran_app/feature/quran_fehres/domain/entity/surah_entity.dart';

extension SurahMapper on SurahDataModel {
  SurahEntity toEntity() {
    return SurahEntity(
      number: number,
      surahName: name,
      numberOfAyahs: numberOfAyahs,
      revelationType: revelationType,
    );
  }
}
