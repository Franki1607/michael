// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bornes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BornesAdapter extends TypeAdapter<Bornes> {
  @override
  final int typeId = 3;

  @override
  Bornes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bornes(
      fields[0] as int,
      fields[1] as double,
      fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Bornes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.champ_id)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BornesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
