import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UTabsScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_login_apis/Dloginapi.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Apis/Notifications_apis/notification_token_api.dart';
import '../../Apis/UserAPis/loginapi/loginapi.dart';
import '../../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setPage();
    });

    initializeFirebaseService();
    //setPage();
  }

  String _fcmToken = '';
  Future<void> initializeFirebaseService() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String firebaseAppToken = await messaging.getToken(
          vapidKey:
              "BN1Wny0OZHDjGNR2Ktk1YqG3N0Vb7rtwNT9AyOCXjadLRzuAa0TmaufjSh9NJx95KZZI0xEsHObTLe2E5OhGCjQ",
        ) ??
        '';
    if (!mounted) {
      _fcmToken = firebaseAppToken;
    } else {
      setState(() {
        _fcmToken = firebaseAppToken;
      });
    }

    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Keys().fcmToken, _fcmToken);
    print('Firebase token: $firebaseAppToken');
    NotificationTokenApi().get();
  }

  setPage() async {
    var prefs = await SharedPreferences.getInstance();
    bool loginDone = false;
    bool questionsDone = false;
    bool firstRun = true;
    bool isUser = true;
    setState(() {
      firstRun = prefs.getBool(Keys().firstRun) ?? true;
      loginDone = prefs.getBool(Keys().loginDone) ?? false;
      questionsDone = prefs.getBool(Keys().questionsDone) ?? false;
      isUser = prefs.getBool(Keys().isUser) ?? true;
    });
    //log("ques donr $questionsDone");
    if (firstRun) {
      log(firstRun.toString() + "first run");
      prefs.setBool(Keys().firstRun, false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        ),
      );
    } else {
      if (loginDone) {
        log(loginDone.toString());
        if (isUser) {
          log(isUser.toString());

          log(questionsDone.toString() + " question done");
          final resp = UserLoginApi().get(
            username: prefs.getString(Keys().email)!,
            password: prefs.getString(Keys().password)!,
          );
          resp.then((value) {
            // log(value.toString() + "jjjjj");
            if (value['status'] == false) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OnBoardingScreen(),
                ),
              );
              Fluttertoast.showToast(
                  msg: value['Session expired! Please Login Again.']);
            } else {
              prefs.setString(Keys().cookie, value['session_id']);
              if (value["ques"] == 0) {
                // prefs.setBool(Keys().questionsDone, true);
                // Fluttertoast.showToast(msg: 'Login Successful');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UTabsScreen(),
                  ),
                );
              } else {
                //  Fluttertoast.showToast(msg: 'Login Successful');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UQuestions()));
              }
            }
          });
        } else {
          final resp = DoctorLoginApi().get(
            username: prefs.getString(Keys().email)!,
            password: prefs.getString(Keys().password)!,
          );
          resp.then((value) {
            if (value['status'] == false) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OnBoardingScreen(),
                ),
              );
              Fluttertoast.showToast(
                  msg: value['Session expired! Please Login Again.']);
            } else {
              prefs.setString(Keys().cookie, value['session_id']);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PTabsScreen(),
                ),
              );
            }
          });
        }
      } else {
        log("message");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OnBoardingScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: k006D77,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: k006D77,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: k006D77,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Atar',
                style: kManRope_700_32_white,
              ),
              Text(
                'axis',
                style: kManRope_400_32_white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
