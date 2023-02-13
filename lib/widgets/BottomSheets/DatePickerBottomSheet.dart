import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({Key? key}) : super(key: key);

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheet();
}

class _DatePickerBottomSheet extends State<DatePickerBottomSheet> {
  int _gIndex = 0;
  int dateSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: const BoxDecoration(
        // color: k006D77,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Pick Date',
                style: kManRope_700_20_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                // padding: EdgeInsets.all(10),
                height: 190.h,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumYear: 1950,
                    maximumYear: 2050,
                    onDateTimeChanged: (val) {
                      setState(() {
                        dateSelected = val.toString() as int;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}