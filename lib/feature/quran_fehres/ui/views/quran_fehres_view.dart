import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/di/dependency_injection.dart';
import 'package:quran_app/feature/quran_fehres/data/repo_impl/surah_repo_impl/surah_repo_impl.dart';
import 'package:quran_app/feature/quran_fehres/ui/cubit/fehres_quran_cubit.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/list_view_quran_fehres_card.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/section_appbar_sliver.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/section_last_read_card.dart';

class QuranFehresView extends StatelessWidget {
  const QuranFehresView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FehresQuranCubit>(
      create: (context) => FehresQuranCubit(getIt<SurahRepoImpl>())..getAllSurahs(),
      child: Scaffold(
        backgroundColor: const Color(0xffFDBD77),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SectionAppbarSliver(),
              SectionLastReadCard(),
              const ListViewQuranFehresCard(),
            ],
          ),
        ),
      ),
    );
  }
}
