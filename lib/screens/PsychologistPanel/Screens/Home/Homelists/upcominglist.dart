import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';

import '../../../../../constants/fonts.dart';

class UpcomingList extends StatefulWidget {
  const UpcomingList({Key? key}) : super(key: key);

  @override
  State<UpcomingList> createState() => _UpcomingListState();
}

class _UpcomingListState extends State<UpcomingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 356.h,
            width: 1.sw,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 80.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kWhiteBGColor,
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding:EdgeInsets.only(left: 20.w,right: 20.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16)),
                                child:
                                    Image.asset('assets/images/userP.png'),
                              ),
                              SizedBox(width: 16.w),
                              Column(mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Priyanka singh',
                                      style: kManRope_500_16_001314),
                                  Text('Anxiety',
                                      style: kManRope_400_14_626A6A),
                                  // SizedBox(height: 8.h),
                                  // SizedBox(
                                  //   width: 280.w,
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(height: 8.h),
                                ],
                              ),
                            ],
                          ),

                          Column(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '10 June 2022, 8:00AM',
                                style: kManRope_400_14_626A6A,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(height: 12.h);
                },
                itemCount: 5),
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
