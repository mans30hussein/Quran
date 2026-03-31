// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahEntityAdapter extends TypeAdapter<SurahEntity> {
  @override
  final int typeId = 0;

  @override
  SurahEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahEntity(
      number: fields[0] as int?,
      surahName: fields[1] as String?,
      numberOfAyahs: fields[2] as int?,
      revelationType: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SurahEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.surahName)
      ..writeByte(2)
      ..write(obj.numberOfAyahs)
      ..writeByte(3)
      ..write(obj.revelationType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
