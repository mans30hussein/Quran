import '../../../domain/entity/quran_surah_entity.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final QuranEntity quran;
  QuranLoaded(this.quran);
}

class QuranError extends QuranState {
  final String message;
  QuranError(this.message);
}