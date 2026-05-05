import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_cubit.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_program.dart';
import '../../data/remote_data_source/program_remote_data_source.dart';
import '../../data/repo_impl/program_repo_impl.dart';
import 'program_details.dart';

class HomeProgram extends StatelessWidget {
  const HomeProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProgramCubit>(
      create: (_) => ProgramCubit(
        ProgramRepoImpl(ProgramRemoteDataSource(FirebaseFirestore.instance)),
      )..getProgram(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Programs")),
        body: BlocBuilder<ProgramCubit, ProgramState>(
          builder: (context, state) {
            // ── Loading ──────────────────────────────
            if (state is ProgramLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // ── Error ────────────────────────────────
            if (state is ProgramError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 12),
                    Text(state.error, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ProgramCubit>().getProgram(),
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            // ── Success ──────────────────────────────
            if (state is ProgramsFetchSuccess) {
              final programs = state.programs; // ✅ renamed — no shadowing

              if (programs.isEmpty) {
                return const Center(child: Text("No programs yet."));
              }

              return ListView.builder(
                // ✅ moved outside Container
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: programs.length,
                itemBuilder: (context, index) {
                  final item = programs[index]; // ✅ renamed — no shadowing

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProgramDetails(program: item),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title, // ✅ using 'item' not 'program'
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.desc,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddProgram()),
            ).then((result) {
              if (result == true) {
                context
                    .read<ProgramCubit>()
                    .getProgram(); // 👈 called on the correct Cubit
              }
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
