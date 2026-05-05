// lib/admin/home_admin/presentation/manager/event_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/data/model/event_model.dart';
import 'package:quran_app/admin/home_admin/domain/repo/event_repo.dart';
import 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepo repository;

  EventCubit(this.repository) : super(EventInitial());

  Future<void> addEvent(EventModel event) async {
    if (state is EventLoading) return;
    emit(EventLoading());
    try {
      final saved = await repository.addEvent(event);
      emit(EventAddSuccess(saved));
    } catch (e) {
      emit(EventError('Failed to save event. Please try again.'));
    }
  }

  Future<void> getEventsByProgram(String programId) async {
    if (state is EventLoading) return;
    emit(EventLoading());
    try {
      final events = await repository.getEventsByProgram(programId);
      emit(EventsFetchSuccess(events));
    } catch (e) {
      emit(EventError('Failed to load events.'));
    }
  }
}