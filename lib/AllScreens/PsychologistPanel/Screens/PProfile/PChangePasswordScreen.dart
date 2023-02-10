import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/my_account_screen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/doctor_change_password_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';

class PChangePasswordScreen extends StatefulWidget {
  const PChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<PChangePasswordScreen> createState() => _PChangePasswordScreenState();
}

class _PChangePasswordScreenState extends State<PChangePasswordScreen> {
  bool hasoPassFocus = false;
  bool hasNPassFocus = false;
  bool hasCPassFocus = false;

  bool oPassEmpty = true;
  bool nPassEmpty = true;
  bool cPassEmpty = true;

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Change password',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 44.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Old password ',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 47.h,
                width: 1.sw,
                child: TextFormField(
                  controller: oldPasswordController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        oPassEmpty = false;
                        hasoPassFocus = true;
                      });
                    }
                    if (val.isEmpty) {
                      setState(() {
                        oPassEmpty = true;
                        oPassEmpty = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Enter New password',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 47.h,
                width: 1.sw,
                child: TextFormField(
                  controller: newPasswordController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        nPassEmpty = false;
                        hasNPassFocus = true;
                      });
                    }
                    if (val.isEmpty) {
                      setState(() {
                        nPassEmpty = true;
                        hasNPassFocus = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Confirm new password',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 47.h,
                width: 1.sw,
                child: TextFormField(
                  controller: confirmPasswordController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        cPassEmpty = false;
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
                ),
              ),
              Spacer(),
              oPassEmpty
                  ? CustomDeactiveTextButton(onPressed: () {}, text: 'Next')
                  : nPassEmpty
                      ? CustomDeactiveTextButton(onPressed: () {}, text: 'Next')
                      : cPassEmpty
                          ? CustomDeactiveTextButton(
                              onPressed: () {}, text: 'Next')
                          : CustomActiveTextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final resp = DoctorChangePasswordApi().get(
                                      oldPassword: oldPasswordController.text,
                                      newPassword: newPasswordController.text,
                                      cNewPassword:
                                          confirmPasswordController.text);
                                  resp.then((value) async {
                                    print(value);
                                    if (value['status'] == true) {
                                      Fluttertoast.showToast(
                                          msg: 'Password changed successfully');
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PsychologistAccountScreen()));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: value['error']);
                                    }
                                  });
                                }
                              },
                              text: 'Next',
                            ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
