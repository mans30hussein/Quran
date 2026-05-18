import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/core/l10n/app_strings.dart';
import 'package:quran_app/admin/home_admin/data/remote_data_source/program_remote_data_source.dart';
import 'package:quran_app/admin/home_admin/data/repo_impl/program_repo_impl.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_cubit.dart';
import 'package:quran_app/admin/home_admin/prsentation/maneger/program_state.dart';
import 'package:quran_app/admin/core/routing/admin_route_args.dart';
import 'package:quran_app/admin/core/routing/admin_routes.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/error_view.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/home_program_widget/program_card.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/home_program_widget/program_card_skeleton.dart';
import 'package:quran_app/core/utiles/colores.dart';

import '../../../../core/di/dependency_injection.dart';
// class HomeProgram extends StatelessWidget {
//   const HomeProgram({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ProgramCubit>(
//       create: (_) => getIt<ProgramCubit>()..getProgram(),
//       child: _HomeProgramView(), // 👈 separate widget below
//     );
//   }
// }

// ✅ New private widget — has access to BlocProvider above it
class HomeProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(title: const Text(AppStrings.programTitle)),
      body: BlocBuilder<ProgramCubit, ProgramState>(
        builder: (context, state) {
          if (state is ProgramLoading) return ProgramCardSkeleton();

          if (state is ProgramError) {
            return ErrorView(
              errorText: state.error,
              onPressed: () => context.read<ProgramCubit>().getProgram(),
            );
          }

          if (state is ProgramsFetchSuccess) {
            final programs = state.programs;
            if (programs.isEmpty) {
              return const Center(child: Text("No programs yet."));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: programs.length,
              itemBuilder: (context, index) {
                final item = programs[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AdminRoutes.programDetails,
                    arguments: ProgramDetailsArgs(program: item),
                  ),
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
          final cubit = context.read<ProgramCubit>();
          final result = await Navigator.pushNamed<bool>(
            context,
            AdminRoutes.addProgram,
          );
          if (result == true) cubit.getProgram();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
