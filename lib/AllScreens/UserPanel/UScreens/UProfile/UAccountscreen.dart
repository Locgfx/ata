import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangeMobileno.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangemail.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangepassword.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UDeleteAccount.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_profile_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UAccountScreen extends StatefulWidget {
  final UserProfileModel model;
  final Function onTap;
  const UAccountScreen({Key? key, required this.model, required this.onTap})
      : super(key: key);

  @override
  State<UAccountScreen> createState() => _UAccountScreenState();
}

class _UAccountScreenState extends State<UAccountScreen> {
  @override
  void dispose() {
    widget.onTap();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Account',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 51.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UChangeMobileNoScreen(
                            model: widget.model,
                          )));
                },
                child: Container(
                  color: Colors.transparent,
                  height: 48.h,
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change mobile number",
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        // color: Colors.red,
                        child: Image.asset(
                          "assets/images/iconrightblack.png",
                          fit: BoxFit.cover,
                          color: k626A6A,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UChangeEmailScreen(
                            model: widget.model,
                          )));
                },
                child: Container(
                  color: Colors.transparent,
                  height: 48.h,
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change email",
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        // color: Colors.red,
                        child: Image.asset(
                          "assets/images/iconrightblack.png",
                          fit: BoxFit.cover,
                          color: k626A6A,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UChangePasswordScreen()));
                },
                child: Container(
                  color: Colors.transparent,
                  height: 48.h,
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change password",
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        // color: Colors.red,
                        child: Image.asset(
                          "assets/images/iconrightblack.png",
                          fit: BoxFit.cover,
                          color: k626A6A,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UDeleteAccountScreen()));
                },
                child: SizedBox(
                  height: 48.h,
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delete Account",
                        style: kManRope_500_16_BD4D4D,
                      ),
                      // Image.asset("assets/images/icondropdown.png",height: 48.h,width: 48.h,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
