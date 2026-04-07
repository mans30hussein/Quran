import '../../domain/entity/ayah_entity.dart';
import '../../domain/entity/quran_surah_entity.dart';
import '../data_source/model/quran_model.dart';

extension AyahMapper on AyahModel {
  AyahEntity toEntity() {
    return AyahEntity(
      text: text ?? '',
      numberAyahInSurah: numberInSurah ?? 0,
      page: page ?? 0,
      juz: juz ?? 0,
    );
  }
}

extension QuranSurahMapper on QuranSurahModel {
  QuranSurahEntity toEntity() {
    return QuranSurahEntity(
      number: number ?? 0,
      name: name ?? '',
      ayahs: ayahs?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension QuranMapper on QuranModel {
  QuranEntity toEntity() {
    return QuranEntity(
      surahs: data?.surahs?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}