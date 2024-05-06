part of 'calendar_cubit.dart';

abstract class CalendarState {}

@freezed
class CalendarBuildable extends CalendarState with _$CalendarBuildable {
  const factory CalendarBuildable({
    @Default(false) bool loading,
    @Default(false) bool success,
    @Default(false) bool failure,
    @Default("") String selectedDate,
    @Default("") String dateCount,
    @Default("") String range,
    @Default("") String rangeCount,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? focusDate,
    @Default([]) List<DateTime?> dates,
  }) = _CalendarBuildable;
}
