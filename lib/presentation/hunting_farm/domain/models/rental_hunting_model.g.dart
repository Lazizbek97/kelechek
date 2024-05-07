// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_hunting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalHuntingModelImpl _$$RentalHuntingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalHuntingModelImpl(
      json['id'] as int?,
      json['title'] as String?,
      json['entity_id'] as int?,
      json['price'] as String?,
      json['entity'] == null
          ? null
          : Entity.fromJson(json['entity'] as Map<String, dynamic>),
      (json['values'] as List<dynamic>?)
          ?.map((e) =>
              RentalHuntingModelValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RentalHuntingModelImplToJson(
        _$RentalHuntingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'entity_id': instance.entity_id,
      'price': instance.price,
      'entity': instance.entity,
      'values': instance.values,
    };

_$EntityImpl _$$EntityImplFromJson(Map<String, dynamic> json) => _$EntityImpl(
      json['id'] as int?,
      json['title'] as String?,
      json['parent_id'] as int?,
      (json['child'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['filters'] as List<dynamic>?,
    );

Map<String, dynamic> _$$EntityImplToJson(_$EntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'parent_id': instance.parent_id,
      'child': instance.child,
      'filters': instance.filters,
    };

_$RentalHuntingModelValueImpl _$$RentalHuntingModelValueImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalHuntingModelValueImpl(
      json['product_id'] as int?,
      json['filter_value_id'] as int?,
      json['value'] as String?,
      json['filter_id'] as int?,
      json['id'] as int?,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      (json['full_file'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['filter'] == null
          ? null
          : Filter.fromJson(json['filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RentalHuntingModelValueImplToJson(
        _$RentalHuntingModelValueImpl instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'filter_value_id': instance.filter_value_id,
      'value': instance.value,
      'filter_id': instance.filter_id,
      'id': instance.id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'full_file': instance.full_file,
      'filter': instance.filter,
    };

_$FilterImpl _$$FilterImplFromJson(Map<String, dynamic> json) => _$FilterImpl(
      json['id'] as int?,
      json['title'] as String?,
      json['entity_id'] as int?,
      json['is_default'] as int?,
      json['is_required'] as int?,
      json['type'] as String?,
      json['alias'] as String?,
      json['is_entity'] as int?,
      (json['values'] as List<dynamic>?)
          ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FilterImplToJson(_$FilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'entity_id': instance.entity_id,
      'is_default': instance.is_default,
      'is_required': instance.is_required,
      'type': instance.type,
      'alias': instance.alias,
      'is_entity': instance.is_entity,
      'values': instance.values,
    };

_$FilterValueImpl _$$FilterValueImplFromJson(Map<String, dynamic> json) =>
    _$FilterValueImpl(
      json['id'] as int?,
      json['filter_id'] as int?,
      json['value'] as String?,
    );

Map<String, dynamic> _$$FilterValueImplToJson(_$FilterValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filter_id': instance.filter_id,
      'value': instance.value,
    };
