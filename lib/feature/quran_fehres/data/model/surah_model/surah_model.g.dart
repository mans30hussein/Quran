// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => SurahDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

SurahDataModel _$SurahDataModelFromJson(Map<String, dynamic> json) =>
    SurahDataModel(
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      numberOfAyahs: (json['numberOfAyahs'] as num?)?.toInt(),
      revelationType: json['revelationType'] as String?,
    );

Map<String, dynamic> _$SurahDataModelToJson(SurahDataModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
    };
