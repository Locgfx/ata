import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UCancelBookingScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class CancelBooking extends StatefulWidget {
  const CancelBooking({Key? key}) : super(key: key);

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 212.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UCancelBookingScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Cancel booking",
                                style: kManRope_500_16_white,
                              ),
                            ),
                            color: k006D77,
                            shape: CustomDecoration().border16Decoration()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "By clicking the Cancel button your appointment will cancel",
                  style: kManRope_500_16_626A6A,
                  maxLines: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}