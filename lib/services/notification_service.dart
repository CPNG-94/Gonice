import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  String _timezone = 'Unknown';

  static final NotificationService _notificationService =
  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    // Android initialization
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    tz.initializeTimeZones();

    // ios initialization
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _timezone = await FlutterNativeTimezone.getLocalTimezone();
  }

  tz.TZDateTime dailyRepeat() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation(_timezone));
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.getLocation(_timezone), now.year, now.month, now.day, 15);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> showNotificationDaily() async {
    await flutterLocalNotificationsPlugin.zonedSchedule (
      0,
      "Gonice",
      'Jangan lupa olahraga hari ini!',
      dailyRepeat(),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "Gonice",
            importance: Importance.max,
            priority: Priority.max),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
      true,
    );
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
