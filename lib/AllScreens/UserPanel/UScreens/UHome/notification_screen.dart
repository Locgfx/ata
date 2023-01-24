import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(appBarText: 'Notificaton', imgPath: 'assets/images/iconbackappbar2.png',
        text:Text("Mark as read") ,),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h,bottom: 20.h),
        child: ListView(
          children: [
            Text(
              'Today',
              style: kManRope_500_16_001314,
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              'This week',
              style: kManRope_500_16_001314,
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
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
                  'Your appointment has been canceled \nsuccessfully',
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  'Your password has been changed \nsuccessfully',
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 65.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
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
                  'Welcome to cerebral ',
                  style: kManRope_400_14_001314,
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  '12 m',
                  style: kManRope_400_14_626A6A,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
