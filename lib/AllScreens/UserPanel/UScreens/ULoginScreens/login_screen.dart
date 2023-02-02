import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/question_screen1.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/USignupScreens/enter_mobile_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/USignupScreens/reset_password_otp_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';

import '../../../../widgets/shared/buttons/third_party_button/google_sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool emailEmpty = true;

  bool passEmpty = true;
  final passwordNode = FocusNode();
  final emailNode = FocusNode();
  bool hasPassFocus = false;
  bool hasEmailFocus = false;
  @override
  void initState() {
    super.initState();
    emailNode.addListener(() {
      setState(() {
        hasEmailFocus = !hasEmailFocus;
        hasPassFocus = !hasPassFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 24),
                    child: SvgPicture.asset('assets/icons/appbar48x48.svg'),
                  ),
                ),
                SizedBox(height: 24.h),
                Text('Login', style: kManRope_700_20_001314),
                SizedBox(height: 16.h),
                Text(
                    'Please enter your registered email id or mobile number to continue.',
                    style: kManRope_400_14_626A6A),
                SizedBox(height: 40.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*if (_emailController.text.trim().isNotEmpty)
                      Text('Email / Mobile Number',
                          style: kManRope_400_14_626A6A),
                    if (hasEmailFocus) SizedBox(height: 14),*/
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        focusNode: emailNode,
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
                        validator: (val) {
                          if (_emailController.text.trim().isEmpty) {
                            return 'Please enter an email/mobile';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          // isCollapsed: true,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: k5A72ED,
                              width: 1,
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kB5BABA,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kB5BABA,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(top: 8),
                          labelText: 'Email / Mobile Number',
                          labelStyle: kManRope_400_16_626A6A,
                          //floatingLabelStyle: kManRope_400_20_626A6A,
                        ),
                      ),
                    ),
                    SizedBox(height: 38.h),
                    /*if (_passwordController.text.trim().isNotEmpty)
                      Text('Password', style: kManRope_400_14_626A6A),
                    if (hasPassFocus) SizedBox(height: 14),*/
                    Form(
                      key: _formKey1,
                      child: TextFormField(
                        focusNode: passwordNode,
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              passEmpty = false;
                              hasPassFocus = true;
                            });
                          }
                          if (val.isEmpty) {
                            setState(() {
                              passEmpty = true;
                              hasPassFocus = false;
                            });
                          }
                        },
                        validator: (val) {
                          if (_passwordController.text.trim().isEmpty) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 8),
                          labelText: 'Password',
                          labelStyle: kManRope_400_16_626A6A,
                          //floatingLabelStyle: kManRope_400_20_626A6A,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: k5A72ED,
                              width: 1,
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kB5BABA,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kB5BABA,
                              width: 1,
                            ),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                          suffixIcon:
                              SvgPicture.asset('assets/icons/eyeopen.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                InkWell(
                    onTap: () {
                      if (_emailController.text.trim().isEmpty) {
                        _formKey.currentState!.validate();
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ResetPasswordOTPScreen(),
                            settings: RouteSettings(
                                arguments: _emailController.text)));
                      }
                    },
                    child:
                        Text('Forgot Password', style: kManRope_500_14_BC2445)),
                SizedBox(height: 40.h),
                emailEmpty
                    ? CustomDeactiveTextButton(onPressed: () {}, text: 'Login')
                    : passEmpty
                        ? CustomDeactiveTextButton(
                            onPressed: () {}, text: 'Login')
                        : CustomActiveTextButton(
                            onPressed: () {
                              var _isValid = _formKey.currentState!.validate();
                              if (!_isValid) {
                                return;
                              } else {
                                FocusScope.of(context).unfocus();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => Questions()));
                                /*Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => WelcomeScreen()));*/
                              }
                            },
                            text: 'Login'),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Or', style: kManRope_400_16_Black),
                  ],
                ),
                SizedBox(height: 24.h),
                const CustomGoogleSignInButton(),
                SizedBox(height: 22.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => EnterMobileScreen()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'New to cerebral?',
                        style: kManRope_400_14_Black,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'SignUp',
                        style: kManRope_500_16_006D77,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
