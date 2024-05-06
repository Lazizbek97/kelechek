import 'dart:convert';

UserOrderModel userOrderModelFromJson(String str) =>
    UserOrderModel.fromJson(json.decode(str));

String userOrderModelToJson(UserOrderModel data) => json.encode(data.toJson());

class UserOrderModel {
  final int? id;
  final int? accountId;
  final String? fio;
  final int? isAgree;
  final String? status;
  final String? paymentStatus;
  final String? fileContract;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? bonuses;
  final dynamic sessionId;
  final List<Product>? products;
  final Account? account;

  UserOrderModel({
    this.id,
    this.accountId,
    this.fio,
    this.isAgree,
    this.status,
    this.paymentStatus,
    this.fileContract,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.bonuses,
    this.sessionId,
    this.products,
    this.account,
  });

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
        id: json["id"],
        accountId: json["account_id"],
        fio: json["fio"],
        isAgree: json["is_agree"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        fileContract: json["file_contract"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        bonuses: json["bonuses"],
        sessionId: json["session_id"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "fio": fio,
        "is_agree": isAgree,
        "status": status,
        "payment_status": paymentStatus,
        "file_contract": fileContract,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "bonuses": bonuses,
        "session_id": sessionId,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "account": account?.toJson(),
      };
}

class Account {
  final int? id;
  final String? fio;
  final String? identificationCode;
  final int? isVerified;

  Account({
    this.id,
    this.fio,
    this.identificationCode,
    this.isVerified,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        fio: json["fio"],
        identificationCode: json["identification_code"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fio": fio,
        "identification_code": identificationCode,
        "is_verified": isVerified,
      };
}

class Product {
  final int? id;
  final String? title;
  final int? entityId;
  final String? price;
  final Pivot? pivot;
  final Entity? entity;
  final List<ProductValue>? values;

  Product({
    this.id,
    this.title,
    this.entityId,
    this.price,
    this.pivot,
    this.entity,
    this.values,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        entityId: json["entity_id"],
        price: json["price"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        entity: json["entity"] == null ? null : Entity.fromJson(json["entity"]),
        values: json["values"] == null
            ? []
            : List<ProductValue>.from(
                json["values"]!.map((x) => ProductValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "entity_id": entityId,
        "price": price,
        "pivot": pivot?.toJson(),
        "entity": entity?.toJson(),
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class Entity {
  final int? id;
  final String? title;
  final int? parentId;
  final List<dynamic>? child;
  final List<Filter>? filters;

  Entity({
    this.id,
    this.title,
    this.parentId,
    this.child,
    this.filters,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        id: json["id"],
        title: json["title"],
        parentId: json["parent_id"],
        child: json["child"] == null
            ? []
            : List<dynamic>.from(json["child"]!.map((x) => x)),
        filters: json["filters"] == null
            ? []
            : List<Filter>.from(
                json["filters"]!.map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "parent_id": parentId,
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x)),
        "filters": filters == null
            ? []
            : List<dynamic>.from(filters!.map((x) => x.toJson())),
      };
}

class Filter {
  final int? id;
  final String? title;
  final int? entityId;
  final int? isDefault;
  final int? isRequired;
  final String? type;
  final String? alias;
  final int? isEntity;
  final List<FilterValue>? values;

  Filter({
    this.id,
    this.title,
    this.entityId,
    this.isDefault,
    this.isRequired,
    this.type,
    this.alias,
    this.isEntity,
    this.values,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        id: json["id"],
        title: json["title"],
        entityId: json["entity_id"],
        isDefault: json["is_default"],
        isRequired: json["is_required"],
        type: json["type"],
        alias: json["alias"],
        isEntity: json["is_entity"],
        values: json["values"] == null
            ? []
            : List<FilterValue>.from(
                json["values"]!.map((x) => FilterValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "entity_id": entityId,
        "is_default": isDefault,
        "is_required": isRequired,
        "type": type,
        "alias": alias,
        "is_entity": isEntity,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class FilterValue {
  final int? id;
  final int? filterId;
  final String? value;

  FilterValue({
    this.id,
    this.filterId,
    this.value,
  });

  factory FilterValue.fromJson(Map<String, dynamic> json) => FilterValue(
        id: json["id"],
        filterId: json["filter_id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filter_id": filterId,
        "value": value,
      };
}

class Pivot {
  final int? orderId;
  final int? productId;
  final String? price;
  final String? values;
  final int? count;
  final String? priceForOne;

  Pivot({
    this.orderId,
    this.productId,
    this.price,
    this.values,
    this.count,
    this.priceForOne,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        orderId: json["order_id"],
        productId: json["product_id"],
        price: json["price"],
        values: json["values"],
        count: json["count"],
        priceForOne: json["price_for_one"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "product_id": productId,
        "price": price,
        "values": values,
        "count": count,
        "price_for_one": priceForOne,
      };
}

class ProductValue {
  final int? productId;
  final int? filterValueId;
  final String? value;
  final int? filterId;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? fullFile;
  final Filter? filter;

  ProductValue({
    this.productId,
    this.filterValueId,
    this.value,
    this.filterId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fullFile,
    this.filter,
  });

  factory ProductValue.fromJson(Map<String, dynamic> json) => ProductValue(
        productId: json["product_id"],
        filterValueId: json["filter_value_id"],
        value: json["value"],
        filterId: json["filter_id"],
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fullFile: json["fullFile"] == null
            ? []
            : List<String>.from(json["fullFile"]!.map((x) => x)),
        filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "filter_value_id": filterValueId,
        "value": value,
        "filter_id": filterId,
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "fullFile":
            fullFile == null ? [] : List<dynamic>.from(fullFile!.map((x) => x)),
        "filter": filter?.toJson(),
      };
}
