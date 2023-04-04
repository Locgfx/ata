import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddactivity.dart';
import 'package:greymatter/Apis/UserAPis/addgoal/complete_goal_api.dart';
import 'package:greymatter/Apis/UserAPis/user_goals_api/add_today_goals.dart';
import 'package:greymatter/Apis/UserAPis/user_goals_api/user_goals_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/model/UModels/user_goals_models/user_goals_model.dart';
import 'package:greymatter/widgets/BottomSheets/DeleteBottomSheet.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
  int _selectedIndex = -1;

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

  void _uDeleteBottomsheet(int activityId, int removeIndex) {
    showModalBottomSheet(
        context: context,
        backgroundColor: kFFFFFF,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) => UDeleteBottomSheet(
              onPop: () {
                setState(() {
                  _isLoading = true;
                  modelList.removeAt(removeIndex);
                  dx[removeIndex] = 0.0;
                });
                _getData();
              },
              activityId: activityId,
            ));
  }

  double percentage = 0;

  List<UserGoalsModel> modelList = [];

  bool _isLoading = false;

  @override
  void initState() {
    _todayGoalsApi();
    super.initState();
  }

  _todayGoalsApi() {
    _isLoading = true;
    final resp = AddTodayGoals().get();
    resp.then((value) {}).then((value) {
      _getData();
    });
  }

  _getData() {
    log(selectedDay.toString());
    final resp =
        UserGoalsApi().get(date: DateFormat("yyyy-MM-dd").format(selectedDay));
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        modelList.clear();
        //modelList.clear();
        setState(() {
          for (var v in value['goals']) {
            modelList.add(UserGoalsModel.fromJson(v));
            _updateState.add(false);
          }
          percentage = ((modelList
                      .where((element) => element.completedGoal == 1)
                      .length /
                  modelList.length) *
              100);
          _isLoading = false;
        });
      } else {
        setState(() {
          modelList.clear();
          _isLoading = false;
        });
      }
    });
  }

  List<bool> _updateState = [];
  getCompletedGoals() {
    return 0;
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
                lastDay: DateTime.now(),
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
                    _isLoading = true;
                  });
                  _getData();
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
                      'completion ${percentage.toString().split(".").first} %',
                      style: kManRope_500_14_626A6A,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircularPercentIndicator(
                      radius: 25.0,
                      lineWidth: 2.0,
                      percent: percentage / 100,
                      backgroundColor: k006D77.withOpacity(0.16),
                      progressColor: k006D77,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => UAddActivityScreen()))
                            .then((value) => _getData());
                      },
                      child: SvgPicture.asset(
                        'assets/icons/circlepluswithbackground.svg',
                        height: 48.w,
                        width: 48.w,
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading
                  ? Center(
                      child: Image.asset(
                        'assets/images/loader.gif',
                        width: 200.w,
                        height: 200.h,
                        //color: k006D77,
                      ),
                    )
                  : modelList.isEmpty
                      ? Text(
                          'No Goals Added Yet.',
                          style: kManRope_600_16_Black,
                        )
                      : MediaQuery.removePadding(
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
                                      _uDeleteBottomsheet(
                                          int.parse(
                                              modelList[index].activityId!),
                                          index);
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
                                      onHorizontalDragUpdate: DateTime.parse(
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(selectedDay))
                                              .isBefore(DateTime.parse(
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(DateTime.now())))
                                          ? (v) {}
                                          : (v) {
                                              setState(() {
                                                dx[index] =
                                                    (dx[index] + v.delta.dx)
                                                        .clamp(0.0, 81.h);
                                                //print(_dx);
                                              });
                                            },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 16.h),
                                        height: 81.h,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              modelList[index].completedGoal ==
                                                      1
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.network(
                                                        modelList[index]
                                                            .icon
                                                            .toString(),
                                                        height: 36.w,
                                                        width: 36.w,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      /*SvgPicture.asset(
                                                        'assets/icons/run.svg',
                                                        height: 36.w,
                                                        width: 36.w,
                                                        fit: BoxFit.fill,
                                                      ),*/
                                                      SizedBox(width: 12.w),
                                                      Text(
                                                        modelList[index]
                                                            .activityName
                                                            .toString(),
                                                        style:
                                                            kManRope_500_16_white,
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: DateTime.parse(DateFormat(
                                                                    "yyyy-MM-dd")
                                                                .format(
                                                                    selectedDay))
                                                            .isBefore(DateTime
                                                                .parse(DateFormat(
                                                                        "yyyy-MM-dd")
                                                                    .format(DateTime
                                                                        .now())))
                                                        ? () {}
                                                        : () {
                                                            setState(() {
                                                              _updateState[
                                                                  index] = true;
                                                            });
                                                            final resp = CompleteGoalApi().get(
                                                                goalId: modelList[
                                                                        index]
                                                                    .goalId
                                                                    .toString(),
                                                                date: DateFormat(
                                                                        "yyyy-MM-dd")
                                                                    .format(
                                                                        selectedDay));
                                                            resp.then((value) {
                                                              /*Fluttertoast
                                                                  .showToast(
                                                                      msg: value
                                                                          .toString());*/
                                                              if (value[
                                                                      'status'] ==
                                                                  true) {
                                                                if (value[
                                                                        'message'] ==
                                                                    "Removed SuccessFully!") {
                                                                  setState(() {
                                                                    modelList[
                                                                            index]
                                                                        .completedGoal = 0;
                                                                    percentage =
                                                                        ((modelList.where((element) => element.completedGoal == 1).length /
                                                                                modelList.length) *
                                                                            100);
                                                                    _updateState[
                                                                            index] =
                                                                        false;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    modelList[
                                                                            index]
                                                                        .completedGoal = 1;
                                                                    percentage =
                                                                        ((modelList.where((element) => element.completedGoal == 1).length /
                                                                                modelList.length) *
                                                                            100);
                                                                    _updateState[
                                                                            index] =
                                                                        false;
                                                                  });
                                                                }
                                                              } else {
                                                                Fluttertoast.showToast(
                                                                    msg: value[
                                                                        'error']);
                                                                setState(() {
                                                                  _updateState[
                                                                          index] =
                                                                      false;
                                                                });
                                                              }
                                                            });
                                                          },
                                                    child: _updateState[index]
                                                        ? SpinKitThreeBounce(
                                                            color: Colors.white,
                                                            size: 15,
                                                          )
                                                        : Container(
                                                            color: Colors
                                                                .transparent,
                                                            child: modelList[
                                                                            index]
                                                                        .completedGoal ==
                                                                    1
                                                                ? SvgPicture
                                                                    .asset(
                                                                    'assets/icons/greencircletick.svg',
                                                                    height:
                                                                        36.w,
                                                                    width: 36.w,
                                                                  )
                                                                : SvgPicture
                                                                    .asset(
                                                                    'assets/icons/greyTick.svg',
                                                                    height:
                                                                        36.w,
                                                                    width: 36.w,
                                                                  ),
                                                          ),
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
                            itemCount: modelList.length,
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
