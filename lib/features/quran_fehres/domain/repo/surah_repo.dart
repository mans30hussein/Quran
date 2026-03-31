import 'package:quran_app/core/network/api_result.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';

abstract class SurahRepo {
  Future<ApiResult<List<SurahEntity>>> getAllSurahs();
}
