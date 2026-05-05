import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/program_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/data/repo_impl/program_repo_impl.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';

import '../maneger/program_cubit.dart';

class AddProgram extends StatefulWidget {
  const AddProgram({super.key});

  @override
  State<AddProgram> createState() => _AddProgramState();
}

class _AddProgramState extends State<AddProgram> {
  late TextEditingController titleController;
  late TextEditingController descController;
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
        appBar: AppBar(title: const Text("Add Program")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocListener<ProgramCubit, ProgramState>(
            listener: (context, state) {
              if (state is ProgramSuccess) {
                // final data = state.programModel;
                // context
                //     .read<ProgramCubit>()
                //     .getProgram(); // or fetchEvents(), loadEvents()
              }
              Navigator.pop(context, true);

              if (state is ProgramError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: BlocBuilder<ProgramCubit, ProgramState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Program",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      SizedBox(height: 40),
                      CustomTextField(
                        labelText: "Title",
                        controller: titleController,
                        maxLength: 10,
                        //    maxLength: 2,
                      ),

                      const SizedBox(height: 12),

                      CustomTextField(
                        labelText: "desc",
                        // maxLength: 6,
                        minLines: 5,
                        controller: descController,
                      ),

                      const SizedBox(height: 50),
                      state is ProgramLoading
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 55),
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                if (titleController.text.isEmpty ||
                                    descController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Fill all fields"),
                                    ),
                                  );
                                  return;
                                }

                                final program = ProgramModel(
                                  title: titleController.text,
                                  desc: descController.text,
                                );

                                context.read<ProgramCubit>().addProgram(
                                  program,
                                );
                              },
                              child: const Text(
                                "Save Data",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLength,
    required this.labelText,
    this.minLines,
  });

  final TextEditingController controller;
  final int? maxLength;
  final int? minLines;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength ?? 120,
      minLines: minLines ?? 1,
      maxLines: minLines != null ? null : 1,
      keyboardType: minLines != null
          ? TextInputType.multiline
          : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: labelText,
      ),
    );
  }
}
