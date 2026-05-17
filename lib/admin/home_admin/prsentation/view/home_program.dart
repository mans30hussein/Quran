import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_cubit.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_program.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Color(0xff0f2318),
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

                  return Skeletonizer(
                    enabled: state is ProgramLoading,
                    child: ListView.builder(
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
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF152e1e),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0x26c9a227),
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ── Image ──────────────────────────────────
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    item.imageUrl ?? "",
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: 200,
                                      color: const Color(0xFF1a3a28),
                                      child: const Icon(
                                        Icons.mosque,
                                        size: 64,
                                        color: Color(0x80c9a227),
                                      ),
                                    ),
                                    loadingBuilder: (_, child, progress) {
                                      if (progress == null) return child;
                                      return Container(
                                        height: 200,
                                        color: const Color(0xFF1a3a28),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xFFc9a227),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                    
                                // ── Gold bar ───────────────────────────────
                                Container(
                                  height: 3,
                                  color: const Color(0xFFc9a227),
                                ),
                    
                                // ── Content ────────────────────────────────
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.desc,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF8fbfa0),
                                          height: 1.6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
          );
        },
      ),
    );
  }
}
