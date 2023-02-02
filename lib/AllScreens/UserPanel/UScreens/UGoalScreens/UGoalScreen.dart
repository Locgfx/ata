import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddactivity.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UBottomsheet.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constants/fonts.dart';

class UGoalScreen extends StatefulWidget {
  UGoalScreen({Key? key}) : super(key: key);

  @override
  State<UGoalScreen> createState() => _UGoalScreenState();
}

class _UGoalScreenState extends State<UGoalScreen> {
  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  BoxDecoration constDecoration = const BoxDecoration(
    shape: BoxShape.rectangle,
  );
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  final sc = DraggableScrollableController();
  final sc2 = ScrollController();
  List dx = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  void _uDeleteBottomsheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: kFFFFFF,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) => UDeleteBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: kEDF6F9,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
                statusBarColor: kEDF6F9,
                statusBarIconBrightness: Brightness.dark,
              )
            : SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 100.w),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/activityArt.svg',
                height: 240.h,
                width: 380.w,
              ),
              SizedBox(
                height: 40.h,
              ),
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(2022),
                lastDay: DateTime(2030),
                calendarFormat: CalendarFormat.week,
                headerVisible: false,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  withinRangeTextStyle: kManRope_400_14_white,
                  todayTextStyle: kManRope_400_14_white,
                  rangeEndTextStyle: kManRope_400_14_white,
                  rangeStartTextStyle: kManRope_400_14_white,
                  todayDecoration: constDecoration,
                  defaultDecoration: constDecoration,
                  withinRangeDecoration: constDecoration,
                  disabledDecoration: constDecoration,
                  holidayDecoration: constDecoration,
                  markerDecoration: constDecoration,
                  outsideDecoration: constDecoration,
                  rangeEndDecoration: constDecoration,
                  rangeStartDecoration: constDecoration,
                  rowDecoration: constDecoration,
                  weekendDecoration: constDecoration,
                  selectedDecoration: BoxDecoration(
                    border: Border.all(
                      color: k006D77,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    color: k006D77,
                  ),
                ),
                rowHeight: 56.h,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Text(
                      'Goals',
                      style: kManRope_500_28_001314,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'completion 75 %',
                      style: kManRope_500_14_626A6A,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset(
                      'assets/icons/progressIcon.svg',
                      height: 21,
                      width: 21,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UAddActivityScreen()));
                      },
                      child: SvgPicture.asset(
                        'assets/icons/circlepluswithbackground.svg',
                        height: 48.h,
                        width: 48.w,
                      ),
                    ),
                  ],
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _uDeleteBottomsheet();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 16.h),
                              width: 90.h,
                              height: 81.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                color: kBC5656,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                'assets/images/bin.png',
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(dx[index], 0),
                            child: GestureDetector(
                              onHorizontalDragUpdate: (v) {
                                setState(() {
                                  InkWell(
                                    onTap: () => _onSelected(index),
                                  );
                                  dx[index] =
                                      (dx[index] + v.delta.dx).clamp(0.0, 81.h);
                                  //print(_dx);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 16.h),
                                height: 81.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedIndex == index
                                      ? k05AF01
                                      : k5A72ED,
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            'assets/images/Framedots.png',
                                            fit: BoxFit.fitWidth,
                                            //height: 81.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/run.svg',
                                                height: 36.w,
                                                width: 36.w,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(width: 12.w),
                                              Text(
                                                'Running',
                                                style: kManRope_500_16_white,
                                              ),
                                            ],
                                          ),
                                          _selectedIndex == index
                                              ? SvgPicture.asset(
                                                  'assets/icons/greencircletick.svg',
                                                  height: 36.w,
                                                  width: 36.w,
                                                )
                                              : SvgPicture.asset(
                                                  'assets/icons/greyTick.svg',
                                                  height: 36.w,
                                                  width: 36.w,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(height: 0);
                    },
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
