import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/doctor_delete_account_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class PDeleteAccount extends StatefulWidget {
  const PDeleteAccount({Key? key}) : super(key: key);

  @override
  State<PDeleteAccount> createState() => _PDeleteAccountState();
}

class _PDeleteAccountState extends State<PDeleteAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      resizeToAvoidBottomInset: true,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbarlarge.png',
        appBarText: 'Delete Account',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  "Email ",
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter your email';
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(isDense: true,
                      border: InputBorder.none,
                      hintText: "Enter your email",
                      hintStyle: kManRope_400_16_001314),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Password  ",
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter your password';
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(isDense: true,
                      border: InputBorder.none,
                      hintText: "Enter your password",
                      hintStyle: kManRope_400_16_001314),
                ),
                SizedBox(
                  height: 140.h,
                ),
                Text(
                  "When you delete your account, all the user generated content is normally erased (although there are small exceptions), while all the log data is preserved – forever”. The preserved log data won't have your name attached to it,",
                  style: kManRope_400_14_626A6A,
                ),
                SizedBox(height: 136.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: MainButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PTabsScreen()));
                            },
                            child: Text(
                              "Cancel",
                              style: kManRope_500_16_Black,
                            ),
                            color: kEDF6F9,
                            shape: CustomDecoration().button16Decoration()),
                      ),
                    ),
                    // SizedBox(width: 16.w,),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: MainButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final resp = DoctorDeleteAccountApi().get(
                                    email: emailController.text,
                                    password: passwordController.text
                                );
                                resp.then((value) {
                                  print(value);
                                  if (value['status'] == true) {
                                    Fluttertoast.showToast(
                                        msg: 'Profile Successfully Deleted');
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => OnBoardingScreen()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: value['error']);
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Delete Account",
                              style: kManRope_500_16_white,
                            ),
                            color: kB64C4C,
                            shape: CustomDecoration().button16Decoration()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
