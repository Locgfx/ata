import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UHomeScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/tabs_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/AppWidgets.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class SessionSuccessful extends StatefulWidget {
  const SessionSuccessful({Key? key}) : super(key: key);

  @override
  State<SessionSuccessful> createState() => _SessionSuccessfulState();
}

class _SessionSuccessfulState extends State<SessionSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 20.h,
      ),
      /*appBar: AppBar(
        elevation: 0,
        leadingWidth: 40.w,
        centerTitle: false,
        backgroundColor: Colors.white,
        titleSpacing: 18.w,
        */ /*leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),*/ /*
      ),*/

      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Session successful',
                  style: kManRope_500_16_001314,
                ),
                // SizedBox(height: 24),
                Image.asset(
                  'assets/images/animation_500_lcohiagq.gif',
                  height: 183.h,
                  width: 186.w,
                ),
                Container(
                  // height: 68.h,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 64.h,
                            width: 64.w,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              'assets/images/personss.png',
                              height: 64.h,
                              width: 64.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Priya Singh',
                                style: kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'MA in Counselling Psychology',
                                style: kManRope_400_12_626A6A,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              StarWidget()
                              // Row(
                              //   children: [
                              //     SvgPicture.asset(
                              //       'assets/icons/star.svg',
                              //       width: 12.w,
                              //       height: 12.h,
                              //     ),
                              //     Text(
                              //       '12 Yrs. Exp',
                              //       style: kManRope_400_12_001314,
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/3dot48.png',
                        width: 48.w,
                        height: 48.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56.h,
                        child: MainButton(
                            onPressed: () {},
                            child: Text(
                              "Order details",
                              style: kManRope_500_16_006D77,
                            ),
                            color: kFFFFFF,
                            shape:
                                CustomDecoration().button10outlineDecoration()),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 56.h,
                      child: MainButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icondownload18.png",
                              height: 18,
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              "Prescription",
                              style: kManRope_500_16_white,
                            ),
                          ],
                        ),
                        color: k006D77,
                        shape: CustomDecoration().border10Decoration(),
                      ),
                    )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42.h,
                    ),
                    Text(
                      'Session Details',
                      style: kManRope_700_16_001314,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    CardWidget(
                      decoration: CustomDecoration().card20Edf6Decoration(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 24, bottom: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: kManRope_400_16_626A6A,
                                ),
                                Text(
                                  '10, June, 2022',
                                  style: kManRope_400_16_626A6A,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '8:00AM-9:00AM',
                                  style: kManRope_400_12_626A6A,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'session Type',
                                  style: kManRope_400_16_626A6A,
                                ),
                                Text(
                                  'Video',
                                  style: kManRope_400_16_626A6A,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Issue',
                                  style: kManRope_400_16_626A6A,
                                ),
                                Text(
                                  'Stress',
                                  style: kManRope_400_16_626A6A,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price',
                                  style: kManRope_400_16_626A6A,
                                ),
                                Text(
                                  'INR 350',
                                  style: kManRope_400_16_626A6A,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Rate your experience',
                      style: kManRope_700_16_001314,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    StarRatingWidget()
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 56.h,
                  width: 1.sw,
                  child: MainButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => UHomeScreen()));
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => UTabsScreen()));
                    },
                    color: k006D77,
                    shape: CustomDecoration().border16Decoration(),
                    child: Text(
                      "Home",
                      style: kManRope_500_16_white,
                    ),
                  ),
                  // child: CustomActiveTextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (ctx) => HomeScreen()));
                  //       /*Navigator.of(context).push(MaterialPageRoute(
                  //                     builder: (ctx) => WelcomeScreen()));*/
                  //     },
                  //     text: 'Home'),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
