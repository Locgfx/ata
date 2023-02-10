import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool hasNotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Notificaton',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: !hasNotifications
          ? Center(
              child: Text(
                'No New Notifications.',
                style: kManRope_500_16_001314,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
              child: ListView(
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    'Today',
                    style: kManRope_500_16_001314,
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Container(
                            height: 36.h,
                            width: 36.w,
                            decoration: const BoxDecoration(
                              color: kD9D9D9,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            'Your appointment confirmed with pankaj ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kManRope_400_14_001314,
                          ),
                          Spacer(),
                          Text(
                            '12 m',
                            style: kManRope_400_14_626A6A,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 30),
                  Text(
                    'This week',
                    style: kManRope_500_16_001314,
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Container(
                            height: 36.h,
                            width: 36.w,
                            decoration: const BoxDecoration(
                              color: kD9D9D9,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: Text(
                              'Your appointment confirmed with pankaj ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kManRope_400_14_001314,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '12 m',
                            style: kManRope_400_14_626A6A,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
