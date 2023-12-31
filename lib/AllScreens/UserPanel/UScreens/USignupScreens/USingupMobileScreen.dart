import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Apis/UserAPis/usignupapi/generateotpapi.dart';
import '../../../../widgets/shared/buttons/third_party_button/apple_sign_in_button.dart';
import '../../../../widgets/shared/buttons/third_party_button/google_sign_in_button.dart';
import 'USingupEnterOtpScreen.dart';

class USignupMobileScreen extends StatefulWidget {
  USignupMobileScreen({Key? key}) : super(key: key);

  @override
  State<USignupMobileScreen> createState() => _USignupMobileScreenState();
}

class _USignupMobileScreenState extends State<USignupMobileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mobileController = TextEditingController();

  bool mobileEmpty = true;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldUnFocusOnTap(
      child: Scaffold(
        backgroundColor: kEDF6F9,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 1.sh - 50.h,
                  child: Stack(
                    //mainAxisSize: MainAxisSize.max,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 24, right: 24),
                              child: SvgPicture.asset(
                                  'assets/icons/iosbackarrow.svg'),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text('SignUp', style: kManRope_700_20_001314),
                          SizedBox(height: 16.h),
                          Text('Please enter your mobile number to continue.',
                              style: kManRope_400_14_626A6A),
                          SizedBox(height: 50.h),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/indiaflg.jpg",
                                        height: 42,
                                        width: 42,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (val) {
                                            if (val.isNotEmpty) {
                                              setState(() {
                                                mobileEmpty = false;
                                              });
                                            }
                                            if (_mobileController.text
                                                    .trim()
                                                    .length ==
                                                10) {
                                              FocusScope.of(context).unfocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter a Phone Number";
                                            } else if (_mobileController.text
                                                .startsWith(
                                              RegExp('[1-6]'),
                                            )) {
                                              return "please Enter a Valid Indian Phone Number";
                                            } else {
                                              return null;
                                            }
                                            // if (value!.isEmpty) {
                                            //   return "Please Enter a Phone Number";
                                            // } else if (
                                            // !RegExp(
                                            //         r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                            //     .hasMatch(value)) {
                                            //   return "Please Enter a Valid Phone Number";
                                            // }
                                          },
                                          // validator: (val) {
                                          //   if (_mobileController.text.trim().isEmpty) {
                                          //     return 'Please enter a valid mobile number';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          controller: _mobileController,
                                          decoration: InputDecoration(
                                            prefix: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2.0),
                                              child: Text(
                                                "+91",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            // prefixIcon: Row(
                                            //   children: [
                                            //     Image.asset(
                                            //       "assets/icons/indiaflg.jpg",
                                            //       height: 24,
                                            //       width: 24,
                                            //     ),
                                            //   ],
                                            // ),
                                            labelText: 'Mobile Number',
                                            labelStyle: kManRope_400_16_626A6A,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          CheckboxListTile(
                              activeColor: k006D77,
                              checkColor: Colors.white,
                              checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _isChecked,
                              title: Text(
                                "Get OTP on whatsapp",
                                style: kManRope_400_20_626A6A,
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              }),
                          SizedBox(height: 40.h),
                          mobileEmpty
                              ? CustomDeactiveTextButton(
                                  onPressed: () {}, text: 'Generate OTP')
                              : CustomActiveTextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final resp = Generateotpapi().get(
                                        sendTo: _isChecked,
                                        mobileNo: _mobileController.text,
                                      );
                                      print(_mobileController.text);
                                      resp.then((value) async {
                                        print(value);
                                        if (value['status'] == false) {
                                          Fluttertoast.showToast(
                                              msg: value['error']);
                                        } else {
                                          var prefs = await SharedPreferences
                                              .getInstance();
                                          prefs.setString(
                                              'cookies', value['session_id']);
                                          //print(value['session_id']);
                                          //print(prefs.getString(Keys().cookie));
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      USignEnterOTPScreen(
                                                        signUpField:
                                                            _mobileController
                                                                .text,
                                                      )));

                                          //Fluttertoast.showToast(msg: 'Your OTP is ${value['otp']}');
                                        }
                                      });
                                    }
                                  },
                                  text: 'Generate OTP'),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Or', style: kManRope_400_16_Black),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          CustomGoogleSignInButton(),
                          SizedBox(height: 24.h),
                          Platform.isIOS ? AppleSigninButton() : SizedBox(),
                          SizedBox(height: 22.h),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Already have an Account?',
                                  style: kManRope_400_14_Black,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  'Login',
                                  style: kManRope_500_16_006D77,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 10.w,
                        child: Text(
                          'By creating an account, I accept the Terms & Conditions & Privacy Policy',
                          style: kManRope_400_12_555555,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
