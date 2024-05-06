// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_chats_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeChatsModelAdapter extends TypeAdapter<HomeChatsModel> {
  @override
  final int typeId = 3;

  @override
  HomeChatsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeChatsModel(
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      lastMessage: fields[3] as String,
      isRead: fields[4] as bool,
      lastMessageTime: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeChatsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.lastMessage)
      ..writeByte(4)
      ..write(obj.isRead)
      ..writeByte(5)
      ..write(obj.lastMessageTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeChatsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
