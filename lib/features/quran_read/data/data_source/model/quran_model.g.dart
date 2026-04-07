// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranModel _$QuranModelFromJson(Map<String, dynamic> json) => QuranModel(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : QuranDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuranModelToJson(QuranModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

QuranDataModel _$QuranDataModelFromJson(Map<String, dynamic> json) =>
    QuranDataModel(
      surahs: (json['surahs'] as List<dynamic>?)
          ?.map((e) => QuranSurahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      edition: json['edition'] == null
          ? null
          : EditionModel.fromJson(json['edition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuranDataModelToJson(QuranDataModel instance) =>
    <String, dynamic>{
      'surahs': instance.surahs,
      'edition': instance.edition,
    };

QuranSurahModel _$QuranSurahModelFromJson(Map<String, dynamic> json) =>
    QuranSurahModel(
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => AyahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuranSurahModelToJson(QuranSurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'ayahs': instance.ayahs,
    };

AyahModel _$AyahModelFromJson(Map<String, dynamic> json) => AyahModel(
      number: (json['number'] as num?)?.toInt(),
      text: json['text'] as String?,
      numberInSurah: (json['numberInSurah'] as num?)?.toInt(),
      juz: (json['juz'] as num?)?.toInt(),
      manzil: (json['manzil'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      ruku: (json['ruku'] as num?)?.toInt(),
      hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
      sajda: json['sajda'],
    );

Map<String, dynamic> _$AyahModelToJson(AyahModel instance) => <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };

EditionModel _$EditionModelFromJson(Map<String, dynamic> json) => EditionModel(
      identifier: json['identifier'] as String?,
      language: json['language'] as String?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$EditionModelToJson(EditionModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'format': instance.format,
      'type': instance.type,
    };
