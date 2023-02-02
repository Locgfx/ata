import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/joining.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UpcomingMeetings extends StatefulWidget {
  const UpcomingMeetings({Key? key}) : super(key: key);

  @override
  State<UpcomingMeetings> createState() => _UpcomingMeetingsState();
}

class _UpcomingMeetingsState extends State<UpcomingMeetings> {
  void _calenderbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const CalenderBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        appBarText: 'Upcoming',
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming   (17)',
                    style: kManRope_700_16_001314,
                  ),
                  GestureDetector(
                      onTap: () {
                        _calenderbottomsheet();
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/iconcalender.png",
                          height: 24.h,
                          width: 24.w,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              Text(
                'Today (2)',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                // height: 1.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     // Text(
                    //     //   'Upcoming   (17)',
                    //     //   style: kManRope_700_16_001314,
                    //     // ),
                    //     // CalenderPopup(),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 29.h,
                    // ),
                    // Text(
                    //   'Today (2)',
                    //   style: kManRope_500_16_001314,
                    // ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      // height: 170.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JoiningScreen()),
                                );
                              },
                              child: Container(
                                height: 80.h,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: kEDF6F9,
                                    border: Border.all(color: Colors.white)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.w, right: 16.w),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 48.h,
                                            width: 48.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.grey,
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child: Image.asset(
                                              'assets/images/userP.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          SizedBox(
                                            width: 280.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Priyanka singh',
                                                    style:
                                                        kManRope_500_16_001314),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Anxiety',
                                                        style:
                                                            kManRope_400_14_626A6A),
                                                    // SizedBox(width: 24.w),
                                                    Text(
                                                      '10 June 2022, 8:00AM',
                                                      style:
                                                          kManRope_400_14_626A6A,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 8.h);
                          },
                          itemCount: 2),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Tomorrow (3)',
                      style: kManRope_500_16_001314,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoiningScreen()),
                              );
                            },
                            child: Container(
                              height: 80.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kEDF6F9,
                                  border: Border.all(color: Colors.white)),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 48.h,
                                          width: 48.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey,
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          child: Image.asset(
                                            'assets/images/userP.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 16.w),
                                        SizedBox(
                                          width: 280.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Priyanka singh',
                                                  style:
                                                      kManRope_500_16_001314),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Anxiety',
                                                      style:
                                                          kManRope_400_14_626A6A),
                                                  // SizedBox(width: 24.w),
                                                  Text(
                                                    '10 June 2022, 8:00AM',
                                                    style:
                                                        kManRope_400_14_626A6A,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return SizedBox(height: 8.h);
                        },
                        itemCount: 3),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'This week (12)',
                      style: kManRope_500_16_001314,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        // height: 1.sh,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return Container(
                                height: 80.h,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: kEDF6F9,
                                    border: Border.all(color: Colors.white)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.w, right: 16.w),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        JoiningScreen()),
                                              );
                                            },
                                            child: Container(
                                              height: 48.h,
                                              width: 48.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.grey,
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              child: Image.asset(
                                                'assets/images/userP.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          SizedBox(
                                            width: 280.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Priyanka singh',
                                                    style:
                                                        kManRope_500_16_001314),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Anxiety',
                                                        style:
                                                            kManRope_400_14_626A6A),
                                                    // SizedBox(width: 24.w),
                                                    Text(
                                                      '10 June 2022, 8:00AM',
                                                      style:
                                                          kManRope_400_14_626A6A,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return SizedBox(height: 8.h);
                            },
                            itemCount: 12),
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
