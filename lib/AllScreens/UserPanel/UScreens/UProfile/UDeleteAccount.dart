import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_delete_account_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class UDeleteAccountScreen extends StatefulWidget {
  const UDeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<UDeleteAccountScreen> createState() => _UDeleteAccountScreenState();
}

class _UDeleteAccountScreenState extends State<UDeleteAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: kEDF6F9,
        resizeToAvoidBottomInset: true,
        appBar: CustomWhiteAppBar(
          hasThreeDots: false,
          imgPath: 'assets/images/iconbackappbarlarge.png',
          appBarText: 'Delete Account',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  "Email ",
                  style: kManRope_400_16_626A6A,
                ),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(isDense: true,
                      border: InputBorder.none,
                      hintText: "Enter your email",
                      hintStyle:kManRope_400_16_001314),
                ),

                SizedBox(height: 40.h),
                Text(
                  "Password  ",
                  style: kManRope_400_16_626A6A,
                ),

                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Enter your password",
                      hintStyle:kManRope_400_16_001314),
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
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (context) => PTabsScreen()));
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
                      child: MainButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final resp = UserDeleteAccountAPi().get(
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
                                  /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDashboard()),
                                );*/

                                }
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Text(
                              "Delete Account",
                              style: kManRope_500_16_white,
                            ),
                          ),
                          color: kB64C4C,
                          shape: CustomDecoration().button16Decoration()),
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
