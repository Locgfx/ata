import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UTabsScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';

class UWelcomeScreen extends StatefulWidget {
  const UWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<UWelcomeScreen> createState() => _UWelcomeScreenState();
}

class _UWelcomeScreenState extends State<UWelcomeScreen> {
  String name = "User";
  _getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString(Keys().userName)!;
    });
    log("prefs $name");
  }

  @override
  void initState() {
    _getPrefs();
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => UTabsScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              TweenAnimationBuilder(
                  duration: Duration(milliseconds: 700),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(top: value * 30),
                        child: child,
                      ),
                    );
                  },
                  child: Text('Hi $name,', style: kManRope_700_24_8A9393)),
              // SizedBox(height: 16.h),
              TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double value, Widget? child) {
                  return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(top: value * 20),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  'Welcome to AtarAxis, your personal healing app',
                  style: kManRope_700_24_001314,
                ),
              ),
              SizedBox(height: 150.h),
              Center(
                child: Image.asset('assets/images/welcomegif',
                    width: 200.w, height: 200.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
