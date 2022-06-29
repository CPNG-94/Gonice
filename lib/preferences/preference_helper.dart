import 'package:shared_preferences/shared_preferences.dart';


class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const dailyNotification = 'dailyNotification';

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotification) ?? false;
  }

  void setDailyNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotification, value);
  }
}