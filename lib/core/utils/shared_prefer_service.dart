import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferService {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferService> init() async {
    // Initialize shared preferences
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveLocale(Locale locale) async {
    await _sharedPreferences?.setString(
      'locale',
      locale.toString(),
    );
  }

  Locale? getLocale() {
    final locale = _sharedPreferences?.getString('locale');
    if (locale != null) {
      final localeList = locale.split('_');
      return Locale(localeList[0]);
    }
    return null;
  }

  // notification status
  Future<void> saveNotificationStatus(bool status) async {
    await _sharedPreferences?.setBool(
      'notification_status',
      status,
    );
  }

  bool? getNotificationStatus() {
    return _sharedPreferences?.getBool('notification_status');
  }
}
