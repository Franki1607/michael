// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CultureAdapter extends TypeAdapter<Culture> {
  @override
  final int typeId = 2;

  @override
  Culture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Culture(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Culture obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.champ_id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.champs)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CultureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
