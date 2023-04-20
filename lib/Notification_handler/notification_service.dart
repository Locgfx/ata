import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings("ic_launcher.png");

  final IOSInitializationSettings _initializationSettings =
      IOSInitializationSettings();

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails("channelId", "channelName",
          importance: Importance.max, priority: Priority.high);

  IOSNotificationDetails iosNotificationDetails =
      IOSNotificationDetails(presentSound: true, presentAlert: true);

  void initializeNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: _androidInitializationSettings, iOS: _initializationSettings);
    //latest.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void resolvePlatformSpecificSettings() async {
    Platform.isAndroid
        ? _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .requestPermission()
        : await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
  }

  void sendNotification(
      {required int id,
      required String title,
      required String body,
      var payload}) async {
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        id, title, body, notificationDetails);
  }

  /*void scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime datetime,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await _flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(datetime, tz.local), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }*/

  void stopNotification() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}
