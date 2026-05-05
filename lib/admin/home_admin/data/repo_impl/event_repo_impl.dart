// lib/admin/home_admin/data/repo_impl/event_repo_impl.dart

import 'package:quran_app/admin/home_admin/data/model/event_model.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/event_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/domain/repo/event_repo.dart';

class EventRepoImpl extends EventRepo {
  final EventRemoteDataSource dataSource;

  EventRepoImpl(this.dataSource);

  @override
  Future<EventModel> addEvent(EventModel event) =>
      dataSource.addEvent(event);

  @override
  Future<List<EventModel>> getEventsByProgram(String programId) =>
      dataSource.getEventsByProgram(programId);
}