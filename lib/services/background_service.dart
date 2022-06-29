import 'dart:ui';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'notification_service.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _service;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _service = this;
  }

  factory BackgroundService() => _service ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    debugPrint('Alarm fired!');
    final NotificationService _notificationService = NotificationService();
    await _notificationService.dailyRepeat();

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}