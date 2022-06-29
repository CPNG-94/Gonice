import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:gonice/preferences/preference_helper.dart';
import 'package:gonice/services/background_service.dart';
import 'package:gonice/services/date_time_helper.dart';


class SchedulingProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;
  SchedulingProvider({required this.preferencesHelper}) {
    _getDailyNotificationPreference();
  }

  bool _isScheduled = false;
  bool get isScheduled => _isScheduled;

  void _getDailyNotificationPreference() async {
    _isScheduled = await preferencesHelper.isDailyNotificationActive;
    notifyListeners();
  }

  void enableDailyNotification(bool value) {
    preferencesHelper.setDailyNotification(value);
    scheduledNotification(value);
    _getDailyNotificationPreference();
  }

  Future<bool> scheduledNotification(bool value) async {
    _isScheduled = value;
    notifyListeners();
    if (_isScheduled) {
      debugPrint('Scheduling Activated');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      debugPrint('Scheduling Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}