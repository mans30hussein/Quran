import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/network/api_result.dart';
import 'package:quran_app/features/quran_fehres/domain/repo/surah_repo.dart';
import 'package:quran_app/features/quran_fehres/presentation/cubit/fehres_quran_state.dart';

class FehresQuranCubit extends Cubit<FehresQuranState> {
  final SurahRepo surahRepo;

  FehresQuranCubit(this.surahRepo) : super(FehresQuranInitial());

  Future<void> getAllSurahs() async {
    emit(FehresQuranLoading());
    final result = await surahRepo.getAllSurahs();

    if (result is Success) {
      emit(FehresQuranSuccess(surahs: (result as Success).data));
    } else if (result is Failure) {
      emit(FehresQuranError(message: (result as Failure).message));
    }
  }
}
