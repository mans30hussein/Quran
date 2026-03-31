
import 'package:hive_flutter/adapters.dart';
part 'surah_entity.g.dart';
@HiveType(typeId: 0)
class SurahEntity {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? surahName;
  @HiveField(2)
  final int? numberOfAyahs;
  @HiveField(3)
  final String? revelationType;

  SurahEntity({
    this.number,
    this.surahName,
    this.numberOfAyahs,
    this.revelationType,
  });
}
