import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/network/api_result.dart';
import 'package:quran_app/feature/quran_fehres/ui/cubit/fehres_quran_state.dart';

import '../../data/repo_impl/surah_repo_impl/surah_repo_impl.dart';

class FehresQuranCubit extends Cubit<FehresQuranState> {
  final SurahRepoImpl surahRepoImpl;

  FehresQuranCubit(this.surahRepoImpl) : super(FehresQuranInitial());

  Future<void> getAllSurahs() async {
    emit(FehresQuranLoading());
    final result = await surahRepoImpl.getAllSurahs();

    if (result is Success) {
      emit(FehresQuranSuccess(surahs: (result as Success).data!));
    } else if (result is Failure) {
      emit(FehresQuranError(message: (result as Failure).message));
    }
  }
}
