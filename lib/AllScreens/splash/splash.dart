import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UTabsScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/ULoginScreens/ULoginScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    if (firstRun) {
      prefs.setBool(Keys().firstRun, false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        ),
      );
    } else {
      if (loginDone) {
        if (isUser) {
          if (questionsDone) {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ULoginScreen(showBack: false),
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
                'Axis',
                style: kManRope_400_32_white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
