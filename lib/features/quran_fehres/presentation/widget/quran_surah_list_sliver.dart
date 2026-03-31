import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran_fehres/presentation/cubit/fehres_quran_cubit.dart';
import 'package:quran_app/features/quran_fehres/presentation/cubit/fehres_quran_state.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/surah_card.dart';
import 'package:quran_app/features/quran_fehres/presentation/widget/surah_card_shimmer.dart';

class QuranSurahListSliver extends StatelessWidget {
  const QuranSurahListSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FehresQuranCubit, FehresQuranState>(
      builder: (context, state) {
        if (state is FehresQuranSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemCount: state.surahs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SurahCard(surahEntity: state.surahs[index]),
                );
              },
            ),
          );
        } else if (state is FehresQuranLoading) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: SurahCardShimmer(),
                );
              },
            ),
          );
        } else if (state is FehresQuranError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
