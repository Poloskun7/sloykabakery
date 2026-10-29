// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CafeAdapter extends TypeAdapter<Cafe> {
  @override
  final int typeId = 3;

  @override
  Cafe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cafe(
      id: fields[0] as int,
      address: fields[1] as String,
      workTime: fields[2] as String,
      extra: fields[3] as String,
      latitude: fields[4] as double,
      longitude: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Cafe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.workTime)
      ..writeByte(3)
      ..write(obj.extra)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CafeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
