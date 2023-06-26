import 'dart:developer';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as latest;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

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
    latest.initializeTimeZones();
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

  void scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime datetime,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    //log(datetime.toString() + "khjhguyg");
    //await _flutterLocalNotificationsPlugin.zonedSchedule(id, title, body, scheduledDate, notificationDetails, uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation, androidAllowWhileIdle: androidAllowWhileIdle)
    await _flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(datetime, tz.local), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        // matchDateTimeComponents: DateTimeComponents.time,
        androidAllowWhileIdle: true);
  }

  void scheduleMTSNotification({
    required int id,
    required String title,
    required String body,
    required DateTime datetime,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    DateTime date = datetime;
    List<int> _intList = [1, 2, 3, 4, 5, 6];
    if (date.weekday > 6) {
    } else {
      for (var v in _intList) {
        if (date.weekday > 6) {
          date.add(Duration(days: 1));
        }

        await _flutterLocalNotificationsPlugin.zonedSchedule(99999 + v, title,
            body, tz.TZDateTime.from(date, tz.local), notificationDetails,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidAllowWhileIdle: true);
        date.add(Duration(days: 1));
        log(date.weekday.toString());
        log(date.toString());
      }
    }
  }

  void periodicNotification({
    required int id,
    required String title,
    required String body,
    //required DateTime datetime,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    //await _flutterLocalNotificationsPlugin.zonedSchedule(id, title, body, scheduledDate, notificationDetails, uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation, androidAllowWhileIdle: androidAllowWhileIdle)
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.daily, notificationDetails,
        androidAllowWhileIdle: true);
  }

  void stopNotification() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }

  void cancelNotification(int id) async {
    _flutterLocalNotificationsPlugin.cancel(id);
  }
}
