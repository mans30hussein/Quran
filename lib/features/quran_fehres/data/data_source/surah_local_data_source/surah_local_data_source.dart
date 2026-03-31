import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';

abstract class SurahLocalDataSource {
  List<SurahEntity> getAllSurahs();
} 

class SurahLocalDataSourceImpl implements SurahLocalDataSource {
  @override
  List<SurahEntity> getAllSurahs() {
    // TODO: implement getAllSurahs
    throw UnimplementedError();
  }
}