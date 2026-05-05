import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';

import '../repo_impl/constant/fire_store_constant.dart';
 
class ProgramRemoteDataSource {
  final FirebaseFirestore firestore;

  ProgramRemoteDataSource(this.firestore);

  Future<ProgramModel> addProgram(ProgramModel programModel) async {
    final docRef = await firestore
        .collection("addProgram")
        .add(programModel.toMap());

    return programModel.copyWith(id: docRef.id);
  }
Future<List<ProgramModel>> getPrograms() async {
  final snapshot = await firestore
      .collection(FireStoreConstant.programCollection)
      .orderBy('createdAt', descending: true)
      .get();

  return snapshot.docs
      .map((doc) => ProgramModel.fromMap(doc.data(), doc.id))
      .toList();
}
}
