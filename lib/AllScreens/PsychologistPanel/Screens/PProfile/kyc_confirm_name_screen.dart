import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/Kycconfirmname.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class ConfirmName extends StatefulWidget {
  const ConfirmName({Key? key}) : super(key: key);

  @override
  State<ConfirmName> createState() => _ConfirmNameState();
}

class _ConfirmNameState extends State<ConfirmName> {

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 5), () {
  //     setPage();
  //   });
  //   //setPage();
  // }
  //
  // setPage() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => PANVerified()));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
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
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 76.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/company-employees-checking-daily.png',
                      height: 276.h,
                      width: 276.w,
                    )),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Confirm your Name',
                      style: kManRope_500_20_001314,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'Hi John Doe, tap on continue to confirm my name and PAN',
                      style: kManRope_500_14_626A6A,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      'ABSHDW4678942',
                      style: kManRope_500_14_006D77,
                    ),
                    SizedBox(
                      height: 122.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height:56.h,
                            child: MainButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => KycConfirmName()));
                                },
                                child: Text(
                                  "Next",
                                  style: kManRope_500_16_white,
                                ),
                                color: k006D77,
                                shape: CustomDecoration().button16Decoration()),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: SizedBox(height:56,
                    //           child: MainButton(
                    //               onPressed: () {
                    //                 Navigator.of(context).push(MaterialPageRoute(
                    //                     builder: (context) => KycConfirmName()));
                    //               },
                    //               child: Text(
                    //                 "Next",
                    //                 style: kManRope_500_16_white,
                    //               ),
                    //               color: k006D77,
                    //               shape: CustomDecoration().button16Decoration()),
                    //         ))
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
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding:EdgeInsets.only(bottom: 76.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height:56.h,
                              child: MainButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Edit PAN",
                                    style: kManRope_500_16_006D77,
                                  ),
                                  color: kFFFFFF,
                                  shape: CustomDecoration().outline16ButtonDecoration()),
                            ),
                          ),
                        ],
                      ),
                    ),

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
            )
          ],
        ),
      ),
    );
  }
}
