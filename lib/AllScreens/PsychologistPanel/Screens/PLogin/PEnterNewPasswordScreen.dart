import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PLogin/PLoginScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_login_apis/doctor_change_password_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';



class PEnterNewPasswordScreen extends StatefulWidget {
  PEnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<PEnterNewPasswordScreen> createState() => _PEnterNewPasswordScreenState();
}

class _PEnterNewPasswordScreenState extends State<PEnterNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController = TextEditingController();

  bool hasPassFocus = false;
  bool hasCPassFocus = false;
  bool passEmpty = true;
  bool cPassEmpty = true;

  bool visible = true;bool visible2 = true;

  @override
  Widget build(BuildContext context) {
    // final number = ModalRoute.of(context)!.settings.arguments as String;
    return Form(
      key: _formKey,
      child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kEDF6F9,
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset('assets/icons/iosbackarrow.svg'),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text('Create Password', style: kManRope_700_20_001314),
                  SizedBox(height: 16.h),
                  Text('Enter New Password for ',
                      style: kManRope_400_14_626A6A),
                  SizedBox(height: 40.h),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              passEmpty= false;
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
                        controller: _passwordController,
                        obscureText: visible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: kManRope_400_16_626A6A,
                          suffixIconConstraints:
                          BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                          suffixIcon: InkWell(onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                            child: SvgPicture.asset(
                              'assets/icons/eyeopen.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      TextFormField(
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              cPassEmpty= false;
                              hasCPassFocus = true;
                            });
                          }
                          if (val.isEmpty) {
                            setState(() {
                              cPassEmpty = true;
                              hasCPassFocus = false;
                            });
                          }
                        },
                        // validator: (val) {
                        //   if (_confirmPasswordController.text.trim().isEmpty) {
                        //     return 'Please enter a valid password';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        controller: _confirmPasswordController,
                        obscureText: visible2,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: kManRope_400_16_626A6A,
                          suffixIconConstraints:
                          BoxConstraints(minHeight: 20.w, minWidth: 20.h),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                visible2 = !visible2;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/icons/eyeopen.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  passEmpty ?
                  CustomDeactiveTextButton(onPressed: () {}, text: 'Login')
                      :cPassEmpty ?
                  CustomDeactiveTextButton(onPressed: () {}, text: 'Login')
                      :  CustomActiveTextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final resp = PCreateNewPasswordApi().get(
                              newPassword: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text
                          );
                          resp.then((value) {
                            print(value);
                            if (value['status'] == true) {
                              Fluttertoast.showToast(
                                  msg: value['message']);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PLoginScreen()));
                            } else {
                              Fluttertoast.showToast(
                                  msg: value['error']);

                            }
                          });
                        }
                      },
                      text: 'Change Password'),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          )),
    );
  }
}
