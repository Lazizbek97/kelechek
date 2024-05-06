import 'package:hive/hive.dart';

part 'orders_model.g.dart';

@HiveType(typeId: 2)
class OrdersModel extends HiveObject {
  OrdersModel({
    this.orderNumber = 0,
    this.orderType = '',
    this.date = '',
    this.productName = '',
    this.productInfo = '',
    this.rentalPeriodFromDate = '',
    this.rentalPeriodToDate = '',
    this.price = 0,
    this.address = '',
    this.size = '',
  });
  @HiveField(0)
  int orderNumber;

  @HiveField(1)
  String orderType;

  @HiveField(2)
  String date;

  @HiveField(3)
  String productName;

  @HiveField(4)
  String productInfo;

  @HiveField(5)
  String rentalPeriodFromDate;

  @HiveField(6)
  String rentalPeriodToDate;

  @HiveField(7)
  num price;

  @HiveField(8)
  String address;

  @HiveField(9)
  String size;

  OrdersModel copyWith({
    int? orderNumber,
    String? orderType,
    String? date,
    String? productName,
    String? productInfo,
    String? rentalPeriodFromDate,
    String? rentalPeriodToDate,
    num? price,
    String? address,
    String? size,
  }) {
    return OrdersModel(
      orderNumber: orderNumber ?? this.orderNumber,
      orderType: orderType ?? this.orderType,
      date: date ?? this.date,
      productName: productName ?? this.productName,
      productInfo: productInfo ?? this.productInfo,
      rentalPeriodFromDate: rentalPeriodFromDate ?? this.rentalPeriodFromDate,
      rentalPeriodToDate: rentalPeriodToDate ?? this.rentalPeriodToDate,
      price: price ?? this.price,
      address: address ?? this.address,
      size: size ?? this.size,
    );
  }
}
