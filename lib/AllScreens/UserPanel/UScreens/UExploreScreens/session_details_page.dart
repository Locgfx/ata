import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/decorations.dart';

import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/booking_confirmation.dart';
import 'package:greymatter/widgets/AppWidgets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';


import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';


class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(imgPath: 'assets/images/iconbackappbar2.png', appBarText: '',),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 42.h, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 64.h,
                    width: 64.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image.asset('assets/images/personss.png',fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 4.h,
                      ),
                      StarWidget()
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       'assets/icons/star.svg',
                      //       width: 12.w,
                      //       height: 12.h,
                      //     ),
                      //     SizedBox(width: 4.w),
                      //     Text('4.0', style: kManRope_400_12_001314),
                      //     SizedBox(width: 4.w),
                      //     Text('.', style: kManRope_700_16_001314),
                      //     SizedBox(width: 4.w),
                      //     Text('12 Yrs. Exp', style: kManRope_400_12_001314),
                      //   ],
                      // )
                    ],
                  ),
                  SizedBox(
                    width: 72.w,
                  ),
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: MainButton(
                        onPressed: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icondownload18.png",
                              height: 18,
                              color: k006D77,
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              "Prescription",
                              style: kManRope_500_16_006D77,
                            ),
                          ],
                        ),
                        color: kE2F2F4,
                        shape: CustomDecoration().button10outlineDecoration(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),

                  Expanded(
                      child: SizedBox(
                        height: 56.h,
                        child: MainButton(
                          onPressed: () {

                          },
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
                                "Download Invoice",
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
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Session details ',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              CardWidget(
                decoration: CustomDecoration().card20Edf6Decoration(),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h,bottom: 24.h),
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
                height: 48.h,
              ),
              Text(
                'Rate your experience',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              const StarRatingWidget(),
              Spacer(),
              Padding(
                padding:  EdgeInsets.only(bottom: 40.h),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                            const BookingConfirmationScreen()));
                      },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20.h),
                            child: Text(
                              'Reschedule',
                              style: kManRope_500_16_white,
                            ),
                          ),
                          color: k006D77,
                          shape: CustomDecoration().smallButton10Decoration()),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 56.h,
              //   width: 380.w,
              //   child: MaterialButton(
              //     color: k006D77,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10), // <-- Radius
              //     ),
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) =>
              //               const BookingConfirmationScreen()));
              //     },
              //     child: Text(
              //       'Reschedule',
              //       style: kManRope_500_16_white,
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
