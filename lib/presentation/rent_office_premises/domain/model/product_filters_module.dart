import 'dart:convert';

List<ProductsFiltersModel> productsFiltersModelFromJson(String str) =>
    List<ProductsFiltersModel>.from(
        json.decode(str).map((x) => ProductsFiltersModel.fromJson(x)));

String productsFiltersModelToJson(List<ProductsFiltersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsFiltersModel {
  final int? id;
  final String? title;
  final dynamic parentId;
  final List<Child>? child;
  final List<Field>? filters;
  final List<ProductsFiltersModelValue>? values;
  final List<Field>? fields;

  ProductsFiltersModel({
    this.id,
    this.title,
    this.parentId,
    this.child,
    this.filters,
    this.values,
    this.fields,
  });

  factory ProductsFiltersModel.fromJson(Map<String, dynamic> json) =>
      ProductsFiltersModel(
        id: json["id"],
        title: json["title"],
        parentId: json["parent_id"],
        child: json["child"] == null
            ? []
            : List<Child>.from(json["child"]!.map((x) => Child.fromJson(x))),
        filters: json["filters"] == null
            ? []
            : List<Field>.from(json["filters"]!.map((x) => Field.fromJson(x))),
        values: json["values"] == null
            ? []
            : List<ProductsFiltersModelValue>.from(json["values"]!
                .map((x) => ProductsFiltersModelValue.fromJson(x))),
        fields: json["fields"] == null
            ? []
            : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "parent_id": parentId,
        "child": child == null
            ? []
            : List<dynamic>.from(child!.map((x) => x.toJson())),
        "filters": filters == null
            ? []
            : List<dynamic>.from(filters!.map((x) => x.toJson())),
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
        "fields": fields == null
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

class Child {
  final int? id;
  final String? title;
  final int? parentId;
  final List<Child>? child;
  final List<Field>? filters;

  Child({
    this.id,
    this.title,
    this.parentId,
    this.child,
    this.filters,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        title: json["title"],
        parentId: json["parent_id"],
        child: json["child"] == null
            ? []
            : List<Child>.from(json["child"]!.map((x) => Child.fromJson(x))),
        filters: json["filters"] == null
            ? []
            : List<Field>.from(json["filters"]!.map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "parent_id": parentId,
        "child": child == null
            ? []
            : List<dynamic>.from(child!.map((x) => x.toJson())),
        "filters": filters == null
            ? []
            : List<dynamic>.from(filters!.map((x) => x.toJson())),
      };
}

class Field {
  final int? id;
  final String? title;
  final int? entityId;
  final int? isDefault;
  final int? isRequired;
  final Type? type;
  final String? alias;
  final int? isEntity;
  final List<FieldValue>? values;

  Field({
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

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        title: json["title"],
        entityId: json["entity_id"],
        isDefault: json["is_default"],
        isRequired: json["is_required"],
        type: typeValues.map[json["type"]]!,
        alias: json["alias"],
        isEntity: json["is_entity"],
        values: json["values"] == null
            ? []
            : List<FieldValue>.from(
                json["values"]!.map((x) => FieldValue.fromJson(x))),
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
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

enum Type { CHECKBOX, INPUT_DATE, INPUT_FILE, INPUT_TEXT, SELECT, TEXTAREA }

final typeValues = EnumValues({
  "checkbox": Type.CHECKBOX,
  "input_date": Type.INPUT_DATE,
  "input_file": Type.INPUT_FILE,
  "input_text": Type.INPUT_TEXT,
  "select": Type.SELECT,
  "textarea": Type.TEXTAREA
});

class FieldValue {
  final int? id;
  final int? filterId;
  final String? value;

  FieldValue({
    this.id,
    this.filterId,
    this.value,
  });

  factory FieldValue.fromJson(Map<String, dynamic> json) => FieldValue(
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

class ProductsFiltersModelValue {
  final int? id;
  final int? entityId;
  final dynamic filterValueId;
  final ValueEnum? value;
  final int? filterId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductsFiltersModelValue({
    this.id,
    this.entityId,
    this.filterValueId,
    this.value,
    this.filterId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductsFiltersModelValue.fromJson(Map<String, dynamic> json) =>
      ProductsFiltersModelValue(
        id: json["id"],
        entityId: json["entity_id"],
        filterValueId: json["filter_value_id"],
        value: valueEnumValues.map[json["value"]]!,
        filterId: json["filter_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entity_id": entityId,
        "filter_value_id": filterValueId,
        "value": valueEnumValues.reverse[value],
        "filter_id": filterId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum ValueEnum { EMPTY, PURPLE, VALUE }

final valueEnumValues = EnumValues({
  "поле кырг": ValueEnum.EMPTY,
  "поле рус": ValueEnum.PURPLE,
  "поле англ": ValueEnum.VALUE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
