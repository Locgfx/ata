import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PChatMessage.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UFaq.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class UHelpandSupport extends StatefulWidget {
  const UHelpandSupport({Key? key}) : super(key: key);

  @override
  State<UHelpandSupport> createState() => _UHelpandSupportState();
}

class _UHelpandSupportState extends State<UHelpandSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Help And Support',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                                builder: (context) => PChatMessages()));
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 68.h,
                              width: 68.w,
                              decoration: const BoxDecoration(
                                  color: k006D77, shape: BoxShape.circle),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/chat.svg',
                                      width: 24.h,
                                      height: 24.h)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UFaqScreen()));
                          },
                          child: Container(
                            height: 84.h,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    child: SizedBox(
                                      height: 48,
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
                        InkWell(
                          onTap: () async {
                            const uri =
                                'mailto:info@theataraxis.com?subject=Support';
                            launchUrl(Uri.parse(uri));
                            // if (await canLaunch(uri)) {
                            //   await launch(uri);
                            // } else {
                            //   throw 'Could not launch $uri';
                            // }
                          },
                          child: Container(
                            height: 84.h,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    child: SizedBox(
                                      height: 48,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
            )
          ],
        ),
      ),
    );
  }
}
