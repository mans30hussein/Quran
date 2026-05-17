import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/program_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/data/repo_impl/program_repo_impl.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/custom_text_field.dart';

import '../maneger/program_cubit.dart';

class AddProgram extends StatefulWidget {
  const AddProgram({super.key});

  @override
  State<AddProgram> createState() => _AddProgramState();
}

// add_program.dart

class _AddProgramState extends State<AddProgram> {
  late TextEditingController titleController;
  late TextEditingController descController;
  static const Color _bg   = Color(0xFF1f4a32); // try this
static const Color _card = Color(0xFF2a6040); /// lighter card ✅
  static const Color _gold = Color(0xFFc9a227);
  static const Color _muted = Color(0xFF8fbfa0);
  static const Color _border = Color(0x26c9a227);

  @override
  void initState() {
    titleController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProgramCubit>(
      create: (context) => ProgramCubit(
        ProgramRepoImpl(ProgramRemoteDataSource(FirebaseFirestore.instance)),
      ),
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppBar(
          backgroundColor: _bg,
          elevation: 0,
          iconTheme: const IconThemeData(color: _gold),
          title: const Text(
            'Add Program',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: BlocListener<ProgramCubit, ProgramState>(
          listener: (context, state) {
            if (state is ProgramSuccess) Navigator.pop(context, true);
            if (state is ProgramError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<ProgramCubit, ProgramState>(
            builder: (context, state) {
              final cubit = context.read<ProgramCubit>();
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Header ─────────────────────────────
                    const Text(
                      'Create New Program',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Fill in the details below',
                      style: TextStyle(fontSize: 14, color: _muted),
                    ),
                    const SizedBox(height: 28),

                    // ── Image Picker ────────────────────────
                    GestureDetector(
                      onTap: cubit.pickImage,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _card,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _border, width: 1),
                        ),
                        child: cubit.selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  cubit.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: _gold.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: _gold,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Tap to select image',
                                    style: TextStyle(
                                      color: _muted,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'JPG, PNG supported',
                                    style: TextStyle(
                                      color: Colors.white24,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── Title Field ─────────────────────────
                    const Text(
                      'Program Title',
                      style: TextStyle(
                        color: _muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      maxLength: 10,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter program title',
                        hintStyle: const TextStyle(color: Colors.white24),
                        filled: true,
                        fillColor: _card,
                        counterStyle: const TextStyle(color: _muted),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: _border),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: _border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: _gold,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Description Field ───────────────────
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: _muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descController,
                      maxLength: 120,
                      minLines: 5,
                      maxLines: 8,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter program description',
                        hintStyle: const TextStyle(color: Colors.white24),
                        filled: true,
                        fillColor: _card,
                        counterStyle: const TextStyle(color: _muted),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: _border),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: _border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: _gold,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // ── Save Button ─────────────────────────
                    state is ProgramLoading
                        ? const Center(
                            child: CircularProgressIndicator(color: _gold),
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _gold,
                                foregroundColor: const Color(0xFF0f2318),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {
                                if (titleController.text.isEmpty ||
                                    descController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Fill all fields'),
                                    ),
                                  );
                                  return;
                                }
                                cubit.addProgram(
                                  ProgramModel(
                                    title: titleController.text,
                                    desc: descController.text,
                                  ),
                                );
                              },
                              child: const Text(
                                'Save Program',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
