import 'package:json_annotation/json_annotation.dart';
import 'package:quran_app/feature/quran_fehres/domain/entity/surah_entity.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel {
  int? code;
  String? status;
  List<SurahDataModel>? data;

  SurahModel({this.code, this.status, this.data});
  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}

@JsonSerializable()
class SurahDataModel extends SurahEntity {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  SurahDataModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  }) : super(
         number: number,
         surahName: name,
         numberOfAyahs: numberOfAyahs,
         revelationType: revelationType,
       );

  factory SurahDataModel.fromJson(Map<String, dynamic> json) =>
      _$SurahDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurahDataModelToJson(this);
}
