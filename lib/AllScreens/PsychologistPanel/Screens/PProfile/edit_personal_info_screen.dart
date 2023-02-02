import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  DateTime date = DateTime(2016, 10, 26);

  void _showDialog(Widget child) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8), topLeft: Radius.circular(8)),
      ),
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 325.h,
        child: Column(
          children: [
            Container(
              height: 71.h,
              decoration: const BoxDecoration(
                color: k006D77,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: 107.w,
                    ),*/
                    Text(
                      'Select Date',
                      style: kManRope_700_20_white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 190.h,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ),
            /*CupertinoButton(
              child: Text(
                'OK',
                style: kManRope_500_16_006D77,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),*/
          ],
        ),
      ),
    );
  }

  void _selectGender() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (BuildContext context) => const GenderBottomSheet());
  }

  void _selectRelationshipStatus() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const RelationshipBottomSheet());
  }

  void _selectOccupation() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const OccupationBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 50.w,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          'Account',
          style: kManRope_500_16_006D77,
        ),
        titleSpacing: 18.w,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DottedBorder(
                          color: k006D77,
                          strokeWidth: 1,
                          borderType: BorderType.Circle,
                          child: Container(
                            height: 102,
                            width: 102,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset('assets/images/userP.png'),
                          ),
                          /*Container(
                            height: 106.h,
                            width: 106.w,
                            decoration: const BoxDecoration(
                                color: Color(0xFF006D77), shape: BoxShape.circle),
                          ),*/
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Change Photo",
                      style: kManRope_500_16_404040,
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 43,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: kManRope_400_16_626A6A,
                      ),
                      SvgPicture.asset(
                        'assets/icons/edit.svg',
                        height: 24.w,
                        width: 24.w,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Priya Singh',
                      hintStyle: kManRope_400_16_001314,
                    ),
                    style: kManRope_400_16_001314,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 380,
                  color: kB5BABA,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date of birth',
                      style: kManRope_400_16_626A6A,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showDialog(
                          CupertinoTheme(
                            data: CupertinoThemeData(
                              textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle: kManRope_500_20_006D77,
                              ),
                            ),
                            child: CupertinoDatePicker(
                              //dateOrder:DatePickerDateOrder. ,
                              initialDateTime: date,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => date = newDate);
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            left: 19, right: 19, top: 11, bottom: 11),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/downArrow.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "25/ 02/1993",
                  style: kManRope_400_16_001314,
                ),
                /*SizedBox(
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(

                      border: InputBorder.none,
                      hintText: '25/ 02/1993',
                      hintStyle: kManRope_400_16_001314,
                    ),
                    style: kManRope_400_16_001314,
                  ),
                ),*/
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 380,
                  color: kB5BABA,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gender',
                      style: kManRope_400_16_626A6A,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectGender();
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            left: 19, right: 19, top: 11, bottom: 11),
                        child: SvgPicture.asset(
                          'assets/icons/downArrow.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Female",
                  style: kManRope_400_16_001314,
                ),
                /*SizedBox(
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Female',
                      hintStyle: kManRope_400_16_001314,
                    ),
                    style: kManRope_400_16_001314,
                  ),
                ),*/
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 380,
                  color: kB5BABA,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Relationship status',
                      style: kManRope_400_16_626A6A,
                    ),
                    GestureDetector(
                      onTap: () => _selectRelationshipStatus(),
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            left: 19, right: 19, top: 11, bottom: 11),
                        child: SvgPicture.asset(
                          'assets/icons/downArrow.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Single",
                  style: kManRope_400_16_001314,
                ),
                /* SizedBox(
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Single',
                      hintStyle: kManRope_400_16_001314,
                    ),
                    style: kManRope_400_16_001314,
                  ),
                ),*/
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 380,
                  color: kB5BABA,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Occupation',
                      style: kManRope_400_16_626A6A,
                    ),
                    GestureDetector(
                      onTap: () => _selectOccupation(),
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            left: 19, right: 19, top: 11, bottom: 11),
                        child: SvgPicture.asset(
                          'assets/icons/downArrow.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Student",
                  style: kManRope_400_16_001314,
                ),
                /*SizedBox(
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Student',
                      hintStyle: kManRope_400_16_001314,
                    ),
                    style: kManRope_400_16_001314,
                  ),
                ),*/
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.5.h,
                  width: 380,
                  color: kB5BABA,
                ),
                SizedBox(
                  height: 52.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 56.h,
                      width: 168.w,
                      child: MaterialButton(
                        color: k006D77,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48), // <-- Radius
                        ),
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: kManRope_400_16_white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderBottomSheet extends StatefulWidget {
  const GenderBottomSheet({Key? key}) : super(key: key);

  @override
  State<GenderBottomSheet> createState() => _GenderBottomSheetState();
}

class _GenderBottomSheetState extends State<GenderBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 107.w,
                  ),*/
                  Text(
                    'Select Gender',
                    style: kManRope_700_20_white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 220.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Female',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Male',
                          style: _gIndex == 1
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 2;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 2 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Others',
                          style: _gIndex == 2
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* CupertinoButton(
            child: Text(
              'OK',
              style: kManRope_500_16_006D77,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),*/
        ],
      ),
    );
  }
}

class RelationshipBottomSheet extends StatefulWidget {
  const RelationshipBottomSheet({Key? key}) : super(key: key);

  @override
  State<RelationshipBottomSheet> createState() =>
      _RelationshipBottomSheetState();
}

class _RelationshipBottomSheetState extends State<RelationshipBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),*/
                  Text(
                    'Select Relationship status',
                    style: kManRope_700_20_white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 210.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Single',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Married',
                          style: _gIndex == 1
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 2;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 2 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Others',
                          style: _gIndex == 2
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* CupertinoButton(
            child: Text(
              'OK',
              style: kManRope_500_16_006D77,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),*/
        ],
      ),
    );
  }
}

class OccupationBottomSheet extends StatefulWidget {
  const OccupationBottomSheet({Key? key}) : super(key: key);

  @override
  State<OccupationBottomSheet> createState() => _OccupationBottomSheetState();
}

class _OccupationBottomSheetState extends State<OccupationBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),*/
                  Text(
                    'Select Occupation',
                    style: kManRope_700_20_white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 220.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Student',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Working',
                          style: _gIndex == 1
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 2;
                      }),
                      child: Container(
                        height: 44.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 2 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Others',
                          style: _gIndex == 2
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*CupertinoButton(
            child: Text(
              'OK',
              style: kManRope_500_16_006D77,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),*/
        ],
      ),
    );
  }
}
