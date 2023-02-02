import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

import '../../../../../constants/decorations.dart';
import '../../../../../widgets/buttons.dart';
import 'Upcomingmeetings.dart';

class CompletedList extends StatefulWidget {
  const CompletedList({Key? key}) : super(key: key);

  @override
  State<CompletedList> createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                //physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Container(
                        height: 80,
                        width: 1.sw,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kEDF6F9,
                            border: Border.all(color: Colors.white)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JoiningScreen()),
                                );*/
                              },
                              child: Container(
                                height: 48.h,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
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
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Priyanka singh',
                                      style: kManRope_500_16_001314),
                                  Row(
                                    children: [
                                      Text('Anxiety',
                                          style: kManRope_400_14_626A6A),
                                      // SizedBox(width: 24.w),
                                      Expanded(
                                        child: Text(
                                          '10 June 2022, 8:00AM',
                                          style: kManRope_400_14_626A6A,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index == 3) SizedBox(height: 16),
                      if (index == 3)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          width: 1.sw,
                          child: MainButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UpcomingMeetings()));
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
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(height: 12.h);
                },
                itemCount: 4),
          ),
          // SizedBox(height: 24.h),
          // Row(
          //   children: [
          //     Expanded(
          //       child: MainButton(
          //           onPressed: () {},
          //           child: Padding(
          //             padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          //             child: Text(
          //               "See all",
          //               style: kManRope_500_16_white,
          //             ),
          //           ),
          //           color: k006D77,
          //           shape: CustomDecoration().button16Decoration()),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
