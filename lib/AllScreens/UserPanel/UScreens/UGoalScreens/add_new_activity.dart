import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/new_activity_added_screen.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';


class AddNewActivity extends StatefulWidget {
  AddNewActivity({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
  bool _switchValue = true;
  bool goalFlag = true;
  int flag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(appBarText: 'Running', imgPath: 'assets/images/iconbackappbar2.png',),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  //color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Image.asset('assets/images/manimg.png',fit: BoxFit.cover,),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goal Type',
                      style: kManRope_500_16_001314,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              goalFlag = true;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: goalFlag ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'One time',
                                style: goalFlag
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              goalFlag = false;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: goalFlag ? Colors.white : k006D77,
                            ),
                            child: Center(
                              child: Text(
                                'Repeat',
                                style: goalFlag
                                    ? kManRope_400_14_001314
                                    : kManRope_400_14_white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goal',
                      style: kManRope_500_16_001314,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 0;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: flag == 0 ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Daily',
                                style: flag == 0
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 1;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: flag == 1 ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Mon-sat',
                                style: flag == 1
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 2;
                            });
                          },
                          child: Container(
                            height: 39.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: k006D77),
                              color: flag == 2 ? k006D77 : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Custom',
                                style: flag == 2
                                    ? kManRope_400_14_white
                                    : kManRope_400_14_001314,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Select Days',
                  style: kManRope_500_16_001314,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 42.w,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 4.w,),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 7,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 39.h,
                        width: 49.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: k006D77),
                        ),
                        child: Center(
                          child: Text(
                            weekDays[index],
                            style: kManRope_400_14_001314,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reminder',
                      style: kManRope_500_16_001314,
                    ),
                    SizedBox(
                      height: 28.h,
                      width: 54.w,
                      child: Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                          activeColor: k006D77,
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reminder time',
                      style: kManRope_500_16_001314,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: kE2F2F4,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10.2,right: 37.w),
                        child: Text(
                          '06:00 am',
                          style: kManRope_400_14_001314,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 46.h,
              ),
              Center(
                child: MainButton(
                    onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewActivityAddedScreen()));
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(top: 20.h,bottom: 20.h,left: 50.w,right: 50.w),
                      child: Text("ADD",style: kManRope_500_16_white,),
                    ),
                    color: k006D77,
                    shape: CustomDecoration().smallButton10Decoration()),
              ),
              SizedBox(height: 40.h,)
              // Center(
              //   child: SizedBox(
              //     height: 56,
              //     width: 132.w,
              //     child: MaterialButton(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => NewActivityAddedScreen()));
              //       },
              //       color: k006D77,
              //       child: Center(
              //         child: Text(
              //           'ADD',
              //           style: kManRope_500_16_white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
