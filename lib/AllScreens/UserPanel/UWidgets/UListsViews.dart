import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';

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
    timeAm.add(widget.availability.monday.split('-').first);
    timeAm.add(widget.availability.tuesday.split('-').first);
    timeAm.add(widget.availability.wednesday.split('-').first);
    timeAm.add(widget.availability.thursday.split('-').first);
    timeAm.add(widget.availability.friday.split('-').first);
    timeAm.add(widget.availability.saturday.split('-').first);
    timeAm.add('');
    timePm.add(widget.availability.monday.split('-').last);
    timePm.add(widget.availability.tuesday.split('-').last);
    timePm.add(widget.availability.wednesday.split('-').last);
    timePm.add(widget.availability.thursday.split('-').last);
    timePm.add(widget.availability.friday.split('-').last);
    timePm.add(widget.availability.saturday.split('-').last);
    timePm.add(widget.availability.sunday.split('-').last);
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
                          timeAm[index],
                          style: kManRope_400_14_626A6A,
                        ),
                        SizedBox(width: 36.w),
                        Text(
                          timePm[index],
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
