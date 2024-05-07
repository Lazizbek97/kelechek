
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rental_hunting_model.freezed.dart';
part 'rental_hunting_model.g.dart';

@freezed
class RentalHuntingModel with _$RentalHuntingModel {
 
  const factory RentalHuntingModel(
    int? id,
    String? title,
    int? entity_id,
    String? price,
    Entity? entity,
     List<RentalHuntingModelValue>? values
  ) = _RentalHuntingModel;

  factory RentalHuntingModel.fromJson(Map<String, Object?> json) =>
      _$RentalHuntingModelFromJson(json);
}

@freezed
class Entity with _$Entity {
  const factory Entity(
    int? id,
    String? title,
    int? parent_id,
    List<Entity>? child,
    List<dynamic>? filters,
  ) = _Entity;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);
}

@freezed
class RentalHuntingModelValue with _$RentalHuntingModelValue {
  const factory RentalHuntingModelValue(
    int? product_id,
    int? filter_value_id,
    String? value,
    int? filter_id,
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    List<String>? full_file,
    Filter? filter,
  ) = _RentalHuntingModelValue;

  factory RentalHuntingModelValue.fromJson(Map<String, Object?> json) =>
      _$RentalHuntingModelValueFromJson(json);
}

@freezed
class Filter with _$Filter {
  const factory Filter(
      int? id,
      String? title,
      int? entity_id,
      int? is_default,
      int? is_required,
      String? type,
      String? alias,
      int? is_entity,
      List<FilterValue>? values) = _Filter;

  factory Filter.fromJson(Map<String, Object?> json) => _$FilterFromJson(json);
}

// enum Type { CHECKBOX, INPUT_DATE, INPUT_FILE, INPUT_TEXT, SELECT, TEXTAREA }

// final typeValues = EnumValues({
//   "checkbox": Type.CHECKBOX,
//   "input_date": Type.INPUT_DATE,
//   "input_file": Type.INPUT_FILE,
//   "input_text": Type.INPUT_TEXT,
//   "select": Type.SELECT,
//   "textarea": Type.TEXTAREA
// });

@freezed
class FilterValue with _$FilterValue {
  const factory FilterValue(
    int? id,
    int? filter_id,
    String? value,
  ) = _FilterValue;

  factory FilterValue.fromJson(Map<String, Object?> json) =>
      _$FilterValueFromJson(json);
}
