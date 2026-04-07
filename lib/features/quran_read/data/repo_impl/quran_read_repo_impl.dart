import 'package:quran_app/core/network/api_result.dart';


import '../mapper/quran_mapper.dart';
import '../data_source/quran_read_remote_data_source/quran_read_remote_data_source.dart';
import '../../domain/repo/quran_repo.dart';
import '../../domain/entity/quran_surah_entity.dart';

class QuranReadRepoImpl implements QuranRepository {
  final QuranReadRemoteDataSource quranReadRemoteDataSource;

  QuranReadRepoImpl(this.quranReadRemoteDataSource);

  @override
  Future<ApiResult<QuranEntity>> getQuran() async {
    try {
      final response = await quranReadRemoteDataSource.getQuran();

     final entity = response.toEntity();

      return ApiResult.success(entity);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<QuranSurahEntity>> getSurahByNumber(int number) async {
    try {
      final response = await quranReadRemoteDataSource.getSurahByNumber(number);

      final entity = response.toEntity();

      return ApiResult.success(entity);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}