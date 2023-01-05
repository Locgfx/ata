import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/screens/psychologist_screen/home_screens/upcoming_meetings.dart';

import '../../../constants/fonts.dart';
import '../../../widgets/shared/buttons/custom_active_text_button.dart';
import '../home_screens/canceled_meeting_screens.dart';
import '../home_screens/completed_meeting_screens.dart';

class PsychologistHomeScreen extends StatefulWidget {
  const PsychologistHomeScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistHomeScreen> createState() => _PsychologistHomeScreenState();
}

class _PsychologistHomeScreenState extends State<PsychologistHomeScreen> {
  int index = 0;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 52.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 39.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Good Morning, Pankaj',
                      style: kManRope_700_20_686868,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 24.w,
                          height: 24.h,
                          color: k686868,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                child: Column(
                  children: [
                    Container(
                      // height: 180.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: kE1EEF2,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 24.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Revenue.svg',
                                      height: 48.h,
                                      width: 48.w,
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Text(
                                      'Revenue',
                                      style: kManRope_400_16_263238,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  height: 1.h,
                                  width: 143.w,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '\$4391',
                                  style: kManRope_700_36_36B3BF,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Last Month: \$4239',
                                  style: kManRope_400_16_263238,
                                ),
                                SizedBox(
                                  height: 24.h,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Bookings.svg',
                                      height: 48.h,
                                      width: 48.w,
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Text(
                                      'Bookings',
                                      style: kManRope_400_16_263238,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  height: 1.h,
                                  width: 143.w,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '\$391',
                                  style: kManRope_700_36_36B3BF,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Last Month: \$239',
                                  style: kManRope_400_16_263238,
                                ),
                                SizedBox(
                                  height: 24.h,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Upcoming',
                                style: index == 0
                                    ? kManRope_500_16_006D77
                                    : kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 75.w,
                                color:
                                    index == 0 ? k006D77 : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CanceledMeetingScreen()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Cancelled',
                                style: index == 1
                                    ? kManRope_500_16_006D77
                                    : kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 75.w,
                                color:
                                    index == 1 ? k006D77 : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CompletedMeetingScreen()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Completed',
                                style: index == 2
                                    ? kManRope_500_16_006D77
                                    : kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 75.w,
                                color:
                                    index == 2 ? k006D77 : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    flag
                        ? Column(
                            children: [
                              SizedBox(
                                height: 340.h,
                                width: 1.sw,
                                child: ListView.separated(
                                    // physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (ctx, index) {
                                      return Container(
                                        height: 80.h,
                                        width: 1.sw,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: kWhiteBGColor,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 48.w,
                                                      height: 48.h,
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Image.asset(
                                                          'assets/images/userP.png'),
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Priyanka singh',
                                                            style:
                                                                kManRope_500_16_001314),
                                                        //SizedBox(width: 10,),
                                                        SizedBox(height: 8.h),
                                                        SizedBox(
                                                          width: 280.w,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text('Anxiety',
                                                                  style:
                                                                      kManRope_400_14_626A6A),
                                                              Text(
                                                                '10 June 2022, 8:00AM',
                                                                style:
                                                                    kManRope_400_14_626A6A,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 8.h),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (ctx, index) {
                                      return SizedBox(height: 12.h);
                                    },
                                    itemCount: 4),
                              ),
                              SizedBox(
                                height: 56.h,
                                width: 1.sw,
                                child: CustomActiveTextButton(
                                  text: 'See All',
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpcomingMeetings()));
                                  },
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: 70.h,
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/the-boy-and-girl-are-standing-near-calendar 1.png',
                                  height: 216.h,
                                  width: 216.w,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'No upcoming appointment ',
                                style: kManRope_500_24_001314,
                              ),
                            ],
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
