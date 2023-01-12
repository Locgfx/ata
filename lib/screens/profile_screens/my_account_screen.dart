import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/screens/profile_screens/change_email_screen.dart';
import 'package:greymatter/screens/profile_screens/change_password_screen.dart';
import 'package:greymatter/screens/profile_screens/delete_account_screen.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'change_mobile_no_screen.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40.w,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'My Account',
          style: kManRope_500_16_006D77,
        ),
        titleSpacing: 18.w,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangeMobileNoScreen()));
              },
              child: Container(
                height: 48.h,
                width: 380.w,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change mobile number',
                      style: kManRope_500_16_001314,
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                      'assets/icons/downArrow.svg',
                      height: 24.h,
                      width: 24.w,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangeEmailScreen()));
              },
              child: Container(
                height: 48.h,
                width: 380.w,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change email',
                      style: kManRope_500_16_001314,
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                      'assets/icons/downArrow.svg',
                      height: 24.h,
                      width: 24.w,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen()));
              },
              child: Container(
                height: 48.h,
                width: 480.w,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change password',
                      style: kManRope_500_16_001314,
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/downArrow.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DeleteAccountScreen()));
              },
              child: Container(
                height: 48.h,
                width: 480.w,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      'Delete Account',
                      style: kManRope_500_16_BD4D4D,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
