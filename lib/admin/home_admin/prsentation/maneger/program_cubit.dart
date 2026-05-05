import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/domain/repo/program_repo.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepo repository;

  ProgramCubit(this.repository) : super(ProgramInitial());

  Future<void> addProgram(ProgramModel programModel) async {
    emit(ProgramLoading());

    try {
      final data = await repository.addProgram(programModel);
      emit(ProgramSuccess(data));
    } catch (e) {
      emit(ProgramError("Failed to upload programs."));
    }
  }

  Future<void> getProgram() async{
    if (state is ProgramLoading) return;
    emit(ProgramLoading());
    try {
    final programs = await repository.getPrograms();
    emit(ProgramsFetchSuccess(programs));
  } catch (e) {
    emit(ProgramError("Failed to load programs."));
  }
  }
}
