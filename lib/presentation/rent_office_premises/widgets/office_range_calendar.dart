import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/office_custom_config.dart';

import '../../widgets/buildable.dart';
import '../cubit/cubit/calendar_cubit.dart';

class RangeCalendarWidget extends StatelessWidget {
  const RangeCalendarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final config = getCustomConfig();
    return Buildable<CalendarCubit, CalendarState, CalendarBuildable>(
      properties: (buildable) => [
        buildable.dates,
      ],
      builder: (context, state) {
        return Container(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 300,
                child: CalendarDatePicker2(
                  config: config,
                  value: state.dates,
                  onValueChanged: (dates) {
                    context.read<CalendarCubit>().selectMultpleDates(dates);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SafeArea(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, state.dates);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0XFF719FFF),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      context.l10n.choose_date,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
