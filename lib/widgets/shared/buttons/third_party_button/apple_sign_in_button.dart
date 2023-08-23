import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import '../../../../AllScreens/UserPanel/UScreens/UWelcome/UWelcomeScreen.dart';
import '../../../../Apis/apple_signin_api.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../constants/globals.dart';

class AppleSigninButton extends StatefulWidget {
  const AppleSigninButton({Key? key}) : super(key: key);

  @override
  State<AppleSigninButton> createState() => _AppleSigninButtonState();
}

class _AppleSigninButtonState extends State<AppleSigninButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SpinKitThreeBounce(
            color: k006D77,
            size: 30,
          )
        : GestureDetector(
            onTap: () async {
              var _prefs = await SharedPreferences.getInstance();
              final credential = await SignInWithApple.getAppleIDCredential(
                scopes: [
                  AppleIDAuthorizationScopes.email,
                  AppleIDAuthorizationScopes.fullName,
                ],
              );
              // print(credential);
              print(credential.identityToken);
              print(credential.authorizationCode);
              print(credential.userIdentifier);
              print(credential.email);
              print(credential.familyName);
              print(credential.givenName);
              setState(() {
                // _isLoading = true;
              });
              if (credential.email != null) {
                _prefs.setString('apple_user_email', credential.email!);
              }
              final resp = AppleSignInApi().get(
                idToken: credential.identityToken!,
                auCode: credential.authorizationCode,
                name: credential.givenName.toString(),
                email: credential.email.toString(),
              );
              resp.then((value) async {
                // log(value.toString());
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
                  prefs.setString(Keys().email, value['email']);
                  prefs.setString(Keys().userName, value['name']);
                  print(prefs.setString(Keys().userName, value['name']));
                  prefs.setString(
                      Keys().appleEmail, credential.email.toString());
                  prefs.setString(
                      Keys().appleName, credential.givenName.toString());
                  print(prefs.setString(
                      Keys().appleEmail, credential.email.toString()));
                  print({
                    prefs.setString(
                        Keys().appleName, credential.givenName.toString())
                  });
                  if (value["login_status"] == "login") {
                    // var prefs = await SharedPreferences.getInstance();
                    // prefs.setString('cookies', value['session_id']);

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => UWelcomeScreen()));
                  } else {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString('cookies', value['session_id']);
                    prefs.setBool(Keys().isUser, true);
                    prefs.setBool(Keys().loginDone, true);
                    prefs.setString(Keys().userName, value['name']);
                    prefs.setString(Keys().userImage, value['image']);
                    prefs.setString(Keys().userType, "u");
                    prefs.setString(Keys().email, value['email']);
                    prefs.setString(Keys().password, credential.identityToken!);
                    prefs.setString(Keys().loginWith, "apple");
                    prefs.setString(
                        Keys().appleEmail, credential.email.toString());
                    prefs.setString(
                        Keys().appleName, credential.givenName.toString());
                    print(prefs.setString(
                        Keys().appleEmail, credential.email.toString()));
                    print({
                      prefs.setString(
                          Keys().appleName, credential.givenName.toString())
                    });
                    print(prefs.setString(Keys().loginWith, "apple"));
                    setState(() {
                      // _isLoading = false;
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
                  Image.asset('assets/icons/icons8-apple-logo-50 1.png',
                      width: 18.w, height: 18.h),
                  SizedBox(width: 8.w),
                  Text(
                    'Continue with Apple',
                    style: kManRope_500_16_626A6A,
                  )
                ],
              ),
            ),
          );
  }
}
