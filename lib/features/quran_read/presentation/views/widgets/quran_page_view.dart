import 'package:flutter/material.dart';
import '../../../domain/entity/quran_surah_entity.dart';
import '../../../domain/entity/ayah_entity.dart';
import '../../../../../core/utiles/quran_page_helper.dart';
import 'quran_page_content.dart';

class QuranPageView extends StatefulWidget {
  final List<QuranSurahEntity> surahs;
  final int initialPage;

  const QuranPageView({super.key, required this.surahs, this.initialPage = 1});

  @override
  State<QuranPageView> createState() => _QuranPageViewState();
}

class _QuranPageViewState extends State<QuranPageView> {
  late PageController _pageController;
  late Map<int, List<AyahEntity>> _pages;
  late List<int> _pageNumbers;

  @override
  void initState() {
    super.initState();
    _pages = QuranPageHelper.groupAyahsByPage(widget.surahs);
    _pageNumbers = _pages.keys.toList()..sort();

    // Find the index of the initial page
    int initialIndex = _pageNumbers.indexOf(widget.initialPage);
    if (initialIndex == -1) initialIndex = 0;

    _pageController = PageController(initialPage: initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pageNumbers.length,
        itemBuilder: (context, index) {
          final pageNumber = _pageNumbers[index];
          final ayahs = _pages[pageNumber]!;

          return QuranPageContent(
            pageNumber: pageNumber,
            ayahs: ayahs,
            allSurahs: widget.surahs,
          );
        },
      ),
    );
  }
}
