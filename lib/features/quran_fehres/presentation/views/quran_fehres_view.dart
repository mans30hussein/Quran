import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/di/dependency_injection.dart';
import 'package:quran_app/features/quran_fehres/data/repo_impl/surah_repo_impl/surah_repo_impl.dart';
import 'package:quran_app/features/quran_fehres/presentation/cubit/fehres_quran_cubit.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/fehres_sliver_app_bar.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/last_read_section_sliver.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/quran_surah_list_sliver.dart';

class QuranFehresView extends StatelessWidget {
  const QuranFehresView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FehresQuranCubit>(
      create: (context) =>
          FehresQuranCubit(getIt<SurahRepoImpl>())..getAllSurahs(),
      child: Scaffold(
        backgroundColor: const Color(0xffFDBD77),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const FehresSliverAppBar(),
              const LastReadSectionSliver(),
              const QuranSurahListSliver(),
            ],
          ),
        ),
      ),
    );
  }
}
