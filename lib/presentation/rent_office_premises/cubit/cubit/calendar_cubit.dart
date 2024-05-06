import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../widgets/buildable_cubit.dart';

part 'calendar_state.dart';
part 'calendar_cubit.freezed.dart';

@Injectable()
class CalendarCubit extends BuildableCubit<CalendarState, CalendarBuildable> {
  CalendarCubit() : super(const CalendarBuildable());

  selectMultpleDates(List<DateTime?> dates) {
    print(dates);
    build(
      (buildable) => buildable.copyWith(dates: dates),
    );
  }
}
