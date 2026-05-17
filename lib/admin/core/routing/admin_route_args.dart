import 'package:quran_app/admin/home_admin/data/model/program_model.dart';

class ProgramDetailsArgs {
  final ProgramModel program;

  const ProgramDetailsArgs({required this.program});
}

class AddEventArgs {
  final String programId;

  const AddEventArgs({required this.programId});
}
