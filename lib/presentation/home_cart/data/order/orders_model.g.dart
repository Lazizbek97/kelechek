// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrdersModelAdapter extends TypeAdapter<OrdersModel> {
  @override
  final int typeId = 2;

  @override
  OrdersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrdersModel(
      orderNumber: fields[0] as int,
      orderType: fields[1] as String,
      date: fields[2] as String,
      productName: fields[3] as String,
      productInfo: fields[4] as String,
      rentalPeriodFromDate: fields[5] as String,
      rentalPeriodToDate: fields[6] as String,
      price: fields[7] as num,
      address: fields[8] as String,
      size: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrdersModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.orderNumber)
      ..writeByte(1)
      ..write(obj.orderType)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.productName)
      ..writeByte(4)
      ..write(obj.productInfo)
      ..writeByte(5)
      ..write(obj.rentalPeriodFromDate)
      ..writeByte(6)
      ..write(obj.rentalPeriodToDate)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
