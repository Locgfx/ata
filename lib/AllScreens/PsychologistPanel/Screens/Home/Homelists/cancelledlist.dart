import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class CancelledList extends StatefulWidget {
  const CancelledList({Key? key}) : super(key: key);

  @override
  State<CancelledList> createState() => _CancelledListState();
}

class _CancelledListState extends State<CancelledList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
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
                        borderRadius: BorderRadius.circular(16),
                        color: kWhiteBGColor,
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding:EdgeInsets.only(left: 16.w,right: 16.w),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 48.w,
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey, ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset('assets/images/userP.png',fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 16.w),
                              SizedBox(
                                width: 280.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text('Priyanka singh',
                                        style: kManRope_500_16_001314),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Anxiety',
                                            style: kManRope_400_14_626A6A),
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
