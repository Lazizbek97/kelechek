// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_hunting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RentalHuntingModel _$RentalHuntingModelFromJson(Map<String, dynamic> json) {
  return _RentalHuntingModel.fromJson(json);
}

/// @nodoc
mixin _$RentalHuntingModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get entity_id => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  Entity? get entity => throw _privateConstructorUsedError;
  List<RentalHuntingModelValue>? get values =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentalHuntingModelCopyWith<RentalHuntingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalHuntingModelCopyWith<$Res> {
  factory $RentalHuntingModelCopyWith(
          RentalHuntingModel value, $Res Function(RentalHuntingModel) then) =
      _$RentalHuntingModelCopyWithImpl<$Res, RentalHuntingModel>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? entity_id,
      String? price,
      Entity? entity,
      List<RentalHuntingModelValue>? values});

  $EntityCopyWith<$Res>? get entity;
}

/// @nodoc
class _$RentalHuntingModelCopyWithImpl<$Res, $Val extends RentalHuntingModel>
    implements $RentalHuntingModelCopyWith<$Res> {
  _$RentalHuntingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? entity_id = freezed,
    Object? price = freezed,
    Object? entity = freezed,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      entity_id: freezed == entity_id
          ? _value.entity_id
          : entity_id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<RentalHuntingModelValue>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntityCopyWith<$Res>? get entity {
    if (_value.entity == null) {
      return null;
    }

    return $EntityCopyWith<$Res>(_value.entity!, (value) {
      return _then(_value.copyWith(entity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentalHuntingModelImplCopyWith<$Res>
    implements $RentalHuntingModelCopyWith<$Res> {
  factory _$$RentalHuntingModelImplCopyWith(_$RentalHuntingModelImpl value,
          $Res Function(_$RentalHuntingModelImpl) then) =
      __$$RentalHuntingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? entity_id,
      String? price,
      Entity? entity,
      List<RentalHuntingModelValue>? values});

  @override
  $EntityCopyWith<$Res>? get entity;
}

/// @nodoc
class __$$RentalHuntingModelImplCopyWithImpl<$Res>
    extends _$RentalHuntingModelCopyWithImpl<$Res, _$RentalHuntingModelImpl>
    implements _$$RentalHuntingModelImplCopyWith<$Res> {
  __$$RentalHuntingModelImplCopyWithImpl(_$RentalHuntingModelImpl _value,
      $Res Function(_$RentalHuntingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? entity_id = freezed,
    Object? price = freezed,
    Object? entity = freezed,
    Object? values = freezed,
  }) {
    return _then(_$RentalHuntingModelImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == entity_id
          ? _value.entity_id
          : entity_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<RentalHuntingModelValue>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalHuntingModelImpl implements _RentalHuntingModel {
  const _$RentalHuntingModelImpl(this.id, this.title, this.entity_id,
      this.price, this.entity, final List<RentalHuntingModelValue>? values)
      : _values = values;

  factory _$RentalHuntingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalHuntingModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final int? entity_id;
  @override
  final String? price;
  @override
  final Entity? entity;
  final List<RentalHuntingModelValue>? _values;
  @override
  List<RentalHuntingModelValue>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RentalHuntingModel(id: $id, title: $title, entity_id: $entity_id, price: $price, entity: $entity, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalHuntingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.entity_id, entity_id) ||
                other.entity_id == entity_id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, entity_id, price,
      entity, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalHuntingModelImplCopyWith<_$RentalHuntingModelImpl> get copyWith =>
      __$$RentalHuntingModelImplCopyWithImpl<_$RentalHuntingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalHuntingModelImplToJson(
      this,
    );
  }
}

abstract class _RentalHuntingModel implements RentalHuntingModel {
  const factory _RentalHuntingModel(
      final int? id,
      final String? title,
      final int? entity_id,
      final String? price,
      final Entity? entity,
      final List<RentalHuntingModelValue>? values) = _$RentalHuntingModelImpl;

  factory _RentalHuntingModel.fromJson(Map<String, dynamic> json) =
      _$RentalHuntingModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  int? get entity_id;
  @override
  String? get price;
  @override
  Entity? get entity;
  @override
  List<RentalHuntingModelValue>? get values;
  @override
  @JsonKey(ignore: true)
  _$$RentalHuntingModelImplCopyWith<_$RentalHuntingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return _Entity.fromJson(json);
}

/// @nodoc
mixin _$Entity {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get parent_id => throw _privateConstructorUsedError;
  List<Entity>? get child => throw _privateConstructorUsedError;
  List<dynamic>? get filters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityCopyWith<Entity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCopyWith<$Res> {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) then) =
      _$EntityCopyWithImpl<$Res, Entity>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? parent_id,
      List<Entity>? child,
      List<dynamic>? filters});
}

/// @nodoc
class _$EntityCopyWithImpl<$Res, $Val extends Entity>
    implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? parent_id = freezed,
    Object? child = freezed,
    Object? filters = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      parent_id: freezed == parent_id
          ? _value.parent_id
          : parent_id // ignore: cast_nullable_to_non_nullable
              as int?,
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntityImplCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory _$$EntityImplCopyWith(
          _$EntityImpl value, $Res Function(_$EntityImpl) then) =
      __$$EntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? parent_id,
      List<Entity>? child,
      List<dynamic>? filters});
}

/// @nodoc
class __$$EntityImplCopyWithImpl<$Res>
    extends _$EntityCopyWithImpl<$Res, _$EntityImpl>
    implements _$$EntityImplCopyWith<$Res> {
  __$$EntityImplCopyWithImpl(
      _$EntityImpl _value, $Res Function(_$EntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? parent_id = freezed,
    Object? child = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$EntityImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == parent_id
          ? _value.parent_id
          : parent_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == child
          ? _value._child
          : child // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
      freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntityImpl implements _Entity {
  const _$EntityImpl(this.id, this.title, this.parent_id,
      final List<Entity>? child, final List<dynamic>? filters)
      : _child = child,
        _filters = filters;

  factory _$EntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final int? parent_id;
  final List<Entity>? _child;
  @override
  List<Entity>? get child {
    final value = _child;
    if (value == null) return null;
    if (_child is EqualUnmodifiableListView) return _child;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _filters;
  @override
  List<dynamic>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Entity(id: $id, title: $title, parent_id: $parent_id, child: $child, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.parent_id, parent_id) ||
                other.parent_id == parent_id) &&
            const DeepCollectionEquality().equals(other._child, _child) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      parent_id,
      const DeepCollectionEquality().hash(_child),
      const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityImplCopyWith<_$EntityImpl> get copyWith =>
      __$$EntityImplCopyWithImpl<_$EntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntityImplToJson(
      this,
    );
  }
}

abstract class _Entity implements Entity {
  const factory _Entity(
      final int? id,
      final String? title,
      final int? parent_id,
      final List<Entity>? child,
      final List<dynamic>? filters) = _$EntityImpl;

  factory _Entity.fromJson(Map<String, dynamic> json) = _$EntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  int? get parent_id;
  @override
  List<Entity>? get child;
  @override
  List<dynamic>? get filters;
  @override
  @JsonKey(ignore: true)
  _$$EntityImplCopyWith<_$EntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RentalHuntingModelValue _$RentalHuntingModelValueFromJson(
    Map<String, dynamic> json) {
  return _RentalHuntingModelValue.fromJson(json);
}

/// @nodoc
mixin _$RentalHuntingModelValue {
  int? get product_id => throw _privateConstructorUsedError;
  int? get filter_value_id => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  int? get filter_id => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  List<String>? get full_file => throw _privateConstructorUsedError;
  Filter? get filter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentalHuntingModelValueCopyWith<RentalHuntingModelValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalHuntingModelValueCopyWith<$Res> {
  factory $RentalHuntingModelValueCopyWith(RentalHuntingModelValue value,
          $Res Function(RentalHuntingModelValue) then) =
      _$RentalHuntingModelValueCopyWithImpl<$Res, RentalHuntingModelValue>;
  @useResult
  $Res call(
      {int? product_id,
      int? filter_value_id,
      String? value,
      int? filter_id,
      int? id,
      DateTime? created_at,
      DateTime? updated_at,
      List<String>? full_file,
      Filter? filter});

  $FilterCopyWith<$Res>? get filter;
}

/// @nodoc
class _$RentalHuntingModelValueCopyWithImpl<$Res,
        $Val extends RentalHuntingModelValue>
    implements $RentalHuntingModelValueCopyWith<$Res> {
  _$RentalHuntingModelValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = freezed,
    Object? filter_value_id = freezed,
    Object? value = freezed,
    Object? filter_id = freezed,
    Object? id = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? full_file = freezed,
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      filter_value_id: freezed == filter_value_id
          ? _value.filter_value_id
          : filter_value_id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      filter_id: freezed == filter_id
          ? _value.filter_id
          : filter_id // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      full_file: freezed == full_file
          ? _value.full_file
          : full_file // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterCopyWith<$Res>? get filter {
    if (_value.filter == null) {
      return null;
    }

    return $FilterCopyWith<$Res>(_value.filter!, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentalHuntingModelValueImplCopyWith<$Res>
    implements $RentalHuntingModelValueCopyWith<$Res> {
  factory _$$RentalHuntingModelValueImplCopyWith(
          _$RentalHuntingModelValueImpl value,
          $Res Function(_$RentalHuntingModelValueImpl) then) =
      __$$RentalHuntingModelValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? product_id,
      int? filter_value_id,
      String? value,
      int? filter_id,
      int? id,
      DateTime? created_at,
      DateTime? updated_at,
      List<String>? full_file,
      Filter? filter});

  @override
  $FilterCopyWith<$Res>? get filter;
}

/// @nodoc
class __$$RentalHuntingModelValueImplCopyWithImpl<$Res>
    extends _$RentalHuntingModelValueCopyWithImpl<$Res,
        _$RentalHuntingModelValueImpl>
    implements _$$RentalHuntingModelValueImplCopyWith<$Res> {
  __$$RentalHuntingModelValueImplCopyWithImpl(
      _$RentalHuntingModelValueImpl _value,
      $Res Function(_$RentalHuntingModelValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = freezed,
    Object? filter_value_id = freezed,
    Object? value = freezed,
    Object? filter_id = freezed,
    Object? id = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? full_file = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$RentalHuntingModelValueImpl(
      freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == filter_value_id
          ? _value.filter_value_id
          : filter_value_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == filter_id
          ? _value.filter_id
          : filter_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == full_file
          ? _value._full_file
          : full_file // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalHuntingModelValueImpl implements _RentalHuntingModelValue {
  const _$RentalHuntingModelValueImpl(
      this.product_id,
      this.filter_value_id,
      this.value,
      this.filter_id,
      this.id,
      this.created_at,
      this.updated_at,
      final List<String>? full_file,
      this.filter)
      : _full_file = full_file;

  factory _$RentalHuntingModelValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalHuntingModelValueImplFromJson(json);

  @override
  final int? product_id;
  @override
  final int? filter_value_id;
  @override
  final String? value;
  @override
  final int? filter_id;
  @override
  final int? id;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  final List<String>? _full_file;
  @override
  List<String>? get full_file {
    final value = _full_file;
    if (value == null) return null;
    if (_full_file is EqualUnmodifiableListView) return _full_file;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Filter? filter;

  @override
  String toString() {
    return 'RentalHuntingModelValue(product_id: $product_id, filter_value_id: $filter_value_id, value: $value, filter_id: $filter_id, id: $id, created_at: $created_at, updated_at: $updated_at, full_file: $full_file, filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalHuntingModelValueImpl &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.filter_value_id, filter_value_id) ||
                other.filter_value_id == filter_value_id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.filter_id, filter_id) ||
                other.filter_id == filter_id) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            const DeepCollectionEquality()
                .equals(other._full_file, _full_file) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      product_id,
      filter_value_id,
      value,
      filter_id,
      id,
      created_at,
      updated_at,
      const DeepCollectionEquality().hash(_full_file),
      filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalHuntingModelValueImplCopyWith<_$RentalHuntingModelValueImpl>
      get copyWith => __$$RentalHuntingModelValueImplCopyWithImpl<
          _$RentalHuntingModelValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalHuntingModelValueImplToJson(
      this,
    );
  }
}

abstract class _RentalHuntingModelValue implements RentalHuntingModelValue {
  const factory _RentalHuntingModelValue(
      final int? product_id,
      final int? filter_value_id,
      final String? value,
      final int? filter_id,
      final int? id,
      final DateTime? created_at,
      final DateTime? updated_at,
      final List<String>? full_file,
      final Filter? filter) = _$RentalHuntingModelValueImpl;

  factory _RentalHuntingModelValue.fromJson(Map<String, dynamic> json) =
      _$RentalHuntingModelValueImpl.fromJson;

  @override
  int? get product_id;
  @override
  int? get filter_value_id;
  @override
  String? get value;
  @override
  int? get filter_id;
  @override
  int? get id;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  List<String>? get full_file;
  @override
  Filter? get filter;
  @override
  @JsonKey(ignore: true)
  _$$RentalHuntingModelValueImplCopyWith<_$RentalHuntingModelValueImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return _Filter.fromJson(json);
}

/// @nodoc
mixin _$Filter {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get entity_id => throw _privateConstructorUsedError;
  int? get is_default => throw _privateConstructorUsedError;
  int? get is_required => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;
  int? get is_entity => throw _privateConstructorUsedError;
  List<FilterValue>? get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterCopyWith<Filter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) then) =
      _$FilterCopyWithImpl<$Res, Filter>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? entity_id,
      int? is_default,
      int? is_required,
      String? type,
      String? alias,
      int? is_entity,
      List<FilterValue>? values});
}

/// @nodoc
class _$FilterCopyWithImpl<$Res, $Val extends Filter>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? entity_id = freezed,
    Object? is_default = freezed,
    Object? is_required = freezed,
    Object? type = freezed,
    Object? alias = freezed,
    Object? is_entity = freezed,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      entity_id: freezed == entity_id
          ? _value.entity_id
          : entity_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_default: freezed == is_default
          ? _value.is_default
          : is_default // ignore: cast_nullable_to_non_nullable
              as int?,
      is_required: freezed == is_required
          ? _value.is_required
          : is_required // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      is_entity: freezed == is_entity
          ? _value.is_entity
          : is_entity // ignore: cast_nullable_to_non_nullable
              as int?,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<FilterValue>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterImplCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$$FilterImplCopyWith(
          _$FilterImpl value, $Res Function(_$FilterImpl) then) =
      __$$FilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? entity_id,
      int? is_default,
      int? is_required,
      String? type,
      String? alias,
      int? is_entity,
      List<FilterValue>? values});
}

/// @nodoc
class __$$FilterImplCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? entity_id = freezed,
    Object? is_default = freezed,
    Object? is_required = freezed,
    Object? type = freezed,
    Object? alias = freezed,
    Object? is_entity = freezed,
    Object? values = freezed,
  }) {
    return _then(_$FilterImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == entity_id
          ? _value.entity_id
          : entity_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == is_default
          ? _value.is_default
          : is_default // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == is_required
          ? _value.is_required
          : is_required // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == is_entity
          ? _value.is_entity
          : is_entity // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<FilterValue>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterImpl implements _Filter {
  const _$FilterImpl(
      this.id,
      this.title,
      this.entity_id,
      this.is_default,
      this.is_required,
      this.type,
      this.alias,
      this.is_entity,
      final List<FilterValue>? values)
      : _values = values;

  factory _$FilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final int? entity_id;
  @override
  final int? is_default;
  @override
  final int? is_required;
  @override
  final String? type;
  @override
  final String? alias;
  @override
  final int? is_entity;
  final List<FilterValue>? _values;
  @override
  List<FilterValue>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Filter(id: $id, title: $title, entity_id: $entity_id, is_default: $is_default, is_required: $is_required, type: $type, alias: $alias, is_entity: $is_entity, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.entity_id, entity_id) ||
                other.entity_id == entity_id) &&
            (identical(other.is_default, is_default) ||
                other.is_default == is_default) &&
            (identical(other.is_required, is_required) ||
                other.is_required == is_required) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.is_entity, is_entity) ||
                other.is_entity == is_entity) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      entity_id,
      is_default,
      is_required,
      type,
      alias,
      is_entity,
      const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      __$$FilterImplCopyWithImpl<_$FilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterImplToJson(
      this,
    );
  }
}

abstract class _Filter implements Filter {
  const factory _Filter(
      final int? id,
      final String? title,
      final int? entity_id,
      final int? is_default,
      final int? is_required,
      final String? type,
      final String? alias,
      final int? is_entity,
      final List<FilterValue>? values) = _$FilterImpl;

  factory _Filter.fromJson(Map<String, dynamic> json) = _$FilterImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  int? get entity_id;
  @override
  int? get is_default;
  @override
  int? get is_required;
  @override
  String? get type;
  @override
  String? get alias;
  @override
  int? get is_entity;
  @override
  List<FilterValue>? get values;
  @override
  @JsonKey(ignore: true)
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterValue _$FilterValueFromJson(Map<String, dynamic> json) {
  return _FilterValue.fromJson(json);
}

/// @nodoc
mixin _$FilterValue {
  int? get id => throw _privateConstructorUsedError;
  int? get filter_id => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterValueCopyWith<FilterValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterValueCopyWith<$Res> {
  factory $FilterValueCopyWith(
          FilterValue value, $Res Function(FilterValue) then) =
      _$FilterValueCopyWithImpl<$Res, FilterValue>;
  @useResult
  $Res call({int? id, int? filter_id, String? value});
}

/// @nodoc
class _$FilterValueCopyWithImpl<$Res, $Val extends FilterValue>
    implements $FilterValueCopyWith<$Res> {
  _$FilterValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? filter_id = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      filter_id: freezed == filter_id
          ? _value.filter_id
          : filter_id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterValueImplCopyWith<$Res>
    implements $FilterValueCopyWith<$Res> {
  factory _$$FilterValueImplCopyWith(
          _$FilterValueImpl value, $Res Function(_$FilterValueImpl) then) =
      __$$FilterValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? filter_id, String? value});
}

/// @nodoc
class __$$FilterValueImplCopyWithImpl<$Res>
    extends _$FilterValueCopyWithImpl<$Res, _$FilterValueImpl>
    implements _$$FilterValueImplCopyWith<$Res> {
  __$$FilterValueImplCopyWithImpl(
      _$FilterValueImpl _value, $Res Function(_$FilterValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? filter_id = freezed,
    Object? value = freezed,
  }) {
    return _then(_$FilterValueImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == filter_id
          ? _value.filter_id
          : filter_id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterValueImpl implements _FilterValue {
  const _$FilterValueImpl(this.id, this.filter_id, this.value);

  factory _$FilterValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterValueImplFromJson(json);

  @override
  final int? id;
  @override
  final int? filter_id;
  @override
  final String? value;

  @override
  String toString() {
    return 'FilterValue(id: $id, filter_id: $filter_id, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filter_id, filter_id) ||
                other.filter_id == filter_id) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, filter_id, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterValueImplCopyWith<_$FilterValueImpl> get copyWith =>
      __$$FilterValueImplCopyWithImpl<_$FilterValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterValueImplToJson(
      this,
    );
  }
}

abstract class _FilterValue implements FilterValue {
  const factory _FilterValue(
          final int? id, final int? filter_id, final String? value) =
      _$FilterValueImpl;

  factory _FilterValue.fromJson(Map<String, dynamic> json) =
      _$FilterValueImpl.fromJson;

  @override
  int? get id;
  @override
  int? get filter_id;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$FilterValueImplCopyWith<_$FilterValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
