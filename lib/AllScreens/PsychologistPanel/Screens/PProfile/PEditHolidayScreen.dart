import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PHolidayConfirmScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UFiltersPage.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddNewActivityScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/slots_apis/holiday_apis/add_holiday_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/popupdialogs.dart';
import 'package:intl/intl.dart';

import '../../../../constants/fonts.dart';

class PEditHolidayScreen extends StatefulWidget {
  final String? startDateTime;
  final String? endDateTime;
  const PEditHolidayScreen({Key? key, this.endDateTime, this.startDateTime})
      : super(key: key);

  @override
  State<PEditHolidayScreen> createState() => _PEditHolidayScreenState();
}

class _PEditHolidayScreenState extends State<PEditHolidayScreen> {
  String startDate = 'Start date';
  String startTime = 'Start time';
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  DateTime? endPickedDate;
  TimeOfDay? endPickedTime;
  String endDate = 'End date';
  String endTime = 'End time';
  String startDateTime = '';
  String endDateTime = '';

  @override
  void initState() {
    startDate = widget.startDateTime == null
        ? "Start date"
        : DateFormat("yyyy-MM-dd")
            .format(DateTime.parse(widget.startDateTime!));
    startTime = widget.startDateTime == null
        ? "Start time"
        : DateFormat.jm().format(DateTime.parse(widget.startDateTime!));
    endDate = widget.endDateTime == null
        ? "End date"
        : DateFormat("yyyy-MM-dd").format(DateTime.parse(widget.endDateTime!));
    endTime = widget.endDateTime == null
        ? "End time"
        : DateFormat.jm().format(DateTime.parse(widget.endDateTime!));
    pickedDate = widget.startDateTime == null
        ? null
        : DateTime.parse(widget.startDateTime!);
    pickedTime = widget.startDateTime == null
        ? null
        : TimeOfDay(
            hour: DateTime.parse(widget.startDateTime!).hour,
            minute: DateTime.parse(widget.startDateTime!).minute);
    endPickedDate =
        widget.endDateTime == null ? null : DateTime.parse(widget.endDateTime!);
    endPickedTime = widget.endDateTime == null
        ? null
        : TimeOfDay(
            hour: DateTime.parse(widget.endDateTime!).hour,
            minute: DateTime.parse(widget.endDateTime!).minute);
    startDateTime = widget.startDateTime == null
        ? ''
        : "$startDate ${pickedTime.toString().substring(10, 15)}";
    endDateTime = widget.endDateTime == null
        ? ''
        : "$endDate ${endPickedTime.toString().substring(10, 15)}";
    super.initState();
  }

  void _showCalender() async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.startDateTime == null
          ? DateTime.now()
          : DateTime.parse(widget.startDateTime!),
      firstDate: DateTime.now(),
      builder: (BuildContext context, child) {
        return CalenderWidget(child: child);
      },
      lastDate: DateTime.now().add(Duration(days: 180)),
    );
    if (pickedDate != null) {
      setState(() {
        startDate = DateFormat("yyyy-MM-dd").format(pickedDate!);
      });
    }
  }

  void _showEndCalender() async {
    endPickedDate = await showDatePicker(
      context: context,
      initialDate: widget.endDateTime == null
          ? DateTime.now()
          : DateTime.parse(widget.endDateTime!),
      firstDate: DateTime.now(),
      builder: (BuildContext context, child) {
        return CalenderWidget(child: child);
      },
      lastDate: DateTime.now().add(Duration(days: 180)),
    );
    if (endPickedDate != null) {
      setState(() {
        endDate = DateFormat("yyyy-MM-dd").format(endPickedDate!);
      });
    }
  }

  void _showTimepicker() async {
    pickedTime = await showTimePicker(
      initialTime: widget.startDateTime == null
          ? TimeOfDay.now()
          : TimeOfDay(
              hour: DateTime.parse(widget.startDateTime!).hour,
              minute: DateTime.parse(widget.startDateTime!).minute),
      context: context,
      builder: (BuildContext context, child) {
        return TimeWidget(child: child);
      },
    );
    if (pickedTime != null) {
      setState(() {
        startTime = DateFormat.jm().format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            pickedTime!.hour,
            pickedTime!.minute));
      });
    }
  }

  void _showEndTimepicker() async {
    endPickedTime = await showTimePicker(
      initialTime: widget.endDateTime == null
          ? TimeOfDay.now()
          : TimeOfDay(
              hour: DateTime.parse(widget.endDateTime!).hour,
              minute: DateTime.parse(widget.endDateTime!).minute),
      context: context,
      builder: (BuildContext context, child) {
        return TimeWidget(child: child);
      },
    );
    if (endPickedTime != null) {
      setState(() {
        endTime = DateFormat.jm().format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            endPickedTime!.hour,
            endPickedTime!.minute));
      });
    }
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kEDF6F9,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 58.h),
            child: Row(
              children: [
                Expanded(
                  child: MainButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        startDateTime =
                            "$startDate ${pickedTime.toString().substring(10, 15)}";
                        endDateTime =
                            "$endDate ${endPickedTime.toString().substring(10, 15)}";
                        final resp = AddHolidayApi().get(
                            startDateTime: startDateTime,
                            endDateTime: endDateTime);
                        resp.then((value) {
                          if (value['status'] == true) {
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PHolidayConfirmScreen(
                                      start: startDateTime,
                                      end: endDateTime,
                                    )));
                          } else {
                            Fluttertoast.showToast(msg: value['message']);
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20.h,
                          bottom: 20.h,
                        ),
                        child: Text(
                          "Confirm Holiday",
                          style: kManRope_500_16_white,
                        ),
                      ),
                      color: k006D77,
                      shape: CustomDecoration().button16Decoration()),
                ),
              ],
            ),
          ),
          appBar: CustomWhiteAppBar(
            hasThreeDots: false,
            appBarText: 'Add Holiday',
            imgPath: 'assets/images/iconbackappbarlarge.png',
          ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected date & time',
                    style: kManRope_500_16_001314,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          // width: 175.w,
                          height: 56.h,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              /*if (Platform.isIOS) {
                                showDialog(
                                  context: context,
                                  builder: (_) => AppDatePickerWhole(),
                                );
                              } else {*/
                              _showCalender();
                              //}
                            },
                            decoration: TextfieldDecoration(
                                label: startDate,
                                child: Image.asset(
                                  "assets/images/iconcalender24.png",
                                  height: 24.h,
                                )).smalltextfieldDecoration(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: SizedBox(
                          // width: 175.w,
                          height: 56.h,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              /* if (Platform.isIOS) {
                                showDialog(
                                  context: context,
                                  builder: (_) => TimePickerApp(
                                    dateTime: DateTime.now(),
                                  ),
                                );
                              } else {*/
                              _showTimepicker();
                              //}
                            },
                            decoration: TextfieldDecoration(
                                label: startTime,
                                child: Image.asset(
                                  "assets/images/iconclocknew.png",
                                  height: 24.h,
                                  width: 24.w,
                                )).smalltextfieldDecoration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Selected date & time',
                    style: kManRope_500_16_001314,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          // width: 175.w,
                          height: 56.h,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              /* if (Platform.isIOS) {
                                showDialog(
                                  context: context,
                                  builder: (_) => AppDatePickerWhole(),
                                );
                              } else {*/
                              _showEndCalender();
                              //}
                            },
                            decoration: TextfieldDecoration(
                                label: endDate,
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
                        child: SizedBox(
                          // width: 175.w,
                          height: 56.h,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              /*if (Platform.isIOS) {
                                showDialog(
                                  context: context,
                                  builder: (_) => TimePickerApp(
                                    dateTime: DateTime.now(),
                                  ),
                                );
                              } else {*/
                              _showEndTimepicker();
                              //}
                            },
                            decoration: TextfieldDecoration(
                                label: endTime,
                                child: Image.asset(
                                  "assets/images/iconclock.png",
                                  height: 24.h,
                                )).smalltextfieldDecoration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading) LoadingWidget()
      ],
    );
  }
}
