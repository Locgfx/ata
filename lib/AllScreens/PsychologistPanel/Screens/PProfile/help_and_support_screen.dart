import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/chatmessage.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/FAQs_Screen.dart';


class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight:30,
        elevation: 0,
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   leadingWidth: 40.w,
      //   backgroundColor: kWhiteBGColor,
      //   centerTitle: false,
      //   title: Text(
      //     'Help and support',
      //     style: kManRope_500_16_006D77,
      //   ),
      //   titleSpacing: 18.w,
      //   leading: GestureDetector(
      //     behavior: HitTestBehavior.translucent,
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
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 24.w,top: 12.h),
              child: Container(
                height: 48,
                // color: Colors.red,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

              },
                      child: Container(
                        // height: 48,
                        //   color: Colors.red,
                          child: Image.asset("assets/images/iconbackappbar2.png",height: 48,width: 32,)),
                    ),
                    Text("Help and support",style: kManRope_500_16_006D77,)

                  ],
                ),
              ),
            ),
            

            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 1.sw,
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/helpAndSupport.png',
                      height: 330.h,
                    ),
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
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatMessages()));
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
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
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const FAQsScreen()));
                          },
                          child: Container(
                            height: 84.h,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(mainAxisAlignment: MainAxisAlignment.center,
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
                                  Center(
                                    child: Container(
                                      height:48,
                                      width: 48,
                                      // color: Colors.red,
                                      child: Image.asset(
                                        'assets/images/iconrightarrowlarge.png',
                                        height: 48.h,
                                        width: 48.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          height: 84.h,
                          width: 1.sw,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(mainAxisAlignment: MainAxisAlignment.center,
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
                                Center(
                                  child: Container(
                                    height:48,
                                    width: 48,
                                    // color: Colors.red,
                                    child: Image.asset(
                                      'assets/images/iconrightarrowlarge.png',
                                      height: 48.h,
                                      width: 48.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 48.h,)
          ],
        ),
      ),
    );
  }
}
