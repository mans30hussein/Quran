import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/last_read_card.dart';

class SectionLastReadCard extends StatelessWidget {
  const SectionLastReadCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const LastReadCard(),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                TextConstant.quranFehres,
                style: AppStyles.textStyle24BoldPrimary,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
