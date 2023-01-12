import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/holiday_confirm_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/fonts.dart';

class EditHolidayScreen extends StatefulWidget {
  const EditHolidayScreen({Key? key}) : super(key: key);

  @override
  State<EditHolidayScreen> createState() => _EditHolidayScreenState();
}

class _EditHolidayScreenState extends State<EditHolidayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 58.h),
        child: Row(
          children: [
            Expanded(
              child: MainButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HolidayConfirmScreen()));
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
      appBar: CusAppBar(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 175.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/iconcalender24.png",
                            height: 24.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                  Container(
                    width: 175.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/iconclock.png",
                            height: 24.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       height: 56.h,
              //       width: 182.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: k006D77),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Mon, 12, 2022',
              //               style: kManRope_400_16_626A6A,
              //             ),
              //             SvgPicture.asset(
              //               'assets/icons/calenderunselected.svg',
              //               height: 24.h,
              //               width: 24.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: 56.h,
              //       width: 182.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: k006D77),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '12:00 pm',
              //               style: kManRope_400_16_626A6A,
              //             ),
              //             SvgPicture.asset(
              //               'assets/icons/clock.svg',
              //               height: 24.h,
              //               width: 24.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Selected date & time',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 175.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/iconcalender24.png",
                            height: 24.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                  SizedBox(
                    width: 175.w,
                    height: 56.h,
                    child: TextFormField(
                      decoration: TextfieldDecoration(
                          label: 'Mon, 12, 2022',
                          child: Image.asset(
                            "assets/images/iconclock.png",
                            height: 24.h,
                          )).smalltextfieldDecoration(),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 440.h,
              ),
              // CustomActiveTextButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => HolidayConfirmScreen()));
              //     },
              //     text: 'Confirm Holiday'),
            ],
          ),
        ),
      ),
    );
  }
}
