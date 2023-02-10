import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidget.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/instant_booking_widgets/top_verified_specialists.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

class InstantBookingScreen extends StatefulWidget {
  const InstantBookingScreen({Key? key}) : super(key: key);

  @override
  State<InstantBookingScreen> createState() => _InstantBookingScreenState();
}

class _InstantBookingScreenState extends State<InstantBookingScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kEDF6F9,
          appBar: CuswhiteAppBar(
              hasThreeDots: false,
              appBarText: 'Instant Booking',
              imgPath: 'assets/images/iconbackappbar2.png',
              text: Text(
                "Help",
                style: kManRope_500_16_006D77,
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                TopVerifiedSpecialist(),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 56.h,
                        decoration: CustomDecoration().outline5A72EDDecoration(),
                        child: TextField(
                          decoration: TextfieldDecoration(
                              label:
                              'Search for health problem, Psychologist',
                              hintstyle: kManRope_400_14_626A6A)
                              .whiteColorSearchField(),

                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text('Choose from Top Psychologists',
                          style: kManRope_700_16_001314),
                      SizedBox(height: 8.h),
                      Text('Book confirmed appointments',
                          style: kManRope_400_16_626A6A),
                      SizedBox(height: 24.h),
                      isLoading ? SizedBox() : TopSpecialistGridview(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading) LoadingWidget(),
      ],
    );
  }
}
