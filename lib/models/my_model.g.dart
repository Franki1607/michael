// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyModelAdapter extends TypeAdapter<MyModel> {
  @override
  final int typeId = 0;

  @override
  MyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.p_firstname)
      ..writeByte(2)
      ..write(obj.p_lastname)
      ..writeByte(3)
      ..write(obj.p_sexe)
      ..writeByte(4)
      ..write(obj.p_adresse)
      ..writeByte(5)
      ..write(obj.p_tel)
      ..writeByte(6)
      ..write(obj.d_name)
      ..writeByte(7)
      ..write(obj.d_superficie)
      ..writeByte(8)
      ..write(obj.d_departement)
      ..writeByte(9)
      ..write(obj.d_commune)
      ..writeByte(10)
      ..write(obj.d_localite)
      ..writeByte(11)
      ..write(obj.b_longitude)
      ..writeByte(12)
      ..write(obj.b_latitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
