import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/popupdialogs.dart';

import '../../../../constants/fonts.dart';
import '../../../../widgets/app_bar/app_bar.dart';

class CanceledMeetingScreen extends StatefulWidget {
  const CanceledMeetingScreen({Key? key}) : super(key: key);

  @override
  State<CanceledMeetingScreen> createState() => _CanceledMeetingScreenState();
}

class _CanceledMeetingScreenState extends State<CanceledMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: 'Cancelled'),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 40.h, right: 24.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Canceled  (100+)',
                  style: kManRope_700_16_001314,
                ),
                CalenderPopup()
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return Container(
                      decoration: CustomDecoration().radius16Decoration(),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 48.w,
                                      height: 48.h,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'assets/images/userP.png'),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Priyanka singh',
                                            style: kManRope_400_16_Black),
                                        //SizedBox(width: 10,),
                                        SizedBox(height: 8.h),
                                        SizedBox(
                                          width: 270.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Anxiety',
                                                  style:
                                                      kManRope_400_14_626A6A),
                                              Text(
                                                '10 June 2022, 8:00AM',
                                                style: kManRope_400_14_626A6A,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 18.h),
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
          ],
        ),
      ),
    );
  }
}
