part of 'app_settings_cubit.dart';

@immutable
sealed class AppSettingsState {
  const AppSettingsState({
    required this.locale,
    required this.notificationEnabled,
  });
  final Locale locale;
  final bool notificationEnabled;
}

final class AppCurrentSettingsState extends AppSettingsState {
  const AppCurrentSettingsState({
    required this.curLocale,
    required this.isNotificationEnabled,
  }) : super(locale: curLocale, notificationEnabled: isNotificationEnabled);

  final Locale curLocale;
  final bool isNotificationEnabled;

  // copy with method
  AppCurrentSettingsState copyWith({
    Locale? curLocale,
    bool? isNotificationEnabled,
  }) =>
      AppCurrentSettingsState(
        curLocale: curLocale ?? this.curLocale,
        isNotificationEnabled:
            isNotificationEnabled ?? this.isNotificationEnabled,
      );
}
