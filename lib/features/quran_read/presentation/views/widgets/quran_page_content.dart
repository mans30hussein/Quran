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
    // 🔥 Build map once (performance optimization)
    final Map<AyahEntity, QuranSurahEntity> ayahToSurahMap = {
      for (var surah in allSurahs)
        for (var ayah in surah.ayahs) ayah: surah
    };

    return Container(
      color: AppColors.quranPageBackground,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: _buildPageContent(ayahToSurahMap),
            ),
          ),
          _buildPageFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildPageContent(
      Map<AyahEntity, QuranSurahEntity> ayahToSurahMap) {
    final List<Widget> content = [];
    if (ayahs.isEmpty) return content;

    int? currentSurahNumber;
    List<TextSpan> currentSurahSpans = [];

    void flushCurrentSurahParagraph() {
      if (currentSurahSpans.isEmpty) return;

      content.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text.rich(
              TextSpan(children: currentSurahSpans),
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Amiri',
                color: Color(0xFF1A1A1A),
                height: 2.2,
              ),
            ),
          ),
        ),
      );

      currentSurahSpans = [];
    }

    for (final ayah in ayahs) {
      final surah = ayahToSurahMap[ayah];
      if (surah == null) continue;

      final bool isNewSurah = currentSurahNumber != surah.number;

      if (isNewSurah) {
        flushCurrentSurahParagraph();
        currentSurahNumber = surah.number;

        // 🔥 Always show header when new surah appears
        content.add(
          SurahHeader(
            surahName: surah.name,
            ayahCount: surah.ayahs.length,
          ),
        );
      }

      String ayahText = _normalizeAyahText(ayah.text);

      // 🔥 Handle Bismillah (except Surah 9)
      if (ayah.numberAyahInSurah == 1 && surah.number != 9) {
        final bismillah = _extractBismillahFromAyah(ayahText);

        if (bismillah != null) {
          content.add(
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
              child: Text(
                bismillah,
                style: const TextStyle(
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

          ayahText = ayahText.replaceFirst(bismillah, "").trim();
        }
      }

      if (ayahText.isEmpty) continue;

      currentSurahSpans.add(
        AyahText.buildSpan(
          text: ayahText,
          number: ayah.numberAyahInSurah,
        ),
      );

      // 🔥 spacing between ayahs
      currentSurahSpans.add(const TextSpan(text: " "));
    }

    flushCurrentSurahParagraph();

    return content;
  }

  String _normalizeAyahText(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  String? _extractBismillahFromAyah(String ayahText) {
    const variants = [
      "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
      "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
      "بسم الله الرحمن الرحيم",
    ];

    for (final v in variants) {
      if (ayahText.contains(v)) return v;
    }
    return null;
  }

  Widget _buildPageFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            pageNumber.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.quranPageBorder,
            ),
          ),
        ),
      ),
    );
  }
}