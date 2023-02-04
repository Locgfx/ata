import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/cancel_booking_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class GenderBottomSheet extends StatefulWidget {
  const GenderBottomSheet({Key? key}) : super(key: key);

  @override
  State<GenderBottomSheet> createState() => _GenderBottomSheetState();
}

class _GenderBottomSheetState extends State<GenderBottomSheet> {
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
                                  builder: (context) => CancelBookingScreen()));
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

class UDeleteBottomSheet extends StatefulWidget {
  const UDeleteBottomSheet({Key? key}) : super(key: key);

  @override
  State<UDeleteBottomSheet> createState() => _UDeleteBottomSheet();
}

class _UDeleteBottomSheet extends State<UDeleteBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 170.h,
      child: Column(
        children: [
          Container(
            // height: 120.h,
            padding: EdgeInsets.only(top: 40.h),
            child: Column(
              children: [
                Text(
                  "Are you sure you want to delete this activity",
                  style: kManRope_500_14_686868,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Back",
                                style: kManRope_500_16_626A6A,
                              ),
                            ),
                            color: kFFFFFF,
                            shape:
                                CustomDecoration().button10outlineDecoration()),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: MainButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Delete",
                                style: kManRope_500_16_white,
                              ),
                            ),
                            color: kBC5656,
                            shape: CustomDecoration()
                                .button10BC5656outlineDecoration()),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RelationStatusBottomSheet extends StatefulWidget {
  const RelationStatusBottomSheet({Key? key}) : super(key: key);

  @override
  State<RelationStatusBottomSheet> createState() =>
      _RelationStatusBottomSheet();
}

class _RelationStatusBottomSheet extends State<RelationStatusBottomSheet> {
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Relationship Status',
                style: kManRope_700_20_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  _gIndex = 0;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 0 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Single',
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
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Married',
                    style: _gIndex == 1
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
                  _gIndex = 2;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 2 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Other',
                    style: _gIndex == 2
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
        ],
      ),
    );
  }
}

class OccupationBottomSheet extends StatefulWidget {
  const OccupationBottomSheet({Key? key}) : super(key: key);

  @override
  State<OccupationBottomSheet> createState() => _OccupationBottomSheetState();
}

class _OccupationBottomSheetState extends State<OccupationBottomSheet> {
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Select Occupation',
                style: kManRope_700_20_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  _gIndex = 0;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 0 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Student',
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
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Working',
                    style: _gIndex == 1
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
                  _gIndex = 2;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 2 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Other',
                    style: _gIndex == 2
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
        ],
      ),
    );
  }
}


