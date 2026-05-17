 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/core/l10n/app_strings.dart';
 import 'package:quran_app/admin/home_admin/prsentation/maneger/program_cubit.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';
import 'package:quran_app/admin/core/routing/admin_route_args.dart';
import 'package:quran_app/admin/core/routing/admin_routes.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/error_view.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/home_program_widget/program_card.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/home_program_widget/program_card_skeleton.dart';
 import 'package:quran_app/core/utiles/colores.dart';
 import '../../../../core/di/dependency_injection.dart';

class HomeProgram extends StatelessWidget {
  const HomeProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProgramCubit>(
      create: (_) => getIt<ProgramCubit>()..getProgram(),
      child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(title: const Text(AppStrings.programTitle)),
            body: BlocBuilder<ProgramCubit, ProgramState>(
              builder: (context, state) {
                // ── Loading ──────────────────────────────
                if (state is ProgramLoading) {
                  return ProgramCardSkeleton();
                }

                // ── Error ────────────────────────────────
                if (state is ProgramError) {
                  return ErrorView(
                    errorText: state.error,
                    onPressed: () =>
                        context.read<ProgramCubit>().getProgram(),
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
                          Navigator.pushNamed(
                            context,
                            AdminRoutes.programDetails,
                            arguments: ProgramDetailsArgs(program: item),
                          );
                        },
                        child: ProgramCard(item: item),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.pushNamed<bool>(
                  context,
                  AdminRoutes.addProgram,
                );
                if (result == true && context.mounted) {
                  context.read<ProgramCubit>().getProgram();
                }
              },
              child: const Icon(Icons.add),
            ),
          )
      
    );
  }
}
