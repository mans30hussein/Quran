import 'package:flutter/material.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/quran_fehres_card.dart';

class ListViewQuranFehresCard extends StatelessWidget {
  const ListViewQuranFehresCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: QuranFehresCard(),
          );
        },
      ),
    );
  }
}
