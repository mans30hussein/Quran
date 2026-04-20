import 'package:flutter/material.dart';
import '../../../domain/entity/ayah_entity.dart';
import '../../../domain/entity/quran_surah_entity.dart';
import '../../../../../core/utiles/colores.dart';
import 'surah_header.dart';
import 'ayah_text.dart';

class QuranPageContent extends StatelessWidget {
  final int pageNumber;
  final List<AyahEntity> ayahs;
  final List<QuranSurahEntity> allSurahs;

  const QuranPageContent({
    super.key,
    required this.pageNumber,
    required this.ayahs,
    required this.allSurahs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.quranPageBackground,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //   _buildPageHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildPageContent(),
              ),
            ),
          ),
          _buildPageFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildPageContent() {
    final List<Widget> content = [];
    if (ayahs.isEmpty) return content;

    const String bismillah = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ";
    int? currentSurahNumber;

    for (final ayah in ayahs) {
      final QuranSurahEntity surah = allSurahs.firstWhere(
        (s) => s.ayahs.contains(ayah),
      );
      final bool isNewSurahOnThisPage = currentSurahNumber != surah.number;
      if (isNewSurahOnThisPage) {
        currentSurahNumber = surah.number;
      }

      String ayahText = ayah.text;

      // Show header whenever a new surah starts on this page.
      if (isNewSurahOnThisPage && ayah.numberAyahInSurah == 1) {
        content.add(
          SurahHeader(
            surahName: surah.name,
            ayahCount: surah.ayahs.length,
          ),
        );

        if (ayah.text.contains(bismillah)) {
          content.add(
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 20),
              child: Text(
                bismillah,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Amiri',
                  color: Color(0xFF1E3A8A),
                  height: 2.0,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        }

        ayahText = ayahText.replaceFirst(bismillah, "").trim();
      }

      if (ayahText.isEmpty) {
        continue;
      }

      // Each ayah starts on a new line.
      content.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: AyahText(
            text: ayahText,
            number: ayah.numberAyahInSurah,
          ),
        ),
      );
    }

    return content;
  }
  Widget _buildPageFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        pageNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.quranPageBorder,
        ),
      ),
    );
  }
}
