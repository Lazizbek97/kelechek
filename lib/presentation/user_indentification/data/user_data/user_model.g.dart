// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserMoodelAdapter extends TypeAdapter<UserMoodel> {
  @override
  final int typeId = 1;

  @override
  UserMoodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMoodel(
      fulllName: fields[0] as String,
      passportNumber: fields[1] as String?,
      phoneNumber: fields[2] as String,
      inn: fields[3] as String,
      isForiegner: fields[4] as bool,
      userBall: fields[5] as int,
      userId: fields[6] as int,
      isVerified: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserMoodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.fulllName)
      ..writeByte(1)
      ..write(obj.passportNumber)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.inn)
      ..writeByte(4)
      ..write(obj.isForiegner)
      ..writeByte(5)
      ..write(obj.userBall)
      ..writeByte(6)
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.isVerified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMoodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
