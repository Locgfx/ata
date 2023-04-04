import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:intl/intl.dart';

class PsychologistTimingList extends StatefulWidget {
  final Availability availability;
  const PsychologistTimingList({Key? key, required this.availability})
      : super(key: key);

  @override
  State<PsychologistTimingList> createState() => _PsychologistTimingListState();
}

class _PsychologistTimingListState extends State<PsychologistTimingList> {
  List<String> day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String> timeAm = [];
  List<String> timePm = [];

  createTimeList() {
    if (widget.availability.monday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.monday.split('-').first.split(":").first),
          int.parse(
              widget.availability.monday.split('-').first.split(":").last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.tuesday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.tuesday.split('-').first.split(":").first),
          int.parse(
              widget.availability.tuesday.split('-').first.split(":").last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.wednesday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.wednesday.split('-').first.split(":").first),
          int.parse(widget.availability.wednesday
              .split('-')
              .first
              .split(":")
              .last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.thursday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.thursday.split('-').first.split(":").first),
          int.parse(
              widget.availability.thursday.split('-').first.split(":").last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.friday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.friday.split('-').first.split(":").first),
          int.parse(
              widget.availability.friday.split('-').first.split(":").last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.saturday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.saturday.split('-').first.split(":").first),
          int.parse(
              widget.availability.saturday.split('-').first.split(":").last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.sunday.toString() != "") {
      timeAm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.sunday.split('-').first.split(":").first),
          int.parse(
              widget.availability.sunday.split('-').first.split(":").last))));
    } else {
      timeAm.add("");
    }
    if (widget.availability.monday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.monday.split('-').last.split(":").first),
          int.parse(
              widget.availability.monday.split('-').first.split(":").last))));
    } else {
      timePm.add("");
    }
    if (widget.availability.tuesday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.tuesday.split('-').last.split(":").first),
          int.parse(
              widget.availability.tuesday.split('-').first.split(":").last))));
    } else {
      timePm.add("");
    }
    if (widget.availability.wednesday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.wednesday.split('-').last.split(":").first),
          int.parse(widget.availability.wednesday
              .split('-')
              .first
              .split(":")
              .last))));
    } else {
      timePm.add("");
    }
    if (widget.availability.thursday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.thursday.split('-').last.split(":").first),
          int.parse(
              widget.availability.thursday.split('-').first.split(":").last))));
    } else {
      timePm.add("");
    }
    if (widget.availability.friday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.friday.split('-').last.split(":").first),
          int.parse(
              widget.availability.friday.split('-').first.split(":").last))));
    } else {
      timePm.add("");
    }
    if (widget.availability.saturday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.saturday.split('-').last.split(":").first),
          int.parse(
              widget.availability.saturday.split('-').first.split(":").last))));
    } else {
      timePm.add("");
    }
    if (widget.availability.sunday.toString() != "") {
      timePm.add(DateFormat.jm().format(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          int.parse(
              widget.availability.sunday.split('-').last.split(":").first),
          int.parse(
              widget.availability.sunday.split('-').first.split(":").last))));
    } else {
      timePm.add("");
    }
  }

  @override
  void initState() {
    createTimeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        separatorBuilder: (ctx, index) {
          return SizedBox(height: 8.h);
        },
        scrollDirection: Axis.vertical,
        itemCount: day.length,
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 90.w,
                      // height:14.h,
                      child: Text(
                        day[index],
                        style: kManRope_400_14_626A6A,
                      ),
                    ),
                    // SizedBox(width: 26.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          timeAm[index] == "" ? "Off" : timeAm[index],
                          style: kManRope_400_14_626A6A,
                        ),
                        SizedBox(width: 36.w),
                        Text(
                          timePm[index] == "" ? "" : timePm[index],
                          style: kManRope_400_14_626A6A,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
