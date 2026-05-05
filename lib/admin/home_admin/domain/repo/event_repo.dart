// lib/admin/home_admin/domain/repo/event_repo.dart

import 'package:quran_app/admin/home_admin/data/model/event_model.dart';

abstract class EventRepo {
  Future<EventModel> addEvent(EventModel event);
  Future<List<EventModel>> getEventsByProgram(String programId);
}