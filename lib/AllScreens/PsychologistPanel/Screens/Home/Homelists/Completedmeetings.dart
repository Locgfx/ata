import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class CompletedMeetings extends StatefulWidget {
  const CompletedMeetings({Key? key}) : super(key: key);

  @override
  State<CompletedMeetings> createState() => _CompletedMeetingsState();
}

class _CompletedMeetingsState extends State<CompletedMeetings> {
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
      backgroundColor: Colors.white,
      appBar: CusAppBar(
        appBarText: 'Completed  ',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed (100+)',
                    style: kManRope_700_16_001314,
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _calenderbottomsheet();
                      },
                      child: Image.asset(
                        "assets/images/iconcalender.png",
                        height: 24.h,
                        width: 24.w,
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    // height: 170.h,
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
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                                                style: kManRope_500_16_001314),
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
                                                  style: kManRope_400_14_626A6A,
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
                  SizedBox(
                    // height: 270.h,
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
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                                                style: kManRope_500_16_001314),
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
                                                  style: kManRope_400_14_626A6A,
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
                        itemCount: 3),
                  ),
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
                  SizedBox(
                    // height: 350.h,
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
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                                                style: kManRope_500_16_001314),
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
                                                  style: kManRope_400_14_626A6A,
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
                        itemCount: 10),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
