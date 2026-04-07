import 'package:get_it/get_it.dart';
import 'package:quran_app/core/network/api_client.dart';
import 'package:quran_app/features/quran_read/data/data_source/quran_read_remote_data_source/quran_read_remote_data_source.dart';
import '../../features/quran_fehres/data/data_source/surah_local_data_source/surah_local_data_source.dart';
import '../../features/quran_fehres/data/data_source/surah_remote_data_source/surah_remote_data_source.dart';
import '../../features/quran_fehres/data/repo_impl/surah_repo_impl/surah_repo_impl.dart';
import '../../features/quran_fehres/presentation/cubit/fehres_quran_cubit.dart';
import '../../features/quran_read/data/repo_impl/quran_read_repo_impl.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final apiClient = await ApiClient.create();

  getIt.registerLazySingleton(() => apiClient);

  getIt.registerLazySingleton<SurahLocalDataSource>(
    () => SurahLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<SurahApiDataSource>(
    () => SurahApiDataSource(getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<SurahRepoImpl>(
    () => SurahRepoImpl(
      getIt<SurahApiDataSource>(),
      getIt<SurahLocalDataSource>(),
    ),
  );

  getIt.registerFactory<FehresQuranCubit>(
    () => FehresQuranCubit(getIt<SurahRepoImpl>()),
  );
  getIt.registerFactory<QuranReadRepoImpl>(
    () => QuranReadRepoImpl(getIt<QuranReadRemoteDataSource>()),
  );
  getIt.registerFactory<QuranReadRemoteDataSource>(
    () => QuranReadRemoteDataSource(getIt<ApiClient>()),
  );
}
