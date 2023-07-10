import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/slots_apis/availability_status.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/slots_apis/update_slots.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/PModels/counselor_profile_model/slots_model.dart';
import '../../../../widgets/popupdialogs.dart';

class PEditSlotsAvailabilityScreen extends StatefulWidget {
  final SlotsModel model;

  const PEditSlotsAvailabilityScreen({Key? key, required this.model})
      : super(key: key);

  @override
  State<PEditSlotsAvailabilityScreen> createState() =>
      _PEditSlotsAvailabilityScreenState();
}

class _PEditSlotsAvailabilityScreenState
    extends State<PEditSlotsAvailabilityScreen> {
  List switchValues = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  final List<String> day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> timeam = [
    "select",
    "select",
    "select",
    "select",
    "select",
    "select",
    "select",
  ];

  final List<String> timepm = [
    "select",
    "select",
    "select",
    "select",
    "select",
    "select",
    "select",
  ];

  final _cont = ScrollController();

  @override
  void initState() {
    if (widget.model.availabilityData != null) {
      //log(widget.model.availabilityData!.slotTime.toString());
      if (widget.model.availabilityData!.slotTime != null) {
        _amountController.text =
            widget.model.availabilityData!.slotTime.toString();
      } else {
        // _amountController.text = "add";
      }
      if (widget.model.availabilityData!.lunchTimeStart != null) {
        _fromController.text = selectTime = DateFormat("hh:mm a").format(
            DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                int.parse(widget.model.availabilityData!.lunchTimeStart
                    .toString()
                    .split(":")
                    .first),
                int.parse(widget.model.availabilityData!.lunchTimeStart
                    .toString()
                    .split(":")[1])));
        holder = TimeOfDay(
            hour: int.parse(widget.model.availabilityData!.lunchTimeStart
                .toString()
                .split(":")
                .first),
            minute: int.parse(widget.model.availabilityData!.lunchTimeStart
                .toString()
                .split(":")[1]));
      }
      if (widget.model.availabilityData!.lunchTimeEnd != null) {
        _toController.text = selectTime2 = DateFormat("hh:mm a").format(
            DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                int.parse(widget.model.availabilityData!.lunchTimeEnd
                    .toString()
                    .split(":")
                    .first),
                int.parse(widget.model.availabilityData!.lunchTimeEnd
                    .toString()
                    .split(":")[1])));
        holder2 = TimeOfDay(
            hour: int.parse(widget.model.availabilityData!.lunchTimeEnd
                .toString()
                .split(":")
                .first),
            minute: int.parse(widget.model.availabilityData!.lunchTimeEnd
                .toString()
                .split(":")[1]));
      }

      timeam.clear();
      timepm.clear();
      if (widget.model.availabilityData!.monday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.monday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.monday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));

        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.monday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.monday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      if (widget.model.availabilityData!.tuesday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.tuesday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.tuesday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));
        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.tuesday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.tuesday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      if (widget.model.availabilityData!.wednesday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.wednesday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.wednesday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));
        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.wednesday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.wednesday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      if (widget.model.availabilityData!.thursday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.thursday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.thursday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));
        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.thursday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.thursday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      if (widget.model.availabilityData!.friday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.friday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.friday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));
        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.friday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.friday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      if (widget.model.availabilityData!.saturday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.saturday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.saturday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));
        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.saturday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.saturday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      if (widget.model.availabilityData!.sunday != null) {
        timeam.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.sunday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.sunday
                .toString()
                .split(" - ")
                .first
                .split(":")
                .last))));
        timepm.add(DateFormat("hh:mm a").format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(widget.model.availabilityData!.sunday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .first),
            int.parse(widget.model.availabilityData!.sunday
                .toString()
                .split(" - ")
                .last
                .split(":")
                .last))));
      } else {
        timeam.add("select");
        timepm.add("select");
      }
      mondayStart =
          widget.model.availabilityData!.monday.toString().split(" - ").first;
      mondayEnd =
          widget.model.availabilityData!.monday.toString().split(" - ").last;
      tuesdayStart =
          widget.model.availabilityData!.tuesday.toString().split(" - ").first;
      tuesdayEnd =
          widget.model.availabilityData!.tuesday.toString().split(" - ").last;
      wednesdayStart = widget.model.availabilityData!.wednesday
          .toString()
          .split(" - ")
          .first;
      wednesdayEnd =
          widget.model.availabilityData!.wednesday.toString().split(" - ").last;
      thursdayStart =
          widget.model.availabilityData!.thursday.toString().split(" - ").first;
      thursdayEnd =
          widget.model.availabilityData!.thursday.toString().split(" - ").last;
      fridayStart =
          widget.model.availabilityData!.friday.toString().split(" - ").first;
      fridayEnd =
          widget.model.availabilityData!.friday.toString().split(" - ").last;
      saturdayStart =
          widget.model.availabilityData!.saturday.toString().split(" - ").first;
      saturdayEnd =
          widget.model.availabilityData!.saturday.toString().split(" - ").last;
      sundayStart =
          widget.model.availabilityData!.sunday.toString().split(" - ").first;
      sundayEnd =
          widget.model.availabilityData!.sunday.toString().split(" - ").last;
      switchValues.clear();
      if (widget.model.availabilityData!.monStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
      if (widget.model.availabilityData!.tuesStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
      if (widget.model.availabilityData!.wedStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
      if (widget.model.availabilityData!.thurStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
      if (widget.model.availabilityData!.friStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
      if (widget.model.availabilityData!.satStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
      if (widget.model.availabilityData!.sunStatus == "1") {
        switchValues.add(true);
      } else {
        switchValues.add(false);
      }
    }
    super.initState();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  TimeOfDay? _pickedTime;
  TimeOfDay holder = TimeOfDay.now();
  TimeOfDay holder2 = TimeOfDay.now();
  String selectTime = "select time";
  String selectTime2 = "select time";

  String mondayStart = '';
  String mondayEnd = '';
  String tuesdayStart = '';
  String tuesdayEnd = '';
  String wednesdayStart = '';
  String wednesdayEnd = '';
  String thursdayStart = '';
  String thursdayEnd = '';
  String fridayStart = '';
  String fridayEnd = '';
  String saturdayStart = '';
  String saturdayEnd = '';
  String sundayStart = '';
  String sundayEnd = '';

  bool _submitLoading = false;

  bool _toggleLoading = false;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: MainButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _submitLoading = true;
                          });
                          final resp = UpdateSlotsApi().get(
                              mondayStart: mondayStart,
                              mondayEnd: mondayEnd,
                              tuesdayStart: tuesdayStart,
                              tuesdayEnd: tuesdayEnd,
                              wednesdayStart: wednesdayStart,
                              wednesdayEnd: wednesdayEnd,
                              thursdayStart: thursdayStart,
                              thursdayEnd: thursdayEnd,
                              fridayStart: fridayStart,
                              fridayEnd: fridayEnd,
                              saturdayStart: saturdayStart,
                              saturdayEnd: saturdayEnd,
                              sundayStart: sundayStart,
                              sundayEnd: sundayEnd,
                              timeSlot: _amountController.text,
                              lunchStart: holder.toString().substring(10, 15),
                              lunchEnd: holder2.toString().substring(10, 15));
                          resp.then((value) {
                            if (value['status'] == true) {
                              setState(() {
                                _submitLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "Updated Successfully.");
                              Navigator.of(context).pop();
                            } else {
                              setState(() {
                                _submitLoading = false;
                                Fluttertoast.showToast(
                                    msg: "Something went wrong.");
                              });
                            }
                          });
                        } else {}
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
          backgroundColor: kEDF6F9,
          appBar: CustomWhiteAppBar(
            hasThreeDots: false,
            appBarText: 'Slots Availability',
            imgPath: 'assets/images/iconbackappbarlarge.png',
          ),
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              controller: _cont,
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 27.h),
                child: Form(
                  key: _key,
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
                                      InkWell(
                                        onTap: () async {
                                          // if (Platform.isAndroid) {
                                          _pickedTime = await showTimePicker(
                                            initialTime: TimeOfDay.now(),
                                            context: context,
                                            builder:
                                                (BuildContext context, child) {
                                              return TimeWidget(child: child);
                                            },
                                          );
                                          if (_pickedTime != null) {
                                            log(_pickedTime.toString());
                                            final now = DateTime.now();
                                            //holder = _pickedTime!;
                                            setState(() {
                                              timeam[index] = DateFormat.jm()
                                                  .format(DateTime(
                                                      now.year,
                                                      now.month,
                                                      now.day,
                                                      _pickedTime!.hour,
                                                      _pickedTime!.minute));
                                              // selectTime = _fromController.text;
                                              if (index == 0) {
                                                mondayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 1) {
                                                tuesdayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 2) {
                                                wednesdayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 3) {
                                                thursdayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 4) {
                                                fridayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 5) {
                                                saturdayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 6) {
                                                sundayStart = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              log(holder
                                                  .toString()
                                                  .substring(10, 15));
                                            });
                                          }
                                          /*} else {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            TimePickerApp(dateTime: DateTime.parse(a)),
                                      ).then((value) => getReminderTime());
                                    }*/
                                        },
                                        child: Container(
                                          // height: 48.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          width: 79.w,
                                          decoration: BoxDecoration(
                                              color: kDDEBEC,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                            timeam[index],
                                            style: kManRope_400_14_626A6A,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 25.w),
                                      InkWell(
                                        onTap: () async {
                                          // if (Platform.isAndroid) {
                                          _pickedTime = await showTimePicker(
                                            initialTime: TimeOfDay.now(),
                                            context: context,
                                            builder:
                                                (BuildContext context, child) {
                                              return TimeWidget(child: child);
                                            },
                                          );
                                          if (_pickedTime != null) {
                                            log(_pickedTime.toString());
                                            final now = DateTime.now();
                                            // holder = _pickedTime!;
                                            setState(() {
                                              timepm[index] = DateFormat.jm()
                                                  .format(DateTime(
                                                      now.year,
                                                      now.month,
                                                      now.day,
                                                      _pickedTime!.hour,
                                                      _pickedTime!.minute));
                                              if (index == 0) {
                                                mondayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 1) {
                                                tuesdayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 2) {
                                                wednesdayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 3) {
                                                thursdayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 4) {
                                                fridayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 5) {
                                                saturdayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              if (index == 6) {
                                                sundayEnd = _pickedTime
                                                    .toString()
                                                    .substring(10, 15);
                                              }
                                              // selectTime = _fromController.text;
                                              log(holder
                                                  .toString()
                                                  .substring(10, 15));
                                            });
                                          }
                                          /*} else {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            TimePickerApp(dateTime: DateTime.parse(a)),
                                      ).then((value) => getReminderTime());
                                    }*/
                                        },
                                        child: Container(
                                          // height: 48.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          width: 81.w,
                                          decoration: BoxDecoration(
                                              color: kDDEBEC,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                            timepm[index],
                                            style: kManRope_400_14_626A6A,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 25.w),
                                      _toggleLoading && _index == index
                                          ? SizedBox(
                                              height: 48.h,
                                              width: 48.w,
                                              child: SpinKitThreeBounce(
                                                color: k006D77,
                                                size: 25,
                                              ),
                                            )
                                          : SizedBox(
                                              height: 48.h,
                                              width: 48.w,
                                              child: FlutterSwitch(
                                                width: 40,
                                                height: 18,
                                                toggleSize: 14,
                                                padding: 3,
                                                activeColor: k006D77,
                                                value: switchValues[index],
                                                onToggle: (val) {
                                                  setState(() {
                                                    _index = index;
                                                    _toggleLoading = true;
                                                  });
                                                  final resp = AvailabilityStatus().get(
                                                      status: index == 0
                                                          ? "mon_status"
                                                          : index == 1
                                                              ? "tues_status"
                                                              : index == 2
                                                                  ? "wed_status"
                                                                  : index == 3
                                                                      ? "thur_status"
                                                                      : index == 4
                                                                          ? "fri_status"
                                                                          : index == 5
                                                                              ? "sat_status"
                                                                              : "sun_status");
                                                  resp.then((value) {
                                                    log(value.toString());
                                                    setState(() {
                                                      if (value["status"] ==
                                                          true) {
                                                        if (value[
                                                                "availability"] ==
                                                            0) {
                                                          switchValues[index] =
                                                              false;
                                                          _toggleLoading =
                                                              false;
                                                        } else {
                                                          switchValues[index] =
                                                              true;
                                                          _toggleLoading =
                                                              false;
                                                        }
                                                      } else {
                                                        _toggleLoading = false;
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                value["error"]);
                                                      }
                                                    });
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
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Slot time",
                            style: kManRope_700_16_001314,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                // height: 56.h,
                                width: 110.w,
                                child: TextFormField(
                                    controller: _amountController,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    style: kManRope_500_16_626A6A,
                                    validator: (val) {
                                      if (_amountController.text.isEmpty) {
                                        return "Add time";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: TextfieldDecoration(
                                            label: "Add time",
                                            hintstyle: kManRope_500_16_626A6A,
                                            fillColor: Color(0xFFDDEBEC),
                                            radius: 36)
                                        .textfieldDecoration()),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "min",
                                style: kManRope_400_12_626A6A,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lunch Time",
                            style: kManRope_700_16_001314,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  // if (Platform.isAndroid) {
                                  _pickedTime = await showTimePicker(
                                    initialTime: selectTime == 'select time'
                                        ? TimeOfDay.now()
                                        : holder,
                                    context: context,
                                    builder: (BuildContext context, child) {
                                      return TimeWidget(child: child);
                                    },
                                  );
                                  if (_pickedTime != null) {
                                    log(_pickedTime.toString());
                                    final now = DateTime.now();
                                    holder = _pickedTime!;
                                    setState(() {
                                      _fromController.text = DateFormat.jm()
                                          .format(DateTime(
                                              now.year,
                                              now.month,
                                              now.day,
                                              _pickedTime!.hour,
                                              _pickedTime!.minute));
                                      selectTime = _fromController.text;
                                      log(holder.toString().substring(10, 15));
                                    });
                                  }
                                  /*} else {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            TimePickerApp(dateTime: DateTime.parse(a)),
                                      ).then((value) => getReminderTime());
                                    }*/
                                },
                                child: SizedBox(
                                  // height: 56.h,
                                  width: 110.w,
                                  child: IgnorePointer(
                                    child: TextFormField(
                                        readOnly: true,
                                        controller: _fromController,
                                        keyboardType: TextInputType.number,
                                        style: kManRope_500_16_626A6A,
                                        validator: (val) {
                                          if (_amountController.text.isEmpty) {
                                            return "Add time";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: TextfieldDecoration(
                                                label: "Start",
                                                hintstyle:
                                                    kManRope_500_16_626A6A,
                                                fillColor: Color(0xFFDDEBEC),
                                                radius: 36)
                                            .textfieldDecoration()),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "To",
                                style: kManRope_400_12_626A6A,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              InkWell(
                                onTap: () async {
                                  // if (Platform.isAndroid) {
                                  _pickedTime = await showTimePicker(
                                    initialTime: selectTime2 == 'select time'
                                        ? TimeOfDay.now()
                                        : holder2,
                                    context: context,
                                    builder: (BuildContext context, child) {
                                      return TimeWidget(child: child);
                                    },
                                  );
                                  if (_pickedTime != null) {
                                    log(_pickedTime.toString());
                                    final now = DateTime.now();
                                    holder2 = _pickedTime!;
                                    setState(() {
                                      _toController.text = DateFormat.jm()
                                          .format(DateTime(
                                              now.year,
                                              now.month,
                                              now.day,
                                              _pickedTime!.hour,
                                              _pickedTime!.minute));
                                      selectTime2 = _toController.text;
                                      log(holder2.toString().substring(10, 15));
                                    });
                                  }
                                  /*} else {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            TimePickerApp(dateTime: DateTime.parse(a)),
                                      ).then((value) => getReminderTime());
                                    }*/
                                },
                                child: SizedBox(
                                  // height: 56.h,
                                  width: 110.w,
                                  child: IgnorePointer(
                                    child: TextFormField(
                                        readOnly: true,
                                        controller: _toController,
                                        keyboardType: TextInputType.number,
                                        style: kManRope_500_16_626A6A,
                                        validator: (val) {
                                          if (_amountController.text.isEmpty) {
                                            return "Add time";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: TextfieldDecoration(
                                                label: "End",
                                                hintstyle:
                                                    kManRope_500_16_626A6A,
                                                fillColor: Color(0xFFDDEBEC),
                                                radius: 36)
                                            .textfieldDecoration()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Note :- New changes will come in effect after your last upcoming booking.",
                        style: kManRope_400_10_006D77,
                      )
                      /*SizedBox(
                        height: 277.h,
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_submitLoading) LoadingWidget()
      ],
    );
  }
}
