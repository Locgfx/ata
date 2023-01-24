import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class PsychologistCreatePostScreen extends StatelessWidget {
  const PsychologistCreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 100),
      //   child: Padding(
      //     padding: const EdgeInsets.only(bottom: 60.0),
      //     child: MainButton(
      //         onPressed: () {},
      //         child: Padding(
      //           padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      //           child: Text(
      //             "Post",
      //             style: kManRope_400_16_white,
      //           ),
      //         ),
      //         color: k006D77,
      //         shape: CustomDecoration().smallButton10Decoration()),
      //   ),
      // ),
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        appBarText: 'Create post',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 42.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/images/userP.png'),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Priya Singh',
                          style: kManRope_500_16_001314,
                        ),
                      ],
                    ),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 18,
                          width: 20,
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/images/iconcamera.png',
                            height: 18,
                            width: 20,
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Container(
                          height: 18,
                          width: 20,
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/images/iconpost.png',
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 1.sw,
                height: 546.h,
                decoration: BoxDecoration(

                    ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What do you want to share?...',
                      hintStyle: kManRope_400_14_626A6A,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 96.h),
                child: Center(
                  child: SizedBox(
                    height: 56.h,
                    child: MainButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left:74.w,right: 74.w ),
                          child: Text(
                            "Post",
                            style: kManRope_400_16_white,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().smallButton10Decoration()),
                  ),
                ),
              ),
              // SizedBox(height:96.h ,)


              // Center(
              //   child: SizedBox(
              //     height: 56.h,
              //     width: 182,
              //     child: MaterialButton(
              //       color: k006D77,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10), // <-- Radius
              //       ),
              //       onPressed: () {},
              //       child: Text(
              //         'Post',
              //         style: kManRope_400_16_white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
