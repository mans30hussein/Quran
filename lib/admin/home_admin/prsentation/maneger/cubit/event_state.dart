// lib/admin/home_admin/presentation/manager/event_state.dart

import 'package:quran_app/admin/home_admin/data/model/event_model.dart';

abstract class EventState {}

class EventInitial   extends EventState {}
class EventLoading   extends EventState {}

class EventAddSuccess extends EventState {
  final EventModel event;
  EventAddSuccess(this.event);
}

class EventsFetchSuccess extends EventState {
  final List<EventModel> events;
  EventsFetchSuccess(this.events);
}

class EventError extends EventState {
  final String error;
  EventError(this.error);
}