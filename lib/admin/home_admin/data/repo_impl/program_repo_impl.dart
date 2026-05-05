 
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/program_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/domain/repo/program_repo.dart';

class ProgramRepoImpl extends ProgramRepo {
  final ProgramRemoteDataSource programRemoteDataSource;
  ProgramRepoImpl(this.programRemoteDataSource);

  @override
  Future<ProgramModel> addProgram(ProgramModel programModel) async{
   return await programRemoteDataSource.addProgram(programModel);
  }
  
 @override
Future<List<ProgramModel>> getPrograms() =>
    programRemoteDataSource.getPrograms();
  
}
