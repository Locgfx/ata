import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/screens/profile_screens/agreement_details_screen.dart';
import 'package:greymatter/screens/profile_screens/privacy_and_policy_screen.dart';
import 'package:greymatter/screens/profile_screens/terms_and_conditions_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class AgreementScreen extends StatelessWidget {
 const AgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        imgPath: 'assets/images/iconbackappbarlarge.png',
        appBarText: 'Agreement',
      ),
      // appBar: AppBar(
      //   centerTitle: false,
      //   elevation: 0,
      //   leadingWidth: 40.w,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Agreement',
      //     style: kManRope_500_16_006D77,
      //   ),
      //   titleSpacing: 18.w,
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Padding(
      //       padding: EdgeInsets.all(20.0),
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //         size: 20,
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  AgreementDetails()));
              },
              child: SizedBox(
                height: 48.h,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Agreement',
                      style: kManRope_500_16_001314,
                    ),
                    Image.asset(
                      'assets/images/iconrightarrow6262.png',
                      height: 48.h,
                      width: 48.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrivacyAndPolicyScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy and Policy',
                    style: kManRope_500_16_001314,
                  ),
                  Image.asset(
                    'assets/images/iconrightarrow6262.png',
                    height: 48.h,
                    width: 48.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            // SizedBox(
            //   height: 37.h,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: kManRope_500_16_001314,
                  ),
                  Image.asset(
                    'assets/images/iconrightarrow6262.png',
                    height: 48.h,
                    width: 48.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
