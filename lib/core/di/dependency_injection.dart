import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app/admin/home_admin/domain/repo/program_repo.dart';
import 'package:quran_app/core/network/api_client.dart';
import 'package:quran_app/features/quran_read/data/data_source/quran_read_remote_data_source/quran_read_remote_data_source.dart';
import 'package:quran_app/features/quran_read/domain/repo/quran_repo.dart';
import '../../admin/home_admin/data/remote_data_source/program_remote_data_source.dart';
import '../../admin/home_admin/data/repo_impl/program_repo_impl.dart';
import '../../admin/home_admin/prsentation/maneger/program_cubit.dart';
import '../../features/quran_fehres/data/data_source/surah_local_data_source/surah_local_data_source.dart';
import '../../features/quran_fehres/data/data_source/surah_remote_data_source/surah_remote_data_source.dart';
import '../../features/quran_fehres/data/repo_impl/surah_repo_impl/surah_repo_impl.dart';
import '../../features/quran_fehres/presentation/cubit/fehres_quran_cubit.dart';
import '../../features/quran_read/data/repo_impl/quran_read_repo_impl.dart';
import '../../features/quran_read/presentation/maneger/cubit/quran_read_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {

  debugPrint('🔧 Starting DI setup...');
  
  final apiClient = await ApiClient.create();
  debugPrint('✅ ApiClient');

  getIt.registerLazySingleton(() => apiClient);
  debugPrint('✅ ApiClient registered');

  getIt.registerLazySingleton<SurahApiDataSource>(
    () => SurahApiDataSource(getIt<ApiClient>()),
  );
  debugPrint('✅ SurahApiDataSource');

  getIt.registerLazySingleton<SurahLocalDataSource>(
    () => SurahLocalDataSourceImpl(),
  );
  debugPrint('✅ SurahLocalDataSource');

  getIt.registerLazySingleton<SurahRepoImpl>(
    () => SurahRepoImpl(getIt<SurahApiDataSource>(), getIt<SurahLocalDataSource>()),
  );
  debugPrint('✅ SurahRepoImpl');

  getIt.registerFactory<FehresQuranCubit>(
    () => FehresQuranCubit(getIt<SurahRepoImpl>()),
  );
  debugPrint('✅ FehresQuranCubit');

  getIt.registerLazySingleton<QuranReadRemoteDataSource>(
    () => QuranReadRemoteDataSource(getIt<ApiClient>()),
  );
  debugPrint('✅ QuranReadRemoteDataSource');

  getIt.registerLazySingleton<QuranRepository>(
    () => QuranReadRepoImpl(getIt<QuranReadRemoteDataSource>()),
  );
  debugPrint('✅ QuranRepository');

  getIt.registerFactory<QuranReadCubit>(
    () => QuranReadCubit(repository: getIt<QuranRepository>()),
  );
  debugPrint('✅ QuranReadCubit');

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  debugPrint('✅ FirebaseFirestore');

  getIt.registerLazySingleton<ProgramRemoteDataSource>(
    () => ProgramRemoteDataSource(getIt<FirebaseFirestore>()),
  );
  debugPrint('✅ ProgramRemoteDataSource');

  getIt.registerLazySingleton<ProgramRepo>(
    () => ProgramRepoImpl(getIt<ProgramRemoteDataSource>()),
  );
  debugPrint('✅ ProgramRepo');

  getIt.registerFactory<ProgramCubit>(
    () => ProgramCubit(getIt<ProgramRepo>()),
  );
  debugPrint('✅ ProgramCubit — DI setup complete!');
}