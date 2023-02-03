import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Atar ',
              home: //MySessionPage(),
                  //   BookingSuccessfulScreen()
                  //SessionSuccessful()
                  SplashScreen());
          //PostScreen());
        });
  }
}
