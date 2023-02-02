import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/constants/fonts.dart';

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

  setPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (_) => UHomeScreen(),
        builder: (_) => OnBoardingScreen(),
      ),
    );
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
