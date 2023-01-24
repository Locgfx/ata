import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/withdraw_earnings_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/earning_history_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/fonts.dart';
// import '../../../psychologist_screen/my_earning_screens/earning_history_screen.dart';

class MyEarningsScreen extends StatefulWidget {
  const MyEarningsScreen({Key? key}) : super(key: key);

  @override
  State<MyEarningsScreen> createState() => _MyEarningsScreenState();
}

class _MyEarningsScreenState extends State<MyEarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: HomeAppBar(color: kWhiteBGColor,
        text: Text("Good Morning, Pankaj",
          style:kManRope_700_20_686868,), child: Image.asset(
          'assets/images/iconnotificationlarge.png',
          width: 48.w,
          height: 48.h,
          // color: imagecolor,
        ),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 10.h,
              // ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w,top: 30.h),
                child: Container(
                  // height: 173.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, top: 28.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: kManRope_500_16_001314,
                            ),
                            SvgPicture.asset(
                              'assets/icons/downArrow.svg',
                              height: 24.h,
                              width: 24.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Container(
                          height: 1.5,
                          width: 1.sw,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Earning',
                                  style: kManRope_700_20_001314,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  '100000+',
                                  style: kManRope_500_16_626A6A,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Order',
                                  style: kManRope_700_20_001314,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  '500+',
                                  style: kManRope_500_16_626A6A,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Container(
                  // height: 173.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Earning',
                                  style: kManRope_700_20_001314,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  '100000+',
                                  style: kManRope_500_16_626A6A,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        WithDrawEarningsScreen()));
                              },
                              child: Text(
                                'WITHDRAW',
                                style: kManRope_600_18_006D77,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Container(
                          height: 1.5,
                          width: 1.sw,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'History',
                              style: kManRope_500_18_001314,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        EarningHistoryScreen()));
                              },
                              child: Image.asset(
                                'assets/images/iconrightarrow.png',
                                height: 24.h,
                                width: 24.w,
                                color: k006D77,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 27.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  'Last 5 Transaction',
                  style: kManRope_500_18_001314,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 40.h,
                width: 1.sw,
                color: kD6EAF0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:69.w,
                        // height: 16.h,
                        child: Text(
                          'Date',
                          style: kManRope_500_14_263238,
                        ),
                      ),
                      SizedBox(width: 78.w,),

                      SizedBox(
                        width:100.w,
                        // height: 16.h,
                        child: Text(
                          'Transaction No',
                          style: kManRope_500_14_263238,
                        ),
                      ),
                      SizedBox(width: 78.w,),

                      SizedBox(
                        width:53.w,
                        // height: 16.h,
                        child: Text(
                          'Amount',
                          style: kManRope_500_14_263238,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Container(
                // height: 229.h,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.h,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:69.w,
                                  // height: 16.h,
                                  child: Text(
                                    '09.12.2022',
                                    style: kManRope_400_14_626A6A,
                                  ),
                                ),
                                SizedBox(width: 78.w,),
                                SizedBox(
                                  width:100.w,
                                  // height: 16.h,
                                  child: Text(
                                    '123456789',
                                    style: kManRope_400_16_626A6A,
                                  ),
                                ),
                                SizedBox(width: 78.w,),
                                SizedBox(
                                  width:40.w,
                                  // height: 16.h,
                                  child: Text(
                                    '500',
                                    style: kManRope_400_16_626A6A,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return SizedBox(height: 29.h);
                      },
                      itemCount: 5),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
