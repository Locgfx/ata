import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UNewActivityAddedScreen.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class UAddNewActivityScreen extends StatefulWidget {
  UAddNewActivityScreen({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<UAddNewActivityScreen> createState() => _UAddNewActivityScreenState();
}

class _UAddNewActivityScreenState extends State<UAddNewActivityScreen> {
  bool _switchValue = true;
  bool goalFlag = true;
  int flag = 0;
  int selectedDay = 0;
  List selectedDays = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Running',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Image.asset(
                  'assets/images/manimg.png',
                  width: 1.sw,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goal Type',
                      style: kManRope_500_16_001314,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              goalFlag = true;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: goalFlag ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'One time',
                                style: goalFlag
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              goalFlag = false;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: goalFlag ? Colors.white : k006D77,
                            ),
                            child: Center(
                              child: Text(
                                'Repeat',
                                style: goalFlag
                                    ? kManRope_400_14_001314
                                    : kManRope_400_14_white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goal',
                      style: kManRope_500_16_001314,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 0;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: flag == 0 ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Daily',
                                style: flag == 0
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 1;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: flag == 1 ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Mon-sat',
                                style: flag == 1
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 2;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: flag == 2 ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Custom',
                                style: flag == 2
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Select Days',
                  style: kManRope_500_16_001314,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 42.w,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 4.w,
                    ),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 7,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          //print(selectedDays);
                          if (selectedDays.contains(index)) {
                            setState(() {
                              selectedDays.remove(index);
                            });
                            //print('a');
                          } else {
                            setState(() {
                              selectedDays.add(index);
                            });
                            //print('b');
                          }
                        },
                        child: Container(
                          height: 39.h,
                          width: 49.w,
                          decoration: BoxDecoration(
                            color: selectedDays.contains(index)
                                ? k006D77
                                : Colors.transparent,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: k006D77),
                          ),
                          child: Center(
                            child: Text(
                              weekDays[index],
                              style: selectedDays.contains(index)
                                  ? kManRope_400_14_white
                                  : kManRope_400_14_001314,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reminder',
                      style: kManRope_500_16_001314,
                    ),
                    FlutterSwitch(
                      width: 40,
                      height: 18,
                      padding: 3,
                      toggleSize: 14,
                      activeColor: k006D77,
                      value: _switchValue,
                      onToggle: (val) {
                        setState(() {
                          _switchValue = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reminder time',
                      style: kManRope_500_16_001314,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          Globals().showTimepicker(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => TimePickerApp(),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kE2F2F4,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, bottom: 10.h, left: 10.2, right: 37.w),
                          child: Text(
                            '06:00 am',
                            style: kManRope_400_14_001314,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 46.h,
              ),
              Center(
                child: MainButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UNewActivityAddedScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20.h, bottom: 20.h, left: 50.w, right: 50.w),
                      child: Text(
                        "ADD",
                        style: kManRope_500_16_white,
                      ),
                    ),
                    color: k006D77,
                    shape: CustomDecoration().smallButton10Decoration()),
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimePickerApp extends StatefulWidget {
  const TimePickerApp({Key? key}) : super(key: key);

  @override
  State<TimePickerApp> createState() => _TimePickerAppState();
}

class _TimePickerAppState extends State<TimePickerApp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      content: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (v) {},
                ),
              ),
              SizedBox(height: 16),
              BottomSmallButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'OK',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
