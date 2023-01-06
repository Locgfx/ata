import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/edit_holiday_screen.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/edit_slots_availability_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../constants/fonts.dart';

class SlotsAvailabilityScreen extends StatefulWidget {
  const SlotsAvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<SlotsAvailabilityScreen> createState() =>
      _SlotsAvailabilityScreenState();
}

class _SlotsAvailabilityScreenState extends State<SlotsAvailabilityScreen> {
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
    'off',
    'off'
  ];

  final List<String> timepm = [
    '08:00 PM',
    '08:00 PM',
    '08:00 PM',
    '08:00 PM',
    '06:00 PM',
    '12:00 AM',
    '',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusAppBar(
        appBarText: 'Slots Availability',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 27.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Availability',
                    style: kManRope_500_16_001314,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditSlotsAvailabilityScreen()));
                    },
                    child: Text(
                      'Edit',
                      style: kManRope_500_16_006D77,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                // height: 360.h,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 30.h),
                    shrinkWrap: true,
                    itemCount: day.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                day[index],
                                style: kManRope_400_14_626A6A,
                              ),
                              Text(
                                timeam[index],
                                style: kManRope_400_14_626A6A,
                              ),
                              Text(
                                timepm[index],
                                style: kManRope_400_14_626A6A,
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Monday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '10:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '08:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Tuesday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '10:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '08:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Wednesday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '10:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '08:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Thursday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '10:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '08:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Friday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '10:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '08:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Saturday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       'off',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Sunday',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       'off',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 67.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Holiday',
                    style: kManRope_500_16_001314,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditHolidayScreen()));
                    },
                    child: Text(
                      'Edit',
                      style: kManRope_500_16_006D77,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                'Selected date & time',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 182.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/calender.png",
                            height: 20.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                  Container(
                    width: 182.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/clockicon.png",
                            height: 20.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       height: 56.h,
              //       width: 182.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: k006D77),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Mon, 12, 2022',
              //               style: kManRope_400_16_626A6A,
              //             ),
              //             SvgPicture.asset(
              //               'assets/icons/calenderunselected.svg',
              //               height: 24.h,
              //               width: 24.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: 56.h,
              //       width: 182.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: k006D77),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '12:00 pm',
              //               style: kManRope_400_16_626A6A,
              //             ),
              //             SvgPicture.asset(
              //               'assets/icons/clock.svg',
              //               height: 24.h,
              //               width: 24.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Selected date & time',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 182.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/calender.png",
                            height: 20.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                  Container(
                    width: 182.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/clockicon.png",
                            height: 20.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       height: 56.h,
              //       width: 182.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: k006D77),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Mon, 12, 2022',
              //               style: kManRope_400_16_626A6A,
              //             ),
              //             SvgPicture.asset(
              //               'assets/icons/calenderunselected.svg',
              //               height: 24.h,
              //               width: 24.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: 56.h,
              //       width: 182.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: k006D77),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '12:00 pm',
              //               style: kManRope_400_16_626A6A,
              //             ),
              //             SvgPicture.asset(
              //               'assets/icons/clock.svg',
              //               height: 24.h,
              //               width: 24.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
