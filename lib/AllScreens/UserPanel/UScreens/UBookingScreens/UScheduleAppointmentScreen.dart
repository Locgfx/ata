import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UConfirmBookingScreen.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class UScheduleAppointmentScreen extends StatefulWidget {
  final UPsychologistModel psychologist;
  const UScheduleAppointmentScreen({
    Key? key,
    required this.issue,
    required this.psychologist,
  }) : super(key: key);
  final String issue;

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
  int selectedIndex = 0;
  BoxDecoration constDecoration = const BoxDecoration(
    shape: BoxShape.rectangle,
  );

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Appointment',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),

      body: SingleChildScrollView(
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
                    print(selectDay.weekday);
                    selectedDay = selectDay;
                    weekDay = selectDay.weekday;
                    focusedDay = focusDay;
                    flag = true;
                    monthSet(selectDay.month);
                    date =
                        '${selectDay.day}/${selectDay.month}/${selectDay.year}';
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Available Slots',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              getSlotCount() == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                          child: Text(
                              'No Available Slots for the selected date.')),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: getSlotCount(),
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 34.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? k006D77
                                  : Colors.transparent,
                              border: Border.all(
                                color: k006D77,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Center(
                              child: Text(
                                timeList[index],
                                style: selectedIndex == index
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        );
                      }),
              SizedBox(height: 50),
              Text(
                "Select Issue",
                style: kManRope_400_16_001314,
              ),
              SizedBox(height: 24),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        "data",
                        style: kManRope_400_14_001314,
                      ),
                      value: index,
                      groupValue: value,
                      activeColor: k006D77,
                      onChanged: (val) {
                        setState(() {
                          value = int.parse(val.toString());
                        });
                        log(val.toString());
                      });
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          height: 83.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  // height:56.h,
                  child: Text(
                    '₹${widget.psychologist.price}',
                    style: kManRope_500_20_006D77,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 56.h,
                  // width: 200,
                  child: MainButton(
                    color: getSlotCount() == 0
                        ? k006D77.withOpacity(0.16)
                        : k006D77,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                    onPressed: () {
                      /*getSlotCount() == 0
                          ? () {}
                          : */
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UConfirmAppointmentBooking(
                                    slot: timeList[selectedIndex],
                                    psychologist: widget.psychologist,
                                    issue: widget.issue,
                                    date: date,
                                  )));
                    },
                    child: Text(
                      'Book session',
                      style: getSlotCount() == 0
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
      // bottomNavigationBar: SizedBox(
      //   height: 83.h,
      //   child: Padding(
      //     padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.w),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text(
      //           '₹230',
      //           style: kManRope_500_20_006D77,
      //         ),
      //         SizedBox(
      //           height: 56.h,
      //           width: 180.w,
      //           child: MaterialButton(
      //             color: k006D77,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10), // <-- Radius
      //             ),
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => ConfirmAppointmentBooking(
      //                             issue: widget.issue,
      //                             date: date,
      //                           )));
      //             },
      //             child: Text(
      //               'Book session',
      //               style: kManRope_400_16_white,
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
