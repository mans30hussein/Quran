class AyahEntity {
  final String text;
  final int numberAyahInSurah;  // رقم الآية في السورة
  final int page;  // عدد الصفحة في الكتاب
  final int juz;  // عدد الجزء في الكتاب

  AyahEntity({
    required this.text,
    required this.numberAyahInSurah,
    required this.page,
    required this.juz,
  });
}