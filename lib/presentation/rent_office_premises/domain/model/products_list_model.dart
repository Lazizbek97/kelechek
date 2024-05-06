// To parse this JSON data, do
//
//     final productsListModel = productsListModelFromJson(jsonString);

import 'dart:convert';

List<ProductsListModel> productsListModelFromJson(String str) => List<ProductsListModel>.from(json.decode(str).map((x) => ProductsListModel.fromJson(x)));

String productsListModelToJson(List<ProductsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsListModel {
    final int? id;
    final String? title;
    final int? entityId;
    final String? price;
    final Entity? entity;
    final List<ProductsListModelValue>? values;

    ProductsListModel({
        this.id,
        this.title,
        this.entityId,
        this.price,
        this.entity,
        this.values,
    });

    factory ProductsListModel.fromJson(Map<String, dynamic> json) => ProductsListModel(
        id: json["id"],
        title: json["title"],
        entityId: json["entity_id"],
        price: json["price"],
        entity: json["entity"] == null ? null : Entity.fromJson(json["entity"]),
        values: json["values"] == null ? [] : List<ProductsListModelValue>.from(json["values"]!.map((x) => ProductsListModelValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "entity_id": entityId,
        "price": price,
        "entity": entity?.toJson(),
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
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
        child: json["child"] == null ? [] : List<dynamic>.from(json["child"]!.map((x) => x)),
        filters: json["filters"] == null ? [] : List<Filter>.from(json["filters"]!.map((x) => Filter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "parent_id": parentId,
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x)),
        "filters": filters == null ? [] : List<dynamic>.from(filters!.map((x) => x.toJson())),
    };
}

class Filter {
    final int? id;
    final String? title;
    final int? entityId;
    final int? isDefault;
    final int? isRequired;
    final Type? type;
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
        type: typeValues.map[json["type"]]!,
        alias: json["alias"],
        isEntity: json["is_entity"],
        values: json["values"] == null ? [] : List<FilterValue>.from(json["values"]!.map((x) => FilterValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "entity_id": entityId,
        "is_default": isDefault,
        "is_required": isRequired,
        "type": typeValues.reverse[type],
        "alias": alias,
        "is_entity": isEntity,
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
    };
}

enum Type {
    CHECKBOX,
    INPUT_DATE,
    INPUT_FILE,
    INPUT_TEXT,
    SELECT,
    TEXTAREA
}

final typeValues = EnumValues({
    "checkbox": Type.CHECKBOX,
    "input_date": Type.INPUT_DATE,
    "input_file": Type.INPUT_FILE,
    "input_text": Type.INPUT_TEXT,
    "select": Type.SELECT,
    "textarea": Type.TEXTAREA
});

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

class ProductsListModelValue {
    final int? productId;
    final int? filterValueId;
    final String? value;
    final int? filterId;
    final int? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic fullFile;
    final Filter? filter;

    ProductsListModelValue({
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

    factory ProductsListModelValue.fromJson(Map<String, dynamic> json) => ProductsListModelValue(
        productId: json["product_id"],
        filterValueId: json["filter_value_id"],
        value: json["value"],
        filterId: json["filter_id"],
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fullFile: json["fullFile"],
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
        "fullFile": fullFile,
        "filter": filter?.toJson(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
