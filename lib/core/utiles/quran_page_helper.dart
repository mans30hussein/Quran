import '../../features/quran_read/domain/entity/ayah_entity.dart';
import '../../features/quran_read/domain/entity/quran_surah_entity.dart';

class QuranPageHelper {
  /// Groups all ayahs from all surahs by their page number.
  static Map<int, List<AyahEntity>> groupAyahsByPage(
    List<QuranSurahEntity> surahs,
  ) {
    final Map<int, List<AyahEntity>> pages = {};

    for (var surah in surahs) {
      for (var ayah in surah.ayahs) {
        if (!pages.containsKey(ayah.page)) {
          pages[ayah.page] = [];
        }
        pages[ayah.page]!.add(ayah);
      }
    }

    return pages;
  }

  /// Gets the surah name for a given ayah.
  /// This is useful for the header.
  // static String getSurahNameForAyah(
  //   int ayahNumberInQuran,
  //   List<QuranSurahEntity> surahs,
  // ) {
  //   // This might need a more efficient way if we have many ayahs.
  //   // But for now, we can iterate.
  //   for (var surah in surahs) {
  //     if (surah.ayahs.any((a) => a.numberAyahInSurah == ayahNumberInQuran)) {
  //       return surah.name;
  //     }
  //   }
  //   return "";
  // }

  /// Gets the first page number for a given surah number.
  static int getPageNumberForSurah(
    int surahNumber,
    List<QuranSurahEntity> surahs,
  ) {
    try {
      final surah = surahs.firstWhere((s) => s.number == surahNumber);
      if (surah.ayahs.isNotEmpty) {
        return surah.ayahs.first.page;
      }
    } catch (e) {
      // Surah not found or has no ayahs
    }
    return 1;
  }
}
