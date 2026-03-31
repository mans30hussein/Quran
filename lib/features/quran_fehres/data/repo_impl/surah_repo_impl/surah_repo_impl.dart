import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/network/api_result.dart';
import 'package:quran_app/core/network/error_handler.dart';
import 'package:quran_app/features/quran_fehres/data/data_source/surah_remote_data_source/surah_remote_data_source.dart';
import 'package:quran_app/features/quran_fehres/data/mapper/surah_mapper.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';
import 'package:quran_app/features/quran_fehres/domain/repo/surah_repo.dart';

import '../../../../../core/network/text_constant.dart';
import '../../../../../core/utiles/function/save_surah_data.dart';

class SurahRepoImpl implements SurahRepo {
  final SurahApiDataSource _surahApiDataSource;
  SurahRepoImpl(this._surahApiDataSource);

  @override
  Future<ApiResult<List<SurahEntity>>> getAllSurahs() async {
    try {
      final response = await _surahApiDataSource.getAllSurahs();
      final surahs = response.data?.map((e) => e.toEntity()).toList() ?? [];
      await saveSurahDate(surahs);
      return ApiResult.success(surahs);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }


}
