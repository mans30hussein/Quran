import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/domain/repo/program_repo.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';

import '../../../core/cloudinary_service.dart';

class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepo repository;

  ProgramCubit(this.repository) : super(ProgramInitial());

File? selectedImage; // ← add this

  // ← add this method
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (picked != null) {
      selectedImage = File(picked.path);
      emit(ProgramImagePicked(selectedImage!));
    }
  }

  Future<void> addProgram(ProgramModel program) async {
    try {
      emit(ProgramLoading());

      // upload image if selected
      String? imageUrl;
      if (selectedImage != null) {
        imageUrl = await CloudinaryService.uploadImage(selectedImage!);
      }

      // add imageUrl to program
      final updatedProgram = ProgramModel(
        title   : program.title,
        desc    : program.desc,
        imageUrl: imageUrl,
      );

      await repository.addProgram(updatedProgram);
      emit(ProgramSuccess(updatedProgram));
    } catch (e) {
      emit(ProgramError(e.toString()));
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
 

