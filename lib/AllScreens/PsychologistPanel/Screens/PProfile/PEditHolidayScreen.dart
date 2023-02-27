import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PHolidayConfirmScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UFiltersPage.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddNewActivityScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/popupdialogs.dart';

import '../../../../constants/fonts.dart';

class PEditHolidayScreen extends StatefulWidget {
  const PEditHolidayScreen({Key? key}) : super(key: key);

  @override
  State<PEditHolidayScreen> createState() => _PEditHolidayScreenState();
}

class _PEditHolidayScreenState extends State<PEditHolidayScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 58.h),
        child: Row(
          children: [
            Expanded(
              child: MainButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PHolidayConfirmScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                    ),
                    child: Text(
                      "Confirm Holiday",
                      style: kManRope_500_16_white,
                    ),
                  ),
                  color: k006D77,
                  shape: CustomDecoration().button16Decoration()),
            ),
          ],
        ),
      ),
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Slots Availability',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected date & time',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      // width: 175.w,
                      height: 56.h,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          if (Platform.isIOS) {
                            showDialog(
                              context: context,
                              builder: (_) => AppDatePickerWhole(),
                            );
                          } else {
                            _showCalender();
                          }
                        },
                        decoration: TextfieldDecoration(
                            label: 'Start date',
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
                          if (Platform.isIOS) {
                            showDialog(
                              context: context,
                              builder: (_) => TimePickerApp(
                                dateTime: DateTime.now(),
                              ),
                            );
                          } else {
                            _showTimepicker();
                          }
                        },
                        decoration: TextfieldDecoration(
                            label: 'Start time',
                            child: Image.asset(
                              "assets/images/iconclocknew.png",
                              height: 24.h,
                              width: 24.w,
                            )).smalltextfieldDecoration(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Text(
                'Selected date & time',
                style: kManRope_500_16_001314,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      // width: 175.w,
                      height: 56.h,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          if (Platform.isIOS) {
                            showDialog(
                              context: context,
                              builder: (_) => AppDatePickerWhole(),
                            );
                          } else {
                            _showCalender();
                          }
                        },
                        decoration: TextfieldDecoration(
                            label: 'End Date',
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
                        onTap: () {
                          if (Platform.isIOS) {
                            showDialog(
                              context: context,
                              builder: (_) => TimePickerApp(
                                dateTime: DateTime.now(),
                              ),
                            );
                          } else {
                            _showTimepicker();
                          }
                        },
                        decoration: TextfieldDecoration(
                            label: 'End Time',
                            child: Image.asset(
                              "assets/images/iconclock.png",
                              height: 24.h,
                            )).smalltextfieldDecoration(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
