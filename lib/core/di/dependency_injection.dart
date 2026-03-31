import 'package:get_it/get_it.dart';
import 'package:quran_app/core/network/api_client.dart';   
import '../../feature/quran_fehres/data/data_source/surah_api_data_source/surah_api_data_source.dart';
import '../../feature/quran_fehres/data/repo_impl/surah_repo_impl/surah_repo_impl.dart';
import '../../feature/quran_fehres/ui/cubit/fehres_quran_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final apiClient = await ApiClient.create();

  getIt.registerLazySingleton(() => apiClient);
   getIt.registerLazySingleton<SurahApiDataSource>(() => SurahApiDataSource(getIt<ApiClient>()));
  getIt.registerLazySingleton<SurahRepoImpl>(
    () => SurahRepoImpl(getIt<SurahApiDataSource>()),
  );
  getIt.registerFactory<FehresQuranCubit>(
    () => FehresQuranCubit(getIt<SurahRepoImpl>()),
  );
}
