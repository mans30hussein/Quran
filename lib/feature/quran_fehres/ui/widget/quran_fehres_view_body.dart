import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/feature/quran_fehres/ui/views/quran_fehres_view.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/last_read_card.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/list_view_quran_fehres_card.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/quran_fehres_card.dart';

class QuranFehresViewBody extends StatelessWidget {
  const QuranFehresViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Column(
              children: [
                SizedBox(height: 30),
                LastReadCard(),

                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    TextConstant.quranFehres,
                    style: AppStyles.textStyle24BoldPrimary,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        ListViewQuranFehresCard(),
      ],
    );
  }
}
