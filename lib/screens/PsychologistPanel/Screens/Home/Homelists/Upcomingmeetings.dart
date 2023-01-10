import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/home_screens/joining.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/popupdialogs.dart';

class UpcomingMeetings extends StatefulWidget {
  const UpcomingMeetings({Key? key}) : super(key: key);

  @override
  State<UpcomingMeetings> createState() => _UpcomingMeetingsState();
}

class _UpcomingMeetingsState extends State<UpcomingMeetings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusAppBar(
        appBarText: 'Upcomming  ',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming   (17)',
                  style: kManRope_700_16_001314,
                ),
                CalenderPopup(),
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
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: kWhiteBGColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 14.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    JoiningScreen()));
                                      },
                                      child: Container(
                                        width: 48.w,
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/Rectangle 26.png",
                                                ),
                                                fit: BoxFit.cover),
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Priyanka singh',
                                            style: kManRope_500_16_001314),
                                        //SizedBox(width: 10,),
                                        SizedBox(height: 8.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Anxiety',
                                                style: kManRope_400_14_626A6A),
                                            SizedBox(
                                              width: 110.w,
                                            ),
                                            Text(
                                              '10 June 2022, 8:00AM',
                                              style: kManRope_400_14_626A6A,
                                            ),
                                          ],
                                        ),
                                        // SizedBox(height: 8.h),
                                      ],
                                    ),
                                  ],
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
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: kWhiteBGColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 14.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JoiningScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 48.w,
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/Rectangle 26.png",
                                                ),
                                                fit: BoxFit.cover),
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Priyanka singh',
                                              style: kManRope_500_16_001314),
                                          //SizedBox(width: 10,),
                                          SizedBox(height: 8.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Anxiety',
                                                  style:
                                                      kManRope_400_14_626A6A),
                                              SizedBox(
                                                width: 110.w,
                                              ),
                                              Text(
                                                '10 June 2022, 8:00AM',
                                                style: kManRope_400_14_626A6A,
                                              ),
                                            ],
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
              height: 350.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 80.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: kWhiteBGColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 14.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JoiningScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 48.w,
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/Rectangle 26.png",
                                                ),
                                                fit: BoxFit.cover),
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Priyanka singh',
                                              style: kManRope_500_16_001314),
                                          //SizedBox(width: 10,),
                                          SizedBox(height: 8.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Anxiety',
                                                  style:
                                                      kManRope_400_14_626A6A),
                                              SizedBox(
                                                width: 110.w,
                                              ),
                                              Text(
                                                '10 June 2022, 8:00AM',
                                                style: kManRope_400_14_626A6A,
                                              ),
                                            ],
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
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
