import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class DatePickerBottomSheet extends StatefulWidget {
  final Function(String) onPop;
  const DatePickerBottomSheet({Key? key, required this.onPop})
      : super(key: key);

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheet();
}

class _DatePickerBottomSheet extends State<DatePickerBottomSheet> {
  int _gIndex = 0;
  int dateSelected = 0;
  DateTime selectedDate = DateTime.now();
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
                    maximumYear: DateTime.now().year,
                    onDateTimeChanged: (val) {
                      setState(() {
                        selectedDate = val;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.onPop(selectedDate.toString());
    super.dispose();
  }
}
