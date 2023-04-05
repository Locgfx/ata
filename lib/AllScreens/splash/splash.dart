import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UTabsScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/ULoginScreens/ULoginScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //setPage();
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
          if (questionsDone) {
            log(questionsDone.toString() + " question done");
            /*final resp = UserLoginApi().get(
              username: 'user01@gmail.com' */ /*prefs.getString(Keys().email)!*/ /*,
              password: '1234' */ /*prefs.getString(Keys().password)!*/ /*,
            );
            resp.then((value) {
              if (value['status'] == false) {
                Fluttertoast.showToast(
                    msg: value['Error! Please Login Again.']);
              } else {
                prefs.setString(Keys().cookie, value['session_id']);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UTabsScreen(),
                  ),
                );
              }
            });*/
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UTabsScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UQuestions(),
              ),
            );
          }
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PTabsScreen(),
            ),
          );
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
