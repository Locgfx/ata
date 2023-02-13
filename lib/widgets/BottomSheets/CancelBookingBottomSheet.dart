import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UCancelBookingScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class CancelBottomSheet extends StatefulWidget {
  const CancelBottomSheet({Key? key}) : super(key: key);

  @override
  State<CancelBottomSheet> createState() => _CancelBottomSheetState();
}

class _CancelBottomSheetState extends State<CancelBottomSheet> {
  void _cancelBooking() {
    showModalBottomSheet(
        context: context,
        backgroundColor: kFFFFFF,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) => const CancelBooking());
  }

  int _gIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Select One',
                style: kManRope_700_20_white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () => setState(() {
              _gIndex = 0;
              Navigator.of(context).pop();
              _cancelBooking();
            }),
            child: Container(
              height: 44.h,
              //width: 123.w,
              margin: EdgeInsets.symmetric(horizontal: 135.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: _gIndex == 0 ? k006D77 : Colors.transparent,
              ),
              child: Center(
                  child: Text(
                    'Cancel booking',
                    style: _gIndex == 0
                        ? kManRope_500_16_white
                        : kManRope_500_16_626A6A,
                  )),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          GestureDetector(
            onTap: () => setState(() {
              _gIndex = 1;
              Navigator.of(context).pop();
              // _cancelBooking();
            }),
            child: Container(
              height: 44.h,
              margin: EdgeInsets.symmetric(horizontal: 135.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: _gIndex == 1 ? k006D77 : Colors.transparent,
              ),
              child: Center(
                  child: Text(
                    'Reschedule',
                    style: _gIndex == 1
                        ? kManRope_500_16_white
                        : kManRope_500_16_626A6A,
                  )),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}


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