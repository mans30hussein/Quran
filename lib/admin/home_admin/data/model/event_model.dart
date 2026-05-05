// lib/admin/home_admin/data/model/event_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String? id;
  final String contentTitle;
  final String eventTitle;
  final String desc;
  final String programId;
  final String zoomLink;
  final DateTime scheduledAt;
  final int durationMinutes;

  const EventModel({
    this.id,
    required this.contentTitle,
    required this.eventTitle,
    required this.desc,
    required this.programId,
    required this.zoomLink,
    required this.scheduledAt,
    required this.durationMinutes,
  });

  Map<String, dynamic> toMap() => {
    'contentTitle': contentTitle,
    'eventTitle': eventTitle,
    'desc': desc,
    'programId': programId,
    'zoomLink': zoomLink,
    'scheduledAt': Timestamp.fromDate(scheduledAt),
    'durationMinutes': durationMinutes,
    'createdAt': FieldValue.serverTimestamp(),
  };

  factory EventModel.fromMap(Map<String, dynamic> map, String id) =>
    EventModel(
      id: id,
      contentTitle: map['contentTitle'] as String? ?? '',
      eventTitle:   map['eventTitle']   as String? ?? '',
      desc:         map['desc']         as String? ?? '',
      programId:    map['programId']    as String? ?? '',
      zoomLink:     map['zoomLink']     as String? ?? '',
      scheduledAt:  (map['scheduledAt'] as Timestamp).toDate(),
      durationMinutes: map['durationMinutes'] as int? ?? 60,
    );

  EventModel copyWith({
    String? id, String? contentTitle, String? eventTitle,
    String? desc, String? programId, String? zoomLink,
    DateTime? scheduledAt, int? durationMinutes,
  }) => EventModel(
    id: id ?? this.id,
    contentTitle: contentTitle ?? this.contentTitle,
    eventTitle:   eventTitle   ?? this.eventTitle,
    desc:         desc         ?? this.desc,
    programId:    programId    ?? this.programId,
    zoomLink:     zoomLink     ?? this.zoomLink,
    scheduledAt:  scheduledAt  ?? this.scheduledAt,
    durationMinutes: durationMinutes ?? this.durationMinutes,
  );
}