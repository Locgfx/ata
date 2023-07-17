import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/google_sign_in_api/google_sign_in_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/third_party_login/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import '../../../../AllScreens/UserPanel/UScreens/USignupScreens/UGoogleSignUpAddDetails.dart';
import '../../../../AllScreens/UserPanel/UScreens/UWelcome/UWelcomeScreen.dart';
import '../../../../constants/globals.dart';

class CustomGoogleSignInButton extends StatefulWidget {
  const CustomGoogleSignInButton({Key? key}) : super(key: key);

  @override
  State<CustomGoogleSignInButton> createState() =>
      _CustomGoogleSignInButtonState();
}

class _CustomGoogleSignInButtonState extends State<CustomGoogleSignInButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SpinKitThreeBounce(
            color: k006D77,
            size: 30,
          )
        : InkWell(
            onTap: () async {
              final auth = await GoogleSignInClass().login();
              setState(() {
                _isLoading = true;
              });
              log(auth.idToken!.length.toString());
              final resp = GoogleSignInApi().get(idToken: auth.idToken!);
              resp.then((value) async {
                log(value.toString());
                if (value == false) {
                  Fluttertoast.showToast(
                      msg: "Sign in failed! Please try again.");
                  setState(() {
                    _isLoading = false;
                  });
                } else if (value['status'] == false) {
                  setState(() {
                    _isLoading = false;
                  });
                  Fluttertoast.showToast(msg: value['error']);
                } else {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString('cookies', value['session_id']);
                  if (value["login_status"] == "signup") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => UGoogleSignUpAddDetails()));
                  } else {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString('cookies', value['session_id']);
                    prefs.setBool(Keys().isUser, true);
                    prefs.setBool(Keys().loginDone, true);
                    prefs.setString(Keys().userName, value['name']);
                    prefs.setString(Keys().userImage, value['image']);
                    prefs.setString(Keys().userType, "u");
                    prefs.setString(Keys().email, value['email']);
                    prefs.setString(Keys().password, auth.idToken!);
                    prefs.setString(Keys().loginWith, "google");
                    setState(() {
                      _isLoading = false;
                    });
                    if (value["ques"] == 0) {
                      prefs.setBool(Keys().questionsDone, true);
                      Fluttertoast.showToast(msg: 'Login Successful');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => UWelcomeScreen()));
                    } else {
                      Fluttertoast.showToast(msg: 'Login Successful');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UQuestions()));
                    }

                    log(value.toString());
                  }
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                  border: Border.all(color: kB5BABA),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/googleicon.png',
                      width: 18.w, height: 18.h),
                  SizedBox(width: 8.w),
                  Text(
                    'Continue with Google',
                    style: kManRope_500_16_626A6A,
                  )
                ],
              ),
            ),
          );
  }
}
