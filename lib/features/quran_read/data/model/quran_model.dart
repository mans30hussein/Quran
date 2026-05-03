import 'package:json_annotation/json_annotation.dart';

part 'quran_model.g.dart';


@JsonSerializable()
class QuranModel {
  int? code;
  String? status;
  QuranDataModel? data;

  QuranModel({this.code, this.status, this.data});

  factory QuranModel.fromJson(Map<String, dynamic> json) =>
      _$QuranModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranModelToJson(this);
}


@JsonSerializable()
class QuranDataModel {
  List<QuranSurahModel>? surahs;
  EditionModel? edition;

  QuranDataModel({this.surahs, this.edition});

  factory QuranDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuranDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranDataModelToJson(this);
}

@JsonSerializable()
class QuranSurahModel {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<AyahModel>? ayahs;

  QuranSurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory QuranSurahModel.fromJson(Map<String, dynamic> json) =>
      _$QuranSurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranSurahModelToJson(this);
}

@JsonSerializable()
class AyahModel {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic sajda;

  AyahModel({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) =>
      _$AyahModelFromJson(json);

  Map<String, dynamic> toJson() => _$AyahModelToJson(this);
}

@JsonSerializable()
class EditionModel {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;

  EditionModel({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory EditionModel.fromJson(Map<String, dynamic> json) =>
      _$EditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditionModelToJson(this);
}