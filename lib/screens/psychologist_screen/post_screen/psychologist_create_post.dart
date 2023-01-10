import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';

class PsychologistCreatePostScreen extends StatelessWidget {
  const PsychologistCreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 100),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: MainButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "Post",
                  style: kManRope_400_16_white,
                ),
              ),
              color: k006D77,
              shape: CustomDecoration().smallButton10Decoration()),
        ),
      ),
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        appBarText: 'Create post',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/userP.png"),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
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
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/camera2.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/files.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 380.w,
                height: 500.h,
                decoration: BoxDecoration(
                    // borderRadius: const BorderRadius.all(Radius.circular(8)),
                    // border: Border.all(
                    //   color: const Color(0xFFDFDFDF),
                    // ),
                    ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What do you want to share?...',
                      hintStyle: kManRope_400_14_626A6A,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
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
