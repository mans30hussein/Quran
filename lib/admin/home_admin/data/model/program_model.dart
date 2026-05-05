import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramModel {
  final String? id;
  final String title;
  final String desc;
 
  ProgramModel({
    this.id,
    required this.title,
    required this.desc,
   });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "desc": desc,
          "createdAt": FieldValue.serverTimestamp(), // ✅ add this

     };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map, String id) {
    return ProgramModel(
      id: id,
      title: map["title"],
      desc: map["desc"],
     );
  }
    ProgramModel copyWith({String? id, String? title, String? desc}) {
  return ProgramModel(
    id: id ?? this.id,
    title: title ?? this.title,
    desc: desc ?? this.desc,
  );
}
}