import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/tabs_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class PANVerified extends StatefulWidget {
  const PANVerified({Key? key}) : super(key: key);

  @override
  State<PANVerified> createState() => _PANVerifiedState();
}

class _PANVerifiedState extends State<PANVerified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(36),
                    topLeft: Radius.circular(36)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 122.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/sd3.gif',
                        height: 216.w,
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
                      'Hi John Doe, Please wait while PAN is being verified for PAN',
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
                            child: SizedBox(
                          height: 56.h,
                          child: MainButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PTabsScreen()));
                              },
                              child: Text(
                                "Go Home",
                                style: kManRope_500_16_white,
                              ),
                              color: k006D77,
                              shape: CustomDecoration().button16Decoration()),
                        ))
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
          ],
        ),
      ),
    );
  }
}
