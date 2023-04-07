import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:greymatter/AllScreens/splash/splash.dart';
import 'package:greymatter/Notification_handler/notification_service.dart';
import 'package:greymatter/payment_gateway/payment_keys.dart';

NotificationServices notificationServices = NotificationServices();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishKey;

 // await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  notificationServices.initializeNotification();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  notificationServices.resolvePlatformSpecificSettings();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  notificationServices.sendNotification(
      id: 0, title: "title", body: "body", payload: message);
  //fn(message);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    notificationServices.initializeNotification();
    FirebaseMessaging.onMessage.listen(
      (event) async {
        /*  AwesomeNotifications().createNotificationFromJsonData(event.data);
        AwesomeNotifications().actionStream.listen((event1) {
          fn(event);
        });*/
        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;
        if (notification != null && android != null) {
          /*flutterPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  androidChannel.id,
                  androidChannel.name,
                  channelDescription: androidChannel.description,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));*/
          notificationServices.sendNotification(
              id: notification.hashCode,
              title: notification.title ?? "Test0",
              body: notification.body ?? "Test0");
        }
        //fn(event);
        //log(event.data['content']['payload']['type'].toString());
        /*if (event.data['content']['payload']['type'] == 'story') {
          _navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (ctx) => DetailsScreen(
                  userName: event.data['content']['payload']['channel_name'],
                  storyType: event.data['content']['payload']['story_type'],
                  siteUrl: event.data['content']['payload']['href'])));
        } else if (event.data['content']['payload']['type'] == 'system') {
          _navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (_) => TabsScreen(
                tabIndex: 3,
              ),
            ),
          );
        } else {
          log('else');
        }*/
        //log('onmessage' + event.data.toString());
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) async {
        /* AwesomeNotifications().createNotificationFromJsonData(event.data);
        AwesomeNotifications().actionStream.listen((event1) {
          fn(event);
        });*/
        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;
        if (notification != null && android != null) {
          notificationServices.sendNotification(
              id: notification.hashCode,
              title: notification.title ?? "Test1",
              body: notification.body ?? "Test1");
          /* notificationServices
              .sendNotification(id: 0, title: "title", body: "body", payload: message);
          flutterPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  androidChannel.id,
                  androidChannel.name,
                  channelDescription: androidChannel.description,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));*/
        }
        //fn(event);
        /*if (event.data['content']['payload']['type'] == 'story') {
        _navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (ctx) => DetailsScreen(
                userName: event.data['content']['payload']['channel_name'],
                storyType: event.data['content']['payload']['story_type'],
                siteUrl: event.data['content']['payload']['href'])));
      } else if (event.data['content']['payload']['type'] == 'system') {
        _navigatorKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => TabsScreen(
              tabIndex: 3,
            ),
          ),
        );
      } else {
        log('else');
      }*/
        //log('onMessageOpened' + event.data.toString());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ataraxis',
              home: //MySessionPage(),
                  //   BookingSuccessfulScreen()
                  //SessionSuccessful()
                  SplashScreen());
          //PostScreen());
        });
  }
}
