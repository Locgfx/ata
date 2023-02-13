import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UTabsScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class UCancelBookingScreen extends StatelessWidget {
  const UCancelBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 64.h,
        ),
        child: Column(
          children: [
            Container(
              width: 380.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 48.h, right: 48.h, top: 54.h, bottom: 48.h),
                    child: Image.asset(
                      'assets/images/calenderimage.png',
                      width: 199.w,
                      height: 210.h,
                    ),
                  ),
                  Text('Booking Cancelled', style: kManRope_700_24_FF482C),
                  SizedBox(
                    height: 48.h,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Your appointment with priya sing has been canceled. if you want book a new appointment got to home and book your appointment.',
              style: kManRope_500_14_626A6A,
              maxLines: 3,
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
        child: MainButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UTabsScreen(),
              ),
            );
          },
          color: kEDF6F9,
          shape: CustomDecoration().outline16ButtonDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              "Home",
              style: kManRope_500_16_001314,
            ),
          ),
        ),
      ),
    );
  }
}
