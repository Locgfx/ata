import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/ULoginScreens/UForgotPasswordOtpScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/USignupScreens/USingupMobileScreen.dart';
import 'package:greymatter/Apis/UserAPis/loginapi/loginapi.dart';
import 'package:greymatter/Apis/UserAPis/loginapi/user_forgot_password_otp_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/shared/buttons/third_party_button/google_sign_in_button.dart';
import '../UWelcome/UWelcomeScreen.dart';

class ULoginScreen extends StatefulWidget {
  final bool showBack;

  ULoginScreen({Key? key, required this.showBack}) : super(key: key);

  @override
  State<ULoginScreen> createState() => _ULoginScreenState();
}

class _ULoginScreenState extends State<ULoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool hasEmailFocus = false;
  bool hasPassFocus = false;
  bool emailEmpty = true;
  bool passEmpty = true;

  bool visible = true;

  final passwordNode = FocusNode();
  final emailNode = FocusNode();

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

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return widget.showBack
        ? Scaffold(
            backgroundColor: kEDF6F9,
            body: Stack(
              children: [
                SafeArea(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.showBack)
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 56,
                                child: Image.asset(
                                  'assets/images/iconbackappbar2.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          if (widget.showBack) SizedBox(height: 24),
                          Text('Login', style: kManRope_700_20_001314),
                          SizedBox(height: 16),
                          Text(
                            'Please enter your registered email id or mobile number to continue.',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(height: 40),
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
                                    if (_emailController.text.trim().isEmpty &&
                                        _emailController.text.contains("@")) {
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
                                key: _formKey2,
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
                                    if (_passwordController.text
                                        .trim()
                                        .isEmpty) {
                                      return 'Please enter a valid password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _passwordController,
                                  obscureText: visible,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 8),
                                    labelText: 'Password',
                                    labelStyle: kManRope_400_16_626A6A,
                                    floatingLabelStyle: kManRope_400_20_626A6A,
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 24.w, minWidth: 24.h),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            visible = !visible;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                            'assets/icons/eyeopen.svg')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          InkWell(
                              onTap: () {
                                if (_emailController.text.trim().isEmpty) {
                                  _formKey.currentState!.validate();
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    final resp = UserForgotPasswordOtpApi().get(
                                      emailMobile: _emailController.text,
                                    );
                                    print(_emailController.text);
                                    resp.then((value) async {
                                      print(value);
                                      if (value['status'] == false) {
                                        Fluttertoast.showToast(
                                            msg: 'login failed');
                                      } else {
                                        var prefs = await SharedPreferences
                                            .getInstance();
                                        prefs.setString(
                                            'cookies', value['session_id']);
                                        //print(value['session_id']);
                                        //print(prefs.getString(Keys().cookie));
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    UForgotPasswordOTPScreen(
                                                      signUpField:
                                                          _emailController.text,
                                                    ),
                                                settings: RouteSettings(
                                                    arguments: _emailController
                                                        .text)));

                                        Fluttertoast.showToast(
                                            msg: 'Your OTP is ${value['otp']}');
                                      }
                                    });
                                  }
                                }
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10),
                                  child: Text('Forgot Password',
                                      style: kManRope_500_14_BC2445))),
                          SizedBox(height: 30.h),
                          emailEmpty
                              ? CustomDeactiveTextButton(
                                  onPressed: () {}, text: 'Login')
                              : passEmpty
                                  ? CustomDeactiveTextButton(
                                      onPressed: () {}, text: 'Login')
                                  : CustomActiveTextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          final resp = UserLoginApi().get(
                                              username: _emailController.text,
                                              password:
                                                  _passwordController.text);
                                          resp.then((value) async {
                                            print(value);
                                            setState(() {
                                              loading = false;
                                            });
                                            if (value['status'] == false) {
                                              Fluttertoast.showToast(
                                                  msg: value['error']);
                                            } else {
                                              var prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString(Keys().email,
                                                  _emailController.text);
                                              prefs.setString(Keys().password,
                                                  _passwordController.text);
                                              prefs.setString('cookies',
                                                  value['session_id']);
                                              //print(value['session_id']);
                                              //print(prefs.getString(Keys().cookie));
                                              prefs.setBool(
                                                  Keys().loginDone, true);
                                              prefs.setString(Keys().userName,
                                                  value['email']);
                                              Fluttertoast.showToast(
                                                  msg: 'Login Successful');
                                              if (prefs.getBool(
                                                      Keys().questionsDone) ??
                                                  false) {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            UWelcomeScreen()));
                                              } else {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UQuestions()));
                                              }
                                            }
                                          });
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
                                  builder: (ctx) => USignupMobileScreen()));
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
                if (loading) LoadingWidget(),
              ],
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              backgroundColor: kEDF6F9,
              body: Stack(
                children: [
                  SafeArea(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.showBack)
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: 56,
                                  child: Image.asset(
                                    'assets/images/iconbackappbar2.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            if (widget.showBack) SizedBox(height: 24),
                            Text('Login', style: kManRope_700_20_001314),
                            SizedBox(height: 16),
                            Text(
                              'Please enter your registered email id or mobile number to continue.',
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(height: 40),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      if (_emailController.text
                                              .trim()
                                              .isEmpty &&
                                          _emailController.text.contains("@")) {
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
                                  key: _formKey2,
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
                                      if (_passwordController.text
                                          .trim()
                                          .isEmpty) {
                                        return 'Please enter a valid password';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _passwordController,
                                    obscureText: visible,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 8),
                                      labelText: 'Password',
                                      labelStyle: kManRope_400_16_626A6A,
                                      floatingLabelStyle:
                                          kManRope_400_20_626A6A,
                                      suffixIconConstraints: BoxConstraints(
                                          minHeight: 24.w, minWidth: 24.h),
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              visible = !visible;
                                            });
                                          },
                                          child: SvgPicture.asset(
                                              'assets/icons/eyeopen.svg')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            InkWell(
                                onTap: () {
                                  if (_emailController.text.trim().isEmpty) {
                                    _formKey.currentState!.validate();
                                  } else {
                                    if (_formKey.currentState!.validate()) {
                                      final resp =
                                          UserForgotPasswordOtpApi().get(
                                        emailMobile: _emailController.text,
                                      );
                                      print(_emailController.text);
                                      resp.then((value) async {
                                        print(value);
                                        if (value['status'] == false) {
                                          Fluttertoast.showToast(
                                              msg: 'login failed');
                                        } else {
                                          var prefs = await SharedPreferences
                                              .getInstance();
                                          prefs.setString(
                                              'cookies', value['session_id']);
                                          //print(value['session_id']);
                                          print(prefs.getString(Keys().cookie));
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      UForgotPasswordOTPScreen(
                                                        signUpField:
                                                            _emailController
                                                                .text,
                                                      ),
                                                  settings: RouteSettings(
                                                      arguments:
                                                          _emailController
                                                              .text)));
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             UForgotPasswordOTPScreen(
                                          //               signUpField:
                                          //               _emailController.text,
                                          //             )));
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Your OTP is ${value['otp']}');
                                        }
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, right: 10),
                                    child: Text('Forgot Password',
                                        style: kManRope_500_14_BC2445))),
                            SizedBox(height: 30.h),
                            emailEmpty
                                ? CustomDeactiveTextButton(
                                    onPressed: () {}, text: 'Login')
                                : passEmpty
                                    ? CustomDeactiveTextButton(
                                        onPressed: () {}, text: 'Login')
                                    : CustomActiveTextButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              loading = true;
                                            });
                                            final resp = UserLoginApi().get(
                                                username: _emailController.text,
                                                password:
                                                    _passwordController.text);
                                            resp.then((value) async {
                                              print(value);
                                              setState(() {
                                                loading = false;
                                              });
                                              if (value['status'] == false) {
                                                Fluttertoast.showToast(
                                                    msg: value['error']);
                                              } else {
                                                var prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                prefs.setString('cookies',
                                                    value['session_id']);
                                                print(value['session_id']);
                                                print(prefs
                                                    .getString(Keys().cookie));
                                                prefs.setBool(
                                                    Keys().loginDone, true);
                                                Fluttertoast.showToast(
                                                    msg: 'Login Successful');
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UQuestions()));
                                              }
                                            });
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
                                    builder: (ctx) => USignupMobileScreen()));
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
                  if (loading) LoadingWidget(),
                ],
              ),
            ),
          );
  }
}
