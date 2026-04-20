import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/repo_impl/quran_read_repo_impl.dart';
import '../maneger/cubit/quran_read_cubit.dart';
import '../maneger/cubit/quran_read_state.dart';
import '../../../../core/utiles/quran_page_helper.dart';
import 'widgets/quran_page_view.dart';

class QuranTestScreen extends StatelessWidget {
  final int? initialSurahNumber;
  const QuranTestScreen({super.key, this.initialSurahNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<QuranCubit>(
        create: (context) =>
            QuranCubit(repository: getIt<QuranReadRepoImpl>())..getQuran(),
        child: BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is QuranLoaded) {
              int initialPage = 1;
              if (initialSurahNumber != null) {
                initialPage = QuranPageHelper.getPageNumberForSurah(
                  initialSurahNumber!,
                  state.quran.surahs,
                );
              }
              return QuranPageView(
                surahs: state.quran.surahs,
                initialPage: initialPage,
              );
            }

            if (state is QuranError) {
              return Center(child: Text(state.message));
            }

            return const Center(child: Text("Press button to load data"));
          },
        ),
      ),

      
    );
  }
}
