import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class PEditSlotsAvailabilityScreen extends StatefulWidget {
  const PEditSlotsAvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<PEditSlotsAvailabilityScreen> createState() =>
      _PEditSlotsAvailabilityScreenState();
}

class _PEditSlotsAvailabilityScreenState
    extends State<PEditSlotsAvailabilityScreen> {
  List switchValues = [
    true,
    true,
    true,
    true,
    true,
    false,
    false,
  ];

  final List<String> day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Satuday',
    'Sunday'
  ];
  final List<String> timeam = [
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '12:00 AM',
    '12:00 AM',
    '12:00 AM',
  ];

  final List<String> timepm = [
    '08:00 PM',
    '08:00 PM',
    '08:00 PM',
    '08:00 PM',
    '06:00 PM',
    '06:00 PM',
    '06:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
        child: Row(
          children: [
            Expanded(
              child: MainButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                    ),
                    child: Text(
                      "Save",
                      style: kManRope_500_16_white,
                    ),
                  ),
                  color: k006D77,
                  shape: CustomDecoration().button16Decoration()),
            ),
          ],
        ),
      ),
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Slots Availability',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 27.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48.h,
                width: 380.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Availability',
                      style: kManRope_500_16_001314,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                // height: 360.h,
                width: 1.sw,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    shrinkWrap: true,
                    itemCount: day.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                // height: 16.h,
                                width: 96.w,
                                child: Text(
                                  day[index],
                                  style: kManRope_400_14_626A6A,
                                ),
                              ),
                              SizedBox(width: 25.w),
                              SizedBox(
                                // height: 48.h,
                                width: 79.w,
                                child: Text(
                                  timeam[index],
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 25.w),
                              SizedBox(
                                // height: 48.h,
                                width: 81.w,
                                child: Text(
                                  timepm[index],
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              SizedBox(width: 25.w),
                              SizedBox(
                                height: 48.h,
                                width: 48.w,
                                child: FlutterSwitch(
                                  width: 40,
                                  height: 18,
                                  toggleSize: 14,
                                  padding: 3,
                                  activeColor: k006D77,
                                  value: switchValues[index],
                                  onToggle: (val) {
                                    setState(() {
                                      switchValues[index] = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 277.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
