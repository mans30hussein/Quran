import 'package:quran_app/feature/quran_fehres/domain/entity/surah_entity.dart';

sealed class FehresQuranState {}

final class FehresQuranInitial extends FehresQuranState {}

final class FehresQuranLoading extends FehresQuranState {}

final class FehresQuranSuccess extends FehresQuranState {
  final List<SurahEntity> surahs;
  FehresQuranSuccess({required this.surahs});
}

final class FehresQuranError extends FehresQuranState {
  final String message;
  FehresQuranError({required this.message});
}
