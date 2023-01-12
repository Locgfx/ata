import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Home/Homelists/Cancelledmeetings.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Home/Homelists/Completedmeetings.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Home/Homelists/Upcomingmeetings.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Home/Homelists/cancelledlist.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Home/Homelists/completedlist.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Home/Homelists/upcominglist.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/fonts.dart';

class PsychologistHomeScreen extends StatefulWidget {
  const PsychologistHomeScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistHomeScreen> createState() => _PsychologistHomeScreenState();
}

class _PsychologistHomeScreenState extends State<PsychologistHomeScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  ////////////////
  int index = 0;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      backgroundColor: kWhiteBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: ScrollPhysics(),
          child: Column(
            children: [
              // SizedBox(height: 52.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
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
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              selectedIndex = pageIndex = 0;
                              _pageController.jumpToPage(
                                pageIndex,
                              );
                              pageIndex = 0;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Upcoming',
                                style: pageIndex == 0
                                    ? kManRope_500_16_006D77
                                    : kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 75.w,
                                color: pageIndex == 0
                                    ? k006D77
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              selectedIndex = pageIndex = 1;
                              _pageController.jumpToPage(
                                pageIndex,
                              );
                              pageIndex = 1;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Cancelled',
                                style: pageIndex == 1
                                    ? kManRope_500_16_006D77
                                    : kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 75.w,
                                color: pageIndex == 1
                                    ? k006D77
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              selectedIndex = pageIndex = 2;
                              _pageController.jumpToPage(
                                pageIndex,
                              );
                              pageIndex = 2;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Completed',
                                style: pageIndex == 2
                                    ? kManRope_500_16_006D77
                                    : kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 75.w,
                                color: pageIndex == 2
                                    ? k006D77
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      height: 380.h,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(
                            () {
                              pageIndex = page;
                            },
                          );
                        },
                        children: <Widget>[
                          UpcomingList(),
                          CancelledList(),
                          CompletedList(),

                          // HomeProfile(),
                          // Posts(),
                          // NotificationScreen(),
                          // MessageScreen()
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: MainButton(
                                onPressed: () {
                                  if (pageIndex == 0) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpcomingMeetings()));
                                  }
                                  if (pageIndex == 1) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CancelledMeetings()));
                                  }
                                  if (pageIndex == 2) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompletedMeetings()));
                                  }
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, bottom: 20.h),
                                  child: Text(
                                    "See all",
                                    style: kManRope_500_16_white,
                                  ),
                                ),
                                color: k006D77,
                                shape: CustomDecoration().button16Decoration()),
                          ),
                        ],
                      ),
                    ),
                    // flag ? UpcomingList() : CancelledList(),
                    // ? Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 356.h,
                    //         width: 1.sw,
                    //         child: ListView.separated(
                    //             scrollDirection: Axis.vertical,
                    //             physics: NeverScrollableScrollPhysics(),
                    //             padding: EdgeInsets.zero,
                    //             itemBuilder: (ctx, index) {
                    //               return Container(
                    //                 height: 80.h,
                    //                 width: 1.sw,
                    //                 padding: EdgeInsets.symmetric(
                    //                     horizontal: 16.w, vertical: 10.h),
                    //                 decoration: BoxDecoration(
                    //                     borderRadius:
                    //                         BorderRadius.circular(8),
                    //                     color: kWhiteBGColor,
                    //                     border: Border.all(
                    //                         color: Colors.white)),
                    //                 child: Center(
                    //                   child: Column(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                       Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment
                    //                                 .spaceBetween,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                         children: [
                    //                           Row(
                    //                             children: [
                    //                               Container(
                    //                                 width: 48.w,
                    //                                 height: 48.h,
                    //                                 clipBehavior:
                    //                                     Clip.hardEdge,
                    //                                 decoration: BoxDecoration(
                    //                                     color: Colors.grey,
                    //                                     borderRadius:
                    //                                         BorderRadius
                    //                                             .circular(
                    //                                                 8)),
                    //                                 child: Image.asset(
                    //                                     'assets/images/userP.png'),
                    //                               ),
                    //                               SizedBox(width: 8.w),
                    //                               Column(
                    //                                 mainAxisSize:
                    //                                     MainAxisSize.min,
                    //                                 crossAxisAlignment:
                    //                                     CrossAxisAlignment
                    //                                         .start,
                    //                                 children: [
                    //                                   Text('Priyanka singh',
                    //                                       style:
                    //                                           kManRope_500_16_001314),
                    //                                   //SizedBox(width: 10,),
                    //                                   SizedBox(height: 8.h),
                    //                                   SizedBox(
                    //                                     width: 280.w,
                    //                                     child: Row(
                    //                                       mainAxisAlignment:
                    //                                           MainAxisAlignment
                    //                                               .spaceBetween,
                    //                                       children: [
                    //                                         Text('Anxiety',
                    //                                             style:
                    //                                                 kManRope_400_14_626A6A),
                    //                                         Text(
                    //                                           '10 June 2022, 8:00AM',
                    //                                           style:
                    //                                               kManRope_400_14_626A6A,
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                   // SizedBox(height: 8.h),
                    //                                 ],
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //             separatorBuilder: (ctx, index) {
                    //               return SizedBox(height: 12.h);
                    //             },
                    //             itemCount: 4),
                    //       ),
                    //       SizedBox(height: 24.h),
                    //       SizedBox(
                    //         height: 56.h,
                    //         width: 1.sw,
                    //         child: CustomActiveTextButton(
                    //           text: 'See All',
                    //           onPressed: () {
                    //             Navigator.of(context).push(
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         UpcomingMeetings()));
                    //           },
                    //         ),
                    //       ),
                    //       SizedBox(height: 16.h),
                    //     ],
                    //   )
                    // : Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 70.h,
                    //       ),
                    //       Center(
                    //         child: Image.asset(
                    //           'assets/images/the-boy-and-girl-are-standing-near-calendar 1.png',
                    //           height: 216.h,
                    //           width: 216.w,
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 8.h,
                    //       ),
                    //       Text(
                    //         'No upcoming appointment ',
                    //         style: kManRope_500_24_001314,
                    //       ),
                    //     ],
                    //   ),
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
