import 'package:flutter/material.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/quran_fehres_card.dart';

class ListViewQuranFehresCard extends StatelessWidget {
  const ListViewQuranFehresCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 114,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: QuranFehresCard(),
          );
        },
      ),
    );
  }
}
