import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import 'package:greymatter/Apis/UserAPis/usignupapi/upersonaldetailsapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';

class UAddPersonalDetailsScreen extends StatefulWidget {
  UAddPersonalDetailsScreen({Key? key}) : super(key: key);
  @override
  State<UAddPersonalDetailsScreen> createState() =>
      _UAddPersonalDetailsScreenState();
}

class _UAddPersonalDetailsScreenState extends State<UAddPersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordVisible = true;
  bool passwordVisible2 = true;

  bool nameEmpty = true;
  bool emailEmpty = true;
  bool passwordEmpty = true;
  bool cPasswordEmpty = true;

  bool hasNameFocus = false;
  bool hasEmailFocus = false;
  bool hasPasswordFocus = false;
  bool hasCPasswordFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 24, right: 24),
                      child: SvgPicture.asset('assets/icons/iosbackarrow.svg'),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text('Almost there', style: kManRope_700_20_001314),
                  SizedBox(height: 16.h),
                  Text('Please enter below detailes to complete your profile.',
                      style: kManRope_400_14_626A6A),
                  SizedBox(height: 50.h),
                  Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                nameEmpty = false;
                                hasNameFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                nameEmpty = true;
                                hasNameFocus = false;
                              });
                            }
                          },
                          // validator: (val) {
                          //   if (nameController.text.trim().isEmpty) {
                          //     return 'Please enter a valid email/mobile';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Full name',
                            labelStyle: kManRope_400_16_626A6A,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                emailEmpty = false;
                                hasEmailFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                emailEmpty = true;
                                hasEmailFocus = false;
                              });
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: kManRope_400_16_626A6A,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                passwordEmpty = false;
                                hasPasswordFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                passwordEmpty = true;
                                hasPasswordFocus = false;
                              });
                            }
                          },
                          controller: passwordController,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: passwordVisible
                                  ? SvgPicture.asset(
                                      'assets/icons/eyeclose.svg',
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/eyeopen.svg',
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                cPasswordEmpty = false;
                                hasCPasswordFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                cPasswordEmpty = true;
                                hasCPasswordFocus = false;
                              });
                            }
                          },
                          controller: confirmPasswordController,
                          obscureText: passwordVisible2,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 20.w, minWidth: 20.h),
                            suffixIcon: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  passwordVisible2 = !passwordVisible2;
                                });
                              },
                              child: SizedBox(
                                height: 48,
                                child: passwordVisible2
                                    ? SvgPicture.asset(
                                        'assets/icons/eyeclose.svg',
                                      )
                                    : SvgPicture.asset(
                                        'assets/icons/eyeopen.svg',
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200.h),
                  nameEmpty
                      ? CustomDeactiveTextButton(
                          onPressed: () {}, text: 'SIGNUP')
                      : emailEmpty
                          ? CustomDeactiveTextButton(
                              onPressed: () {}, text: 'SIGNUP')
                          : passwordEmpty
                              ? CustomDeactiveTextButton(
                                  onPressed: () {}, text: 'SIGNUP')
                              : cPasswordEmpty
                                  ? CustomDeactiveTextButton(
                                      onPressed: () {}, text: 'SIGNUP')
                                  : CustomActiveTextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          final resp = UserPersonalDetailsApi()
                                              .get(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  cPassword:
                                                      confirmPasswordController
                                                          .text);
                                          resp.then((value) async {
                                            print(value);
                                            if (value['status'] == true) {
                                              var prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString(Keys().userName,
                                                  nameController.text);
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Profile Setup Successful');
                                              prefs.setString(
                                                  Keys().userType, "u");
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UQuestions()));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: value['error']);
                                              /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDashboard()),
                                  );*/
                                            }
                                          });
                                        }
                                      },
                                      text: 'SIGNUP')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
