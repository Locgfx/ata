import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class PsychologistTimingList extends StatefulWidget {
  const PsychologistTimingList({Key? key}) : super(key: key);

  @override
  State<PsychologistTimingList> createState() => _PsychologistTimingListState();
}

class _PsychologistTimingListState extends State<PsychologistTimingList> {
  List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
  List<String> timeAm = ['10:00 AM','10:00 AM','10:00 AM','10:00 AM','10:00 AM','10:00 AM',];
  List<String> timePm = ['08:00 PM','08:00 PM','08:00 PM','08:00 PM','08:00 PM','06:00 PM','06:00 PM'];
  @override
  Widget build(BuildContext context) {
    return  Container(
      // height: 202.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
          separatorBuilder: (ctx, index) {
            return SizedBox(height: 8.h);
          },
        scrollDirection: Axis.vertical,
        itemCount: day.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext, int index) {
          return Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
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
                      children: [
                        Text(
                          timeAm[index],
                          style: kManRope_400_14_626A6A,
                        ),
                        SizedBox(width: 36.w,),
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


          }
      ),
    );
  }
}
