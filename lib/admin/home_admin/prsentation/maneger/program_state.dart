import 'dart:io';

import '../../data/model/program_model.dart';

abstract class ProgramState {}

class ProgramInitial extends ProgramState {}

class ProgramLoading extends ProgramState {}

class ProgramSuccess extends ProgramState {
  final ProgramModel programModel;
  ProgramSuccess(this.programModel);
}
class ProgramsFetchSuccess extends ProgramState {
  final List<ProgramModel> programs;
  ProgramsFetchSuccess(this.programs);
}
class ProgramError extends ProgramState {
  final String error;
  ProgramError(this.error);
}
class ProgramImagePicked extends ProgramState {
  final File image;
  ProgramImagePicked(this.image);
}
