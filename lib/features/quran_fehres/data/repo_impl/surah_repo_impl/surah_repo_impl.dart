import 'package:quran_app/core/network/api_result.dart';
import 'package:quran_app/core/network/error_handler.dart';
import 'package:quran_app/features/quran_fehres/data/data_source/surah_local_data_source/surah_local_data_source.dart';
import 'package:quran_app/features/quran_fehres/data/data_source/surah_remote_data_source/surah_remote_data_source.dart';
import 'package:quran_app/features/quran_fehres/data/mapper/surah_mapper.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';
import 'package:quran_app/features/quran_fehres/domain/repo/surah_repo.dart';


class SurahRepoImpl implements SurahRepo {
  final SurahApiDataSource _surahApiDataSource;
  final SurahLocalDataSource _surahLocalDataSource;
  SurahRepoImpl(this._surahApiDataSource, this._surahLocalDataSource);

 @override
Future<ApiResult<List<SurahEntity>>> getAllSurahs() async {
  try {
    final response = await _surahApiDataSource.getAllSurahs();
    final surahs = response.data?.map((e) => e.toEntity()).toList() ?? [];

    if (surahs.isNotEmpty) {
      await _surahLocalDataSource.saveSurahs(surahs);
    }

    return ApiResult.success(surahs);
  } catch (e) {
    final localSurahs = _surahLocalDataSource.getAllSurahs();

    if (localSurahs.isNotEmpty) {
      return ApiResult.success(localSurahs);
    }

    return ApiResult.failure(ErrorHandler.handle(e));
  }
}
}
