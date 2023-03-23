import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PEditHolidayScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PEditSlotAvailablityScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/slots_apis/get_slots_api.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/slots_apis/holiday_apis/delete_holiday.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/model/PModels/counselor_profile_model/slots_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/popupdialogs.dart';
import 'package:intl/intl.dart';
import '../../../../constants/fonts.dart';
import '../../../../widgets/buttons.dart';

class PSlotsAvailabilityScreen extends StatefulWidget {
  const PSlotsAvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<PSlotsAvailabilityScreen> createState() =>
      _PSlotsAvailabilityScreenState();
}

class _PSlotsAvailabilityScreenState extends State<PSlotsAvailabilityScreen> {
  void _showCalender() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      builder: (BuildContext context, child) {
        return CalenderWidget(child: child);
      },
      lastDate: DateTime(2024),
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

  SlotsModel model = SlotsModel();

  bool _isLoading = false;
  bool _holidayLoading = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    _isLoading = true;
    final resp = SlotsApi().get();
    resp.then((value) {
      log(value.toString());
      if (value["status"] == true) {
        setState(() {
          model = SlotsModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          model = SlotsModel(availabilityData: AvailabilityData());
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Slots Availability',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: _isLoading
          ? Center(
              child: LoadingWidget(),
            )
          : SingleChildScrollView(
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
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) =>
                                          PEditSlotsAvailabilityScreen(
                                            model: model,
                                          )))
                                  .then((value) {
                                _getData();
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
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
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Monday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child: model.availabilityData!.monStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.monday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.monday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Off",
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child: model.availabilityData!.monStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat.jm().format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.monday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.monday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Tuesday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child: model.availabilityData!.tuesStatus
                                      .toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.tuesday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.tuesday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Off",
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child: model.availabilityData!.tuesStatus
                                      .toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.tuesday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.tuesday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Wednesday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child: model.availabilityData!.wedStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model
                                          .availabilityData!.wednesday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .first),
                                      int.parse(model
                                          .availabilityData!.wednesday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Off",
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child: model.availabilityData!.wedStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model
                                          .availabilityData!.wednesday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .first),
                                      int.parse(model
                                          .availabilityData!.wednesday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Thursday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child:
                              model.availabilityData!.thurStatus.toString() ==
                                      "1"
                                  ? Text(
                                      DateFormat("hh:mm a").format(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          int.parse(model
                                              .availabilityData!.thursday!
                                              .split(" - ")
                                              .first
                                              .split(":")
                                              .first),
                                          int.parse(model
                                              .availabilityData!.thursday!
                                              .split(" - ")
                                              .first
                                              .split(":")
                                              .last))),
                                      style: kManRope_400_14_626A6A,
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "Off",
                                      style: kManRope_400_14_626A6A,
                                      textAlign: TextAlign.center,
                                    ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child:
                              model.availabilityData!.thurStatus.toString() ==
                                      "1"
                                  ? Text(
                                      DateFormat("hh:mm a").format(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          int.parse(model
                                              .availabilityData!.thursday!
                                              .split(" - ")
                                              .last
                                              .split(":")
                                              .first),
                                          int.parse(model
                                              .availabilityData!.thursday!
                                              .split(" - ")
                                              .last
                                              .split(":")
                                              .last))),
                                      style: kManRope_400_14_626A6A,
                                      textAlign: TextAlign.end,
                                    )
                                  : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Friday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child: model.availabilityData!.friStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.friday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.friday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Off",
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child: model.availabilityData!.friStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.friday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.friday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Saturday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child: model.availabilityData!.satStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model
                                          .availabilityData!.saturday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .first),
                                      int.parse(model
                                          .availabilityData!.saturday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Off",
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child: model.availabilityData!.satStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model
                                          .availabilityData!.saturday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .first),
                                      int.parse(model
                                          .availabilityData!.saturday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 76.w,
                          child: Text(
                            "Sunday",
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                        SizedBox(width: 114.w),
                        SizedBox(
                          height: 48.h,
                          width: 79.w,
                          child: model.availabilityData!.sunStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.sunday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.sunday!
                                          .split(" - ")
                                          .first
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Off",
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(width: 30.w),
                        SizedBox(
                          height: 48.h,
                          width: 81.w,
                          child: model.availabilityData!.sunStatus.toString() ==
                                  "1"
                              ? Text(
                                  DateFormat("hh:mm a").format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      int.parse(model.availabilityData!.sunday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .first),
                                      int.parse(model.availabilityData!.sunday!
                                          .split(" - ")
                                          .last
                                          .split(":")
                                          .last))),
                                  style: kManRope_400_14_626A6A,
                                  textAlign: TextAlign.end,
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    /* SizedBox(
                      // height: 360.h,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) =>

                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [

                            ],
                          );
                        },
                      ),
                    ),*/
                    SizedBox(height: 40.h),
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
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => PEditHolidayScreen(
                                            startDateTime:
                                                model.holidays!.isNotEmpty
                                                    ? model.holidays![0]
                                                    : null,
                                            endDateTime:
                                                model.holidays!.isNotEmpty
                                                    ? model.holidays![1]
                                                    : null,
                                          )))
                                  .then((value) => _getData());
                            },
                            child: SizedBox(
                              // color: Colors.red,
                              height: 48.h,
                              width: 50.w,
                              child: Center(
                                child: Text(
                                  model.holidays!.isEmpty ? "Add" : 'Edit',
                                  style: kManRope_500_16_006D77,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    model.holidays!.isEmpty
                        ? Center(
                            child: Image.asset(
                              "assets/images/holiday.png",
                              width: 280.w,
                              height: 250.h,
                            ),
                          )
                        : _holidayLoading
                            ? Center(
                                child: SpinKitThreeBounce(
                                  color: k006D77,
                                  size: 20,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start date & time',
                                    style: kManRope_500_16_001314,
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          // width: 175.w,
                                          height: 56.h,
                                          child: TextFormField(
                                            readOnly: true,
                                            onTap: () {
                                              //_showCalender();
                                            },
                                            decoration: TextfieldDecoration(
                                                label: DateFormat.yMMMMd()
                                                    .format(DateTime.parse(
                                                        model.holidays![0])),
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
                                              /*if (Platform.isIOS) {
                            showDialog(
                              context: context,
                              builder: (_) => TimePickerApp(),
                            );
                          } else {
                            _showTimepicker();
                          }*/
                                            },
                                            decoration: TextfieldDecoration(
                                                label: DateFormat.jm().format(
                                                    DateTime.parse(
                                                        model.holidays![0])),
                                                child: Image.asset(
                                                  "assets/images/iconclock.png",
                                                  height: 24.h,
                                                )).smalltextfieldDecoration(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  Text(
                                    'End date & time',
                                    style: kManRope_500_16_001314,
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                          } else {
                            _showCalender();
                          }*/
                                            },
                                            decoration: TextfieldDecoration(
                                                label: DateFormat.yMMMMd()
                                                    .format(DateTime.parse(
                                                        model.holidays![1])),
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
                                            onTap: () {},
                                            decoration: TextfieldDecoration(
                                                label: DateFormat.jm().format(
                                                    DateTime.parse(
                                                        model.holidays![1])),
                                                child: Image.asset(
                                                  "assets/images/iconclock.png",
                                                  height: 24.h,
                                                )).smalltextfieldDecoration(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MainButton(
                                            onPressed: () {
                                              setState(() {
                                                _holidayLoading = true;
                                              });
                                              final resp =
                                                  DeleteHoliday().get();
                                              resp.then((value) {
                                                if (value['status'] == true) {
                                                  model.holidays!.clear();
                                                  setState(() {
                                                    _holidayLoading = false;
                                                  });
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Holiday deleted successfully.");
                                                } else {
                                                  setState(() {
                                                    _holidayLoading = false;
                                                  });
                                                  Fluttertoast.showToast(
                                                      msg: value["message"]);
                                                }
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16.h),
                                              child: Text(
                                                "Delete Holiday",
                                                style: kManRope_500_16_white,
                                              ),
                                            ),
                                            color: kB64C4C,
                                            shape: CustomDecoration()
                                                .button16Decoration()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                  ],
                ),
              ),
            ),
    );
  }
}
