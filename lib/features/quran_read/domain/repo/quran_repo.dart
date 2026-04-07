import '../../../../core/network/api_result.dart';
import '../entity/quran_surah_entity.dart';

abstract class QuranRepository {

  Future<ApiResult<QuranEntity>> getQuran();

  Future<ApiResult<QuranSurahEntity>> getSurahByNumber(int number);
}