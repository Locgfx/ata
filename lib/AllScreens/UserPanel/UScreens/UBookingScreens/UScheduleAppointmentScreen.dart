import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UConfirmBookingScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/reschedule_booking_api.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../Apis/UserAPis/user_home_apis/confirm_booking_apis/get_slots_api.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_home_models/slots_model.dart';
import 'UBookingSuccessfulScreen.dart';

class UScheduleAppointmentScreen extends StatefulWidget {
  final UPsychologistModel psychologist;
  UScheduleAppointmentScreen(
      {Key? key,
      required this.issue,
      required this.psychologist,
      required this.issueId,
      required this.bookingType,
      this.reschedule})
      : super(key: key);
  final String issue;
  final String bookingType;
  final String issueId;
  String? reschedule;

  @override
  State<UScheduleAppointmentScreen> createState() =>
      _UScheduleAppointmentScreenState();
}

class _UScheduleAppointmentScreenState
    extends State<UScheduleAppointmentScreen> {
  DateTime selectedDay = DateTime.now();
  int weekDay = DateTime.now().weekday;
  DateTime focusedDay = DateTime.now();
  bool flag = false;
  String date =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  int selectedIndex = -1;
  BoxDecoration constDecoration = const BoxDecoration(
    shape: BoxShape.rectangle,
  );

  String apiDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  late String Month = 'January';

  void monthSet(int month) {
    switch (month) {
      case 1:
        Month = 'January';
        break;
      case 2:
        Month = 'February';
        break;
      case 3:
        Month = 'March';
        break;
      case 4:
        Month = 'April';
        break;
      case 5:
        Month = 'May';
        break;
      case 6:
        Month = 'June';
        break;
      case 7:
        Month = 'July';
        break;
      case 8:
        Month = 'August';
        break;
      case 9:
        Month = 'September';
        break;
      case 10:
        Month = 'October';
        break;
      case 11:
        Month = 'November';
        break;
      case 12:
        Month = 'December';
        break;
    }
  }

  bool _btnLoading = false;

  getSlotCount() {
    int a = 0;
    /*switch(weekDay) {
      case 1:
        a = widget.psychologist.availability.monday.split('-').first;
    }*/
    return a;
  }

  int value = 0;

  @override
  void initState() {
    _isLoading = true;
    _getData();
    super.initState();
  }

  AvailableSlotsModel _slotsModel = AvailableSlotsModel();
  bool _isLoading = false;
  String time = '';
  String issue = '';
  String issueId = '';
  _getData() {
    log("message");
    final resp = GetSlotsApi().get(
        counsellorId: widget.psychologist.psychologistId.toString(),
        date: apiDate);
    resp.then((val) {
      log(value.toString());
      if (val['status'] == true) {
        setState(() {
          _slotsModel = AvailableSlotsModel.fromJson(val);
          // log(widget.issueId);
          // log(widget.issue);
          for (int i = 0; i < _slotsModel.issue!.length; i++) {
            if (_slotsModel.issue![i].name.toString() == widget.issue &&
                _slotsModel.issue![i].specialitiesId.toString() ==
                    widget.issueId) {
              value = i;
              issue = widget.issue;
              issueId = widget.issueId;
            } else {
              issue = _slotsModel.issue![0].name.toString();
              issueId = _slotsModel.issue![0].specialitiesId.toString();
            }
          }
          List<String> _test = [];
          for (var v in _slotsModel.bookedSlots!) {
            _test.add(v.split(":").first + ":" + v.split(":")[1]);
          }
          _slotsModel.bookedSlots = _test;
          // log(_test.toString());
          // log(_slotsModel.bookedSlots.toString());
          //log(_slotsModel.slots![0].split(":").toString());
          _isLoading = false;
          _dataLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _dataLoading = false;
        });
      }
    });
  }

  bool _dataLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: widget.reschedule != null ? "Reschedule" : 'Appointment',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: _isLoading
          ? Center(
              child: LoadingWidget(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flag ? '$Month ${selectedDay.year}' : 'Select Date',
                      style: kManRope_500_16_001314,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(Duration(days: 15)),
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
                          time = '';
                          selectedIndex = -1;
                          print(selectDay.weekday);
                          selectedDay = selectDay;
                          weekDay = selectDay.weekday;
                          focusedDay = focusDay;
                          flag = true;
                          monthSet(selectDay.month);
                          //log(selectDay.toString());
                          //log(selectDay.month.toString());

                          date = DateFormat("dd/MM/yyyy").format(selectDay);
                          //  '${selectDay.day}/${selectDay.month}/${selectDay.year}';
                          apiDate = DateFormat("yyyy-MM-dd").format(selectDay);
                          _dataLoading = true;
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
                    _dataLoading
                        ? Center(
                            child: Image.asset(
                              'assets/images/loader.gif',
                              width: 200.w,
                              height: 200.h,
                              //color: k006D77,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Available Slots',
                                style: kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              _slotsModel.slots!.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Center(
                                          child: Text(
                                              'No Available Slots for the selected date.')),
                                    )
                                  : Wrap(
                                      children: [
                                        for (int i = 0;
                                            i < _slotsModel.slots!.length;
                                            i++)
                                          InkWell(
                                            onTap: _slotsModel.bookedSlots!
                                                        .contains(_slotsModel
                                                            .slots![i]) ||
                                                    DateTime.now().isAfter(
                                                        DateTime(
                                                            selectedDay.year,
                                                            selectedDay.month,
                                                            selectedDay.day,
                                                            int.parse(
                                                                _slotsModel
                                                                    .slots![i]
                                                                    .toString()
                                                                    .split(":")
                                                                    .first),
                                                            int.parse(
                                                                _slotsModel
                                                                    .slots![i]
                                                                    .toString()
                                                                    .split(":")
                                                                    .last)))
                                                ? () {}
                                                : () {
                                                    setState(() {
                                                      selectedIndex = i;
                                                      time =
                                                          _slotsModel.slots![i];
                                                    });
                                                  },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: Chip(
                                                label: Text(
                                                  DateFormat.jm().format(
                                                      DateTime(
                                                          DateTime.now().year,
                                                          DateTime.now().month,
                                                          DateTime.now().day,
                                                          int.parse(_slotsModel
                                                              .slots![i]
                                                              .toString()
                                                              .split(":")
                                                              .first),
                                                          int.parse(_slotsModel
                                                              .slots![i]
                                                              .toString()
                                                              .split(":")
                                                              .last))),
                                                  style: selectedIndex == i
                                                      ? kManRope_400_16_white
                                                      : kManRope_400_16_1314,
                                                ),
                                                backgroundColor: _slotsModel
                                                        .bookedSlots!
                                                        .contains(_slotsModel
                                                            .slots![i])
                                                    ? Colors.grey
                                                    : selectedIndex == i
                                                        ? k006D77
                                                        : DateTime.now().isAfter(DateTime(
                                                                selectedDay
                                                                    .year,
                                                                selectedDay
                                                                    .month,
                                                                selectedDay.day,
                                                                int.parse(_slotsModel
                                                                    .slots![i]
                                                                    .toString()
                                                                    .split(":")
                                                                    .first),
                                                                int.parse(
                                                                    _slotsModel
                                                                        .slots![
                                                                            i]
                                                                        .toString()
                                                                        .split(
                                                                            ":")
                                                                        .last)))
                                                            ? Colors.grey
                                                            : Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                side: _slotsModel.bookedSlots!
                                                            .contains(
                                                                _slotsModel
                                                                        .slots![
                                                                    i]) ||
                                                        DateTime.now().isAfter(DateTime(
                                                            selectedDay.year,
                                                            selectedDay.month,
                                                            selectedDay.day,
                                                            int.parse(
                                                                _slotsModel
                                                                    .slots![i]
                                                                    .toString()
                                                                    .split(":")
                                                                    .first),
                                                            int.parse(
                                                                _slotsModel
                                                                    .slots![i]
                                                                    .toString()
                                                                    .split(":")
                                                                    .last)))
                                                    ? BorderSide.none
                                                    : BorderSide(
                                                        color: k006D77),
                                                //deleteIconColor: Color(0xFF7D7878),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                              SizedBox(height: 50),
                              if (_slotsModel.issue!.isNotEmpty)
                                Text(
                                  "Select Issue",
                                  style: kManRope_400_16_001314,
                                ),
                              SizedBox(height: 24),
                              ListView.builder(
                                itemCount: _slotsModel.issue!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return RadioListTile(
                                      contentPadding: EdgeInsets.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      title: Text(
                                        _slotsModel.issue![index].name
                                            .toString(),
                                        style: kManRope_400_14_001314,
                                      ),
                                      value: index,
                                      groupValue: value,
                                      activeColor: k006D77,
                                      onChanged: (val) {
                                        setState(() {
                                          value = int.parse(val.toString());
                                          issue = _slotsModel.issue![index].name
                                              .toString();
                                          issueId = _slotsModel
                                              .issue![index].specialitiesId
                                              .toString();
                                        });
                                        log(val.toString());
                                      });
                                },
                              )
                            ],
                          )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: _isLoading
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                height: 83.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        // height:56.h,
                        child: widget.reschedule != null
                            ? SizedBox()
                            : Text(
                                '₹${widget.psychologist.price}',
                                style: kManRope_500_20_006D77,
                              ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 56.h,
                        // width: 200,
                        child: _btnLoading
                            ? SpinKitThreeBounce(
                                color: k006D77,
                                size: 30,
                              )
                            : MainButton(
                                color: time == ''
                                    ? k006D77.withOpacity(0.16)
                                    : k006D77,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                                onPressed: time == ''
                                    ? () {}
                                    : widget.reschedule == null
                                        ? () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UConfirmAppointmentBooking(
                                                          slot: time,
                                                          bookingType: widget
                                                              .bookingType,
                                                          psychologist: widget
                                                              .psychologist,
                                                          issue: issue,
                                                          issueId: issueId,
                                                          date: date,
                                                          doctorPrice: widget
                                                              .psychologist
                                                              .price
                                                              .toString(),
                                                        )));
                                          }
                                        : () {
                                            setState(() {
                                              _btnLoading = true;
                                            });
                                            final resp = RescheduleBookingApi().get(
                                                bookingId: int.parse(
                                                    widget.reschedule!),
                                                date:
                                                    "${date.split("/").last}-${date.split("/")[1]}-${date.split("/").first}",
                                                time: time);
                                            resp.then((value) {
                                              if (value == false) {
                                                setState(() {
                                                  _btnLoading = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Reschedule failed. Please try again");
                                              } else {
                                                setState(() {
                                                  _btnLoading = false;
                                                });
                                                if (value['status'] == true) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              UBookingSuccessfulScreen(
                                                                name: widget
                                                                    .psychologist
                                                                    .name
                                                                    .toString(),
                                                                date: date,
                                                                time: DateFormat.jm().format(DateTime(
                                                                    DateTime.now()
                                                                        .year,
                                                                    DateTime.now()
                                                                        .month,
                                                                    DateTime.now()
                                                                        .day,
                                                                    int.parse(time
                                                                        .split(
                                                                            ":")
                                                                        .first),
                                                                    int.parse(time
                                                                        .split(
                                                                            ":")
                                                                        .last))),
                                                                price: widget
                                                                        .psychologist
                                                                        .price ??
                                                                    "0",
                                                                isCancellationAvailable:
                                                                    true,
                                                              )));
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: value['error']);
                                                }
                                              }
                                            });
                                          },
                                child: Text(
                                  'Book session',
                                  style: time == ''
                                      ? kManRope_400_16_Black
                                      : kManRope_400_16_white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
