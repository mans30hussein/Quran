import 'package:quran_app/feature/quran_fehres/domain/entity/surah_entity.dart';

abstract class SurahRepo {
  Future<List<SurahEntity>> getAllSurahs();
}