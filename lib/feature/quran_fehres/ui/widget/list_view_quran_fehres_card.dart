import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/quran_fehres/ui/cubit/fehres_quran_cubit.dart';
import 'package:quran_app/feature/quran_fehres/ui/cubit/fehres_quran_state.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/quran_fehres_card.dart';

class ListViewQuranFehresCard extends StatelessWidget {
  const ListViewQuranFehresCard({super.key});

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
                  child: QuranFehresCard(surahEntity: state.surahs[index]),
                );
              },
            ),
          );
        } 
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
