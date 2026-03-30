import 'package:json_annotation/json_annotation.dart';

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
class SurahDataModel {
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
  });

  factory SurahDataModel.fromJson(Map<String, dynamic> json) =>
      _$SurahDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurahDataModelToJson(this);

  
}
