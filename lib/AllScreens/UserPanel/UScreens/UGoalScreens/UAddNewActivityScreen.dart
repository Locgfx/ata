import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/Apis/UserAPis/addgoal/add_goal.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import 'UNewActivityAddedScreen.dart';

class UAddNewActivityScreen extends StatefulWidget {
  final String activityId;
  final String activityImage;
  UAddNewActivityScreen({
    Key? key,
    required this.text,
    required this.activityId,
    required this.activityImage,
  }) : super(key: key);
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
  String a = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 6, 0, 0, 0, 0)
      .toString();
  getReminderTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      a = prefs.getString(Keys().goalReminderTime)!;
    });
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: widget.text,
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CachedNetworkImage(
                      imageUrl: widget.activityImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: SpinKitThreeBounce(
                          color: k006D77,
                          size: 10,
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/manimg.png',
                        width: 1.sw,
                        fit: BoxFit.fitWidth,
                      ),
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
                                getDays();
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
                  if (flag == 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Select Days',
                        style: kManRope_500_16_001314,
                      ),
                    ),
                  if (flag == 2)
                    SizedBox(
                      height: 24,
                    ),
                  if (flag == 2)
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
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
                  if (flag == 2)
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
                                builder: (_) =>
                                    TimePickerApp(dateTime: DateTime.parse(a)),
                              ).then((value) => getReminderTime());
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                color: kE2F2F4,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                DateFormat('hh:mm a').format(DateTime.parse(a)),
                                style: kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 46.h),
                  Center(
                    child: MainButton(
                        onPressed: () {
                          addGoal();
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
                  SizedBox(height: 40.h)
                ],
              ),
            ),
          ),
          if (loading) LoadingWidget(),
        ],
      ),
    );
  }

  addGoal() {
    setState(() {
      loading = true;
    });
    addGoalApi(
      activityId: widget.activityId,
      goalType: goalFlag ? 'o' : 'r',
      goal: flag == 0
          ? 'd'
          : flag == 1
              ? 'ms'
              : 'c',
      days: flag == 2 ? getDays() : '',
      reminder: _switchValue ? '1' : '0',
      reminderTime: DateFormat('hh:mm').format(DateTime.parse(a)),
    ).then(
      (value) {
        if (value) {
          if (mounted) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UNewActivityAddedScreen()));
          }
          setState(() {
            loading = false;
          });
        } else {
          setState(() {
            loading = false;
          });
          // Globals().showToast("Data not submitted");
        }
      },
    );
  }

  getDays() {
    String a = '';
    if (selectedDays.contains(0)) {
      a = a + 'sun,';
    }
    if (selectedDays.contains(1)) {
      a = a + 'mon,';
    }
    if (selectedDays.contains(2)) {
      a = a + 'tues,';
    }
    if (selectedDays.contains(3)) {
      a = a + 'wed,';
    }
    if (selectedDays.contains(4)) {
      a = a + 'thur,';
    }
    if (selectedDays.contains(5)) {
      a = a + 'fri,';
    }
    if (selectedDays.contains(6)) {
      a = a + 'sat,';
    }
    print(a);
    return a;
  }
}

class TimePickerApp extends StatefulWidget {
  final DateTime dateTime;
  const TimePickerApp({Key? key, required this.dateTime}) : super(key: key);

  @override
  State<TimePickerApp> createState() => _TimePickerAppState();
}

class _TimePickerAppState extends State<TimePickerApp> {
  setTime(DateTime dateTime) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Keys().goalReminderTime, dateTime.toString());
  }

  @override
  void initState() {
    setTime(widget.dateTime);
    super.initState();
  }

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
                  initialDateTime: widget.dateTime,
                  onDateTimeChanged: (v) {
                    setTime(v);
                  },
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
