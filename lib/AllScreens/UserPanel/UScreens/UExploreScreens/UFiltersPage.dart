import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class UFilterScreen extends StatefulWidget {
  const UFilterScreen({Key? key}) : super(key: key);

  @override
  State<UFilterScreen> createState() => _UFilterScreenState();
}

class _UFilterScreenState extends State<UFilterScreen> {
  List problemList = [
    'Anxiety',
    'Depression',
    'Relationship Issue',
    'Couple Counselling',
    'Grief & Loss',
    'Sleep Issues',
    'Trauma',
    'Narcissistic Issue',
    'Family Therapy',
    'Body Image',
  ];
  bool showOptions1 = false;
  bool showOptions2 = false;
  bool showOptions3 = false;
  String language = 'English';
  String slot = '10:00 AM';
  String problem = 'Select your problem';
  List slots = [
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Filters',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Specialization',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showOptions1 = !showOptions1;
                    showOptions2 = false;
                    showOptions3 = false;
                  });
                },
                child: Container(
                  height: 58.h,
                  width: 380.w,
                  padding: EdgeInsets.only(top: showOptions1 ? 10 : 3),
                  decoration: BoxDecoration(
                    borderRadius: showOptions1
                        ? BorderRadius.vertical(top: Radius.circular(10))
                        : BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              problem,
                              style: kManRope_500_14_626A6A,
                            ),
                            (showOptions1)
                                ? Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: SvgPicture.asset(
                                      'assets/icons/circleCancel.svg',
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                  )
                                : Image.asset(
                                    "assets/images/icondropdownlargee.png",
                                    height: 48.h,
                                    width: 48.w,
                                  )
                          ],
                        ),
                      ),
                      if (showOptions1) Spacer(),
                      if (showOptions1)
                        Container(
                          color: kB5BABA,
                          width: 1.sw,
                          height: 1,
                        ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                height: showOptions1 ? 400.h : 0,
                width: 1.sw,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < problemList.length; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showOptions1 = false;
                              problem = problemList[i];
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  problemList[i],
                                  style: kManRope_400_12_626A6A,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Slot',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showOptions2 = !showOptions2;
                    showOptions1 = false;
                    showOptions3 = false;
                  });
                },
                child: Container(
                  height: 60.h,
                  width: 380.w,
                  padding: EdgeInsets.only(top: showOptions2 ? 10 : 3),
                  decoration: BoxDecoration(
                    borderRadius: showOptions2
                        ? BorderRadius.vertical(top: Radius.circular(10))
                        : BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              slot,
                              style: kManRope_500_14_626A6A,
                            ),
                            (showOptions2)
                                ? Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: SvgPicture.asset(
                                      'assets/icons/circleCancel.svg',
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                  )
                                : Image.asset(
                                    "assets/images/icondropdownlargee.png",
                                    height: 48.h,
                                    width: 48.w,
                                  )
                          ],
                        ),
                      ),
                      if (showOptions2) Spacer(),
                      if (showOptions2)
                        Container(
                          color: kB5BABA,
                          width: 1.sw,
                          height: 1,
                        ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                height: showOptions2 ? 200.h : 0,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: showOptions2
                      ? BorderRadius.vertical(bottom: Radius.circular(10))
                      : BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < slots.length; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showOptions2 = false;
                              slot = slots[i];
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  slots[i],
                                  style: kManRope_400_12_626A6A,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Language',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showOptions3 = !showOptions3;
                    showOptions2 = false;
                    showOptions1 = false;
                  });
                },
                child: Container(
                  height: 60.h,
                  width: 380.w,
                  padding: EdgeInsets.only(top: showOptions3 ? 10 : 3),
                  decoration: BoxDecoration(
                    borderRadius: showOptions3
                        ? BorderRadius.vertical(top: Radius.circular(10))
                        : BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              language,
                              style: kManRope_500_14_626A6A,
                            ),
                            (showOptions3)
                                ? Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: SvgPicture.asset(
                                      'assets/icons/circleCancel.svg',
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                  )
                                : Image.asset(
                                    "assets/images/icondropdownlargee.png",
                                    height: 48.h,
                                    width: 48.w,
                                  )
                          ],
                        ),
                      ),
                      if (showOptions3) Spacer(),
                      if (showOptions3)
                        Container(
                          color: kB5BABA,
                          width: 1.sw,
                          height: 1,
                        ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                height: showOptions3 ? 100.h : 0,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: showOptions3
                      ? BorderRadius.vertical(bottom: Radius.circular(10))
                      : BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < ['English', 'Hindi'].length; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showOptions3 = false;
                              language = ['English', 'Hindi'][i];
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  ['English', 'Hindi'][i],
                                  style: kManRope_400_12_626A6A,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Date',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AppDatePicker(),
                  );
                },
                child: Container(
                  height: 60.h,
                  width: 380.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select your date',
                          style: kManRope_500_14_626A6A,
                        ),
                        Image.asset(
                          "assets/images/icondropdownlargee.png",
                          height: 48.h,
                          width: 48.w,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: MainButton(
                          onPressed: () {},
                          child: Text(
                            "Clear All",
                            style: kManRope_500_16_001314,
                          ),
                          color: kEDF6F9,
                          shape: CustomDecoration().border10Decoration()),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: MainButton(
                          onPressed: () {},
                          child: Text(
                            "Finish",
                            style: kManRope_500_16_white,
                          ),
                          color: k006D77,
                          shape: CustomDecoration().border10Decoration()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({Key? key}) : super(key: key);

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.transparent,
      content: Container(
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
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumDate:
                      DateTime.now().subtract(Duration(milliseconds: 1)),
                  maximumDate: DateTime.now().add(Duration(days: 15)),
                  onDateTimeChanged: (v) {},
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Selected date should not be more than 15 days from today.*',
                style: kManRope_500_16_626A6A,
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

class AppDatePickerWhole extends StatefulWidget {
  const AppDatePickerWhole({Key? key}) : super(key: key);

  @override
  State<AppDatePickerWhole> createState() => _AppDatePickerWholeState();
}

class _AppDatePickerWholeState extends State<AppDatePickerWhole> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.transparent,
      content: Container(
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
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime(1950),
                  maximumDate: DateTime(2050),
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
