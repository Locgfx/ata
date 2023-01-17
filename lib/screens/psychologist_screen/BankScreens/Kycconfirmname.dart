import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/pan_verfied_screen.dart';

class KycConfirmName extends StatefulWidget {
  const KycConfirmName({Key? key}) : super(key: key);

  @override
  State<KycConfirmName> createState() => _KycConfirmNameState();
}

class _KycConfirmNameState extends State<KycConfirmName> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setPage();
    });
    //setPage();
  }

  setPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PANVerified()));
  }
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
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 91.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/blue arrows.png',
                      height: 216.h,
                      width: 216.w,
                    )),
                    SizedBox(
                      height: 85.h,
                    ),
                    Text(
                      'Confirm your Name',
                      style: kManRope_500_20_001314,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'Hi John Doe, tap on continue to confirm my name\nand PAN',
                      style: kManRope_500_14_626A6A,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      'ABSHDW4678942',
                      style: kManRope_500_14_006D77,
                    ),
                    // SizedBox(
                    //   height: 133.h,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: MainButton(
                    //             onPressed: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (context) => PANVerified()));
                    //             },
                    //             child: Padding(
                    //               padding: EdgeInsets.symmetric(vertical: 20.h),
                    //               child: Text(
                    //                 "Next",
                    //                 style: kManRope_500_16_white,
                    //               ),
                    //             ),
                    //             color: k006D77,
                    //             shape: CustomDecoration().button16Decoration()))
                    //   ],
                    // ),
                    // Center(
                    //   child: CustomActiveTextButton(
                    //       onPressed: () {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => PANVerified()));
                    //       },
                    //       text: 'Next'),
                    // ),
                    // SizedBox(
                    //   height: 16.h,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: MainButton(
                    //             onPressed: () {},
                    //             child: Padding(
                    //               padding: EdgeInsets.symmetric(vertical: 20.h),
                    //               child: Text(
                    //                 "Edit PAN",
                    //                 style: kManRope_500_16_006D77,
                    //               ),
                    //             ),
                    //             color: kFFFFFF,
                    //             shape: CustomDecoration()
                    //                 .outline16ButtonDecoration()))
                    //   ],
                    // ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     height: 56.h,
                    //     width: 380.w,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       border: Border.all(color: k006D77),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         'Edit PAN',
                    //         style: kManRope_500_16_006D77,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
