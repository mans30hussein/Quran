import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/colores.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/last_read_card.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/list_view_quran_fehres_card.dart';

class QuranFehresView extends StatelessWidget {
  const QuranFehresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDBD77),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xffFDBD77),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  size: 32,
                  color: AppColors.primaryColor,
                ),
              ),
              centerTitle: true,
              title: Text(
                TextConstant.appTitle,
                style: AppStyles.textStyle24BoldPrimary,
              ),
              //pinned: true,
              elevation: 0,
            ),
            SliverToBoxAdapter(
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
            ),
            const ListViewQuranFehresCard(),
          ],
        ),
      ),
    );
  }
}
