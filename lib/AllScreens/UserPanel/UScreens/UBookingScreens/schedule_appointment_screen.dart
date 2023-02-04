import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/confirm_booking_screen.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  const ScheduleAppointmentScreen({Key? key, required this.issue})
      : super(key: key);
  final String issue;

  @override
  State<ScheduleAppointmentScreen> createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  bool flag = false;
  String date = '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Appointment',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),

      body: Padding(
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
              firstDay: DateTime(2023),
              lastDay: DateTime(2024),
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
            SizedBox(
              // height: 300.h,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: timeList.length,
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
            ),
            SizedBox(height: 16),
          ],
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
                    '₹599',
                    style: kManRope_500_20_006D77,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 56.h,
                  // width: 200,
                  child: MainButton(
                    color: k006D77,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmAppointmentBooking(
                                    issue: widget.issue,
                                    date: date,
                                  )));
                    },
                    child: Text(
                      'Book session',
                      style: kManRope_400_16_white,
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