import 'ayah_entity.dart';

class QuranSurahEntity {
  final int number;
  final String name;
  final List<AyahEntity> ayahs;

  QuranSurahEntity({
    required this.number,  // رقم السورة
    required this.name,
    required this.ayahs,
  });
}

class QuranEntity {
  final List<QuranSurahEntity> surahs;

  QuranEntity({required this.surahs});
}