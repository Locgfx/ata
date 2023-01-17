import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';

class EditSlotsAvailabilityScreen extends StatefulWidget {
  const EditSlotsAvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<EditSlotsAvailabilityScreen> createState() =>
      _EditSlotsAvailabilityScreenState();
}

class _EditSlotsAvailabilityScreenState
    extends State<EditSlotsAvailabilityScreen> {
  bool _switchValue = true;
  bool _switchValue1 = true;
  bool _switchValue2 = true;
  bool _switchValue3 = true;
  bool _switchValue4 = true;
  bool _switchValue5 = false;
  bool _switchValue6 = false;

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
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => EditSlotsAvailabilityScreen()));
                    //   },
                    //   // child: Padding(
                    //   //   padding: EdgeInsets.only(right: 12.w),
                    //   //   child: Text(
                    //   //     'Edit',
                    //   //     style: kManRope_500_16_006D77,
                    //   //   ),
                    //   // ),
                    // ),
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
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 8.h),
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
                                height:48.h,
                                width:48.w,
                                child: FlutterSwitch(
                                  width: 60.w,
                                  height: 28.h,
                                  toggleSize: 20,
                                  activeColor: k006D77,
                                  value: _switchValue,
                                  onToggle: (val) {
                                    setState(() {
                                      _switchValue = val;
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
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue = val;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height:30.h,
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
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue1,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue1 = val;
              //         });
              //       },
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
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue2,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue2 = val;
              //         });
              //       },
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
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue3,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue3 = val;
              //         });
              //       },
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
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue4,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue4 = val;
              //         });
              //       },
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
              //       '12:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '06:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue5,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue5 = val;
              //         });
              //       },
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
              //       '12:00 AM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     Text(
              //       '06:00 PM',
              //       style: kManRope_400_14_626A6A,
              //     ),
              //     FlutterSwitch(
              //       width: 40.w,
              //       height: 20.h,
              //       toggleSize: 15,
              //       activeColor: k006D77,
              //       value: _switchValue6,
              //       onToggle: (val) {
              //         setState(() {
              //           _switchValue6 = val;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 277.h,
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 58.h),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: MainButton(
              //             onPressed: () {
              //               Navigator.pop(context);
              //             },
              //             child: Padding(
              //               padding: EdgeInsets.only(
              //                 top: 20.h,
              //                 bottom: 20.h,
              //               ),
              //               child: Text(
              //                 "Save",
              //                 style: kManRope_500_16_white,
              //               ),
              //             ),
              //             color: k006D77,
              //             shape: CustomDecoration().button16Decoration()),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
