import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/utils/shared_prefer_service.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit()
      : super(
          AppCurrentSettingsState(
            curLocale: getIt.get<SharedPreferService>().getLocale() ??
                const Locale(
                  'en',
                ),
            isNotificationEnabled: true, // check with locale storage or network
          ),
        ) {
    _setNotificationStatus();
  }

  Future<void> changeAppLocale(
    Locale locale,
  ) async {
    await getIt.get<SharedPreferService>().saveLocale(locale);
    emit(
      (state as AppCurrentSettingsState).copyWith(
        curLocale: locale,
      ),
    );
  }

  Future<void> changeNotificationStatus({required bool status}) async {
    await getIt.get<SharedPreferService>().saveNotificationStatus(status);
    emit(
      (state as AppCurrentSettingsState).copyWith(
        isNotificationEnabled: status,
      ),
    );
  }

  Future<void> _setNotificationStatus() async {
    final status = getIt.get<SharedPreferService>().getNotificationStatus();
    emit(
      (state as AppCurrentSettingsState).copyWith(
        isNotificationEnabled: status ?? false,
      ),
    );
  }
}
