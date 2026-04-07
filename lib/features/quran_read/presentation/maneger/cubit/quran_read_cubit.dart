import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/api_result.dart';
import '../../../domain/entity/quran_surah_entity.dart';
import '../../../domain/repo/quran_repo.dart';
import 'quran_read_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranRepository repository;

  QuranCubit({required this.repository}) : super(QuranInitial());

  Future<void> getQuran() async {
    emit(QuranLoading());

    final result = await repository.getQuran();

    if (result is Success<QuranEntity>) {
      emit(QuranLoaded(result.data));
    } else if (result is Failure<QuranEntity>) {
      emit(QuranError(result.message));
    }
  }

  Future<void> getSurahByNumber(int number) async {
    emit(QuranLoading());

    final result = await repository.getSurahByNumber(number);

    if (result is Success<QuranSurahEntity>) {
      // تقدر تضيف State خاص بالسورة لو عايز
      print(result.data.name);
    } else if (result is Failure<QuranSurahEntity>) {
      emit(QuranError(result.message));
    }
  }
}