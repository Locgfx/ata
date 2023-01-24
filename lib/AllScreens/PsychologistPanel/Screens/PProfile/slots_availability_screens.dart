import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/edit_holiday_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/edit_slots_availability_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/popupdialogs.dart';

import '../../../../constants/fonts.dart';

class SlotsAvailabilityScreen extends StatefulWidget {
  const SlotsAvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<SlotsAvailabilityScreen> createState() =>
      _SlotsAvailabilityScreenState();
}

class _SlotsAvailabilityScreenState extends State<SlotsAvailabilityScreen> {
  void _showCalender() {
    showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          builder: (BuildContext context, child) {
            return CalenderWidget(child: child);
          }, lastDate: DateTime(2024),
        );
  }

  void _showTimepicker() {
    showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,

      builder: (BuildContext context, child) {
        return TimeWidget(child: child);
      },
    );
  }
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
    '',
    '',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusAppBar(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditSlotsAvailabilityScreen()));
                      },
                      child: Container(
                        // color: Colors.red,
                        height: 48.h,
                        width: 50.w,
                        child: Center(
                          child: Text(
                            'Edit',
                            style: kManRope_500_16_006D77,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 24.h,
              // ),
              SizedBox(height: 8.h,),
              SizedBox(
                // height: 360.h,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 8.h),
                    shrinkWrap: true,
                    itemCount: day.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 48.h,
                                width: 76.w,
                                child: Text(
                                  day[index],
                                  style: kManRope_400_14_626A6A,
                                ),
                              ),
                              SizedBox(width: 114.w),
                              SizedBox(
                                height: 48.h,
                                width: 79.w,
                                child: Text(
                                  timeam[index],
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 30.w),
                              SizedBox(
                                height: 48.h,
                                width: 81.w,
                                child: Text(
                                  timepm[index],
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                ),
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
                height: 40.h,
              ),
              SizedBox(
                height: 48.h,
                width: 380.w,
                child: Row(
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
                      child: Container(
                        // color: Colors.red,
                        height: 48.h,
                        width: 50.w,
                        child: Center(
                          child: Text(
                            'Edit',
                            style: kManRope_500_16_006D77,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h,),
              Text(
                'Selected date & time',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      // width: 175.w,
                      height: 56.h,
                      child: TextFormField(
                        readOnly: true,
                        onTap: (){
                          _showCalender();

                        },
                        decoration: TextfieldDecoration(
                            label: 'Mon, 12, 2022',
                            child: Image.asset(
                              "assets/images/iconcalender24.png",
                              height: 24.h,
                              width: 24.w,
                            )).smalltextfieldDecoration(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      // width: 175.w,
                      height: 56.h,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          _showTimepicker();
                        },
                        decoration: TextfieldDecoration(
                            label: '12:00',
                            child: Image.asset(
                              "assets/images/iconclock.png",
                              height: 24.h,
                            )).smalltextfieldDecoration(),
                      ),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      // width: 175.w,
                      height: 56.h,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          _showCalender();
                        },
                        decoration: TextfieldDecoration(
                            label: 'Mon, 12, 2022',
                            child: Image.asset(
                              "assets/images/iconcalender24.png",
                              height: 24.h,
                              width: 24.w,
                            )).smalltextfieldDecoration(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      // width: 175.w,
                      height: 56.h,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          _showTimepicker();
                        },
                        decoration: TextfieldDecoration(
                            label: '12:00',
                            child: Image.asset(
                              "assets/images/iconclock.png",
                              height: 24.h,
                            )).smalltextfieldDecoration(),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: 175.w,
              //       height: 56.h,
              //       child: TextFormField(
              //         decoration: TextfieldDecoration(
              //             label: 'Mon, 12, 2022',
              //             child: Image.asset(
              //               "assets/images/iconcalender24.png",
              //               height: 24.h,
              //             )).smalltextfieldDecoration(),
              //       ),
              //     ),
              //     Container(
              //       width: 175.w,
              //       height: 56.h,
              //       child: TextFormField(
              //         decoration: TextfieldDecoration(
              //             label: 'Mon, 12, 2022',
              //             child: Image.asset(
              //               "assets/images/iconclock.png",
              //               height: 24.h,
              //             )).smalltextfieldDecoration(),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height:81.h ,)
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
