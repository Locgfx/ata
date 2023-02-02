import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/pan_verfied_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

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
      backgroundColor: kEDF6F9,
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
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 50,
                    ),
                    SizedBox(height: 85.h),
                    Text(
                      'Verifying your PAN Number, don\'t press back button or close the application.',
                      style: kManRope_500_20_001314,
                    ),
                    SizedBox(height: 22.h),
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
