import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/tabs_screen/psychologist_home_screen.dart';
import 'package:greymatter/widgets/buttons.dart';
// dart';
// import 'package:greymatter/constants/fonts.dart';
// import 'package:greymatter/screens/psychologist_screen/tabs_screen/psychologist_home_screen.dart';
// import 'package:greymatter/widgets/buttons.dart';

class PANVerified extends StatefulWidget {
  const PANVerified({Key? key}) : super(key: key);

  @override
  State<PANVerified> createState() => _PANVerifiedState();
}

class _PANVerifiedState extends State<PANVerified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 122.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/successful.png',
                        height: 216.h,
                        width: 216.w,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: Text(
                      'PAN Verified!',
                      style: kManRope_500_22_4CB15C,
                    )),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Your PAN has successfully verified!',
                      style: kManRope_500_18_001314,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'Hi John Doe, tap on continue to confirm my name\nand PAN',
                      style: kManRope_400_14_626A6A,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      'ABSHDW4678942',
                      style: kManRope_500_14_006D77,
                    ),
                    SizedBox(
                      height: 127.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MainButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PsychologistHomeScreen()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child: Text(
                                    "Go Home",
                                    style: kManRope_500_16_white,
                                  ),
                                ),
                                color: k006D77,
                                shape: CustomDecoration().button16Decoration()))
                      ],
                    ),
                    // Center(
                    //   child: CustomActiveTextButton(
                    //       onPressed: () {}, text: 'Go to Home'),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
