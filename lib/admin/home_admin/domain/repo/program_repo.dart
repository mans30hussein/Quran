
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';

abstract class ProgramRepo {
  Future<ProgramModel> addProgram(ProgramModel programModel);
    Future<List<ProgramModel>> getPrograms(); 

}