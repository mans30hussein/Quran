import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/core/theme/app_colors.dart';

import '../../../core/l10n/app_strings.dart';

import '../../data/remote_data_source/event_remote_data_source.dart';
import '../../data/repo_impl/event_repo_impl.dart';
import '../maneger/cubit/event_cubit.dart';
import '../widget/add_event_view_body.dart';

// ─────────────────────────────────────────────────────────
// Entry — provides the Cubit once, never inside build()
// ─────────────────────────────────────────────────────────
class AddEventScreen extends StatelessWidget {
  final String programId;

  const AddEventScreen({super.key, required this.programId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventCubit>(
      create: (_) => EventCubit(
        EventRepoImpl(EventRemoteDataSource(FirebaseFirestore.instance)),
      ),
      child: Scaffold(
        // backgroundColor: AppColors.b,
        appBar: AppBar(title: const Text(AppStrings.screenTitle)),
        body: AddEventViewBody(programId: programId),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// View — coordinates form controller + BLoC + pickers
// ─────────────────────────────────────────────────────────
