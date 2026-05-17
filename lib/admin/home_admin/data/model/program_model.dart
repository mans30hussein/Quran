import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramModel {
  final String? id;
  final String title;
  final String desc;
    final String? imageUrl; // ← add this

 
  ProgramModel({
    this.id,
    required this.title,
    required this.desc,
    this.imageUrl,
   });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "desc": desc,
      "imageUrl": imageUrl,
          "createdAt": FieldValue.serverTimestamp(), // ✅ add this

     };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map, String id) {
    return ProgramModel(
      id: id,
      title: map["title"],
      desc: map["desc"],
      imageUrl: map["imageUrl"],
     );
  }
    ProgramModel copyWith({String? id, String? title, String? desc}) {
  return ProgramModel(
    id: id ?? this.id,
    title: title ?? this.title,
    desc: desc ?? this.desc,
    imageUrl: imageUrl ?? this.imageUrl,
  );
}
}