import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/chatmessage.dart';
import 'package:greymatter/screens/profile_screens/FAQs_Screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kFFFFFF,
        toolbarHeight: 20,
      ),
      // appBar: CuswhiteAppBar(
      //     appBarText: "Help and support",
      //     imgPath: "assets/images/Vector 175.png"),
      // appBar: AppBar(
      //   elevation: 0,
      //   leadingWidth: 40.w,
      //   backgroundColor: Colors.white,
      //   centerTitle: false,
      //   title: Text(
      //     'Help and support',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 48.h,width: 1.sw,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/iconbackappbar.png",
                      height: 48.h,width: 32.w,),
                    ),
                    SizedBox(width:8.w),
                    Text("Help and support",style: kManRope_500_16_006D77,)
                  ],
                ),
              ),),
              SizedBox(height: 40.h,),

              Image.asset(
                'assets/images/image247.png',
                height: 330.h,
                width: 428.sw,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Tell us how we can help you',
                style: kManRope_700_20_001314,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Our crew of superhero’s are standing\n             by for service and support',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatMessages()));
                      },
                      child: Container(
                        height: 68.h,
                        width: 68.w,
                        decoration: const BoxDecoration(
                            color: k006D77, shape: BoxShape.circle),
                        child: Center(
                            child: SvgPicture.asset('assets/icons/chat.svg',
                                width: 24.h, height: 24.h)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FAQsScreen()));
                      },
                      child: Container(
                        height: 84.h,
                        width: 379.sw,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(

                            left: 16.w,
                            right: 16.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // height: 52.h,
                                // width: 232.w,
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FAQs',
                                      style: kManRope_700_20_001314,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      'Find intelligent aswers instantly',
                                      style: kManRope_400_16_626A6A,
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/righticonlarge.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 48.h),
                      child: Container(
                        height: 84.h,
                        width: 380.sw,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(

                            left: 16.w,
                            right: 16.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // height: 52.h,
                                // width: 232.w,
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: kManRope_700_20_001314,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      'Get solutions beamed to your inbox',
                                      style: kManRope_400_16_626A6A,
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/righticonlarge.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
