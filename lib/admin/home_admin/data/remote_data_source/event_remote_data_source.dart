// lib/admin/home_admin/data/remote_data_source/event_remote_data_source.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quran_app/admin/home_admin/data/model/event_model.dart';

class EventRemoteDataSource {
  final FirebaseFirestore firestore;

  EventRemoteDataSource(this.firestore);

  // Events are stored as a subcollection under each program
  // programs/{programId}/events/{eventId}

  Future<EventModel> addEvent(EventModel event) async {
    final docRef = await firestore
        .collection('programs')
        .doc(event.programId)
        .collection('events')
        .add(event.toMap());

    return event.copyWith(id: docRef.id);
  }

  Future<List<EventModel>> getEventsByProgram(String programId) async {
    final snapshot = await firestore
        .collection('programs')
        .doc(programId)
        .collection('events')
        .orderBy('scheduledAt')
        .get();

    return snapshot.docs
        .map((doc) => EventModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}