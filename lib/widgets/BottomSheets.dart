import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class SelectGenderBottomSheet extends StatefulWidget {
  const SelectGenderBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectGenderBottomSheet> createState() => _SelectGenderBottomSheet();
}

class _SelectGenderBottomSheet extends State<SelectGenderBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          // color: k006D77,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        // height: 259.h,
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
                child:  Text(
                  'Select Gender',
                  style: kManRope_700_20_white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              // decoration: const BoxDecoration(
              //   color: k006D77,
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              // ),
              // height: 188.h,
              padding: EdgeInsets.only(top: 20.h),
              // margin: EdgeInsets.only(
              //   bottom: MediaQuery.of(context).viewInsets.bottom,
              // ),
              // color: CupertinoColors.systemBackground.resolveFrom(context),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
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
                        'Male',
                        style: _gIndex == 0
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 1;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 215.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 1 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                        'Female',
                        style: _gIndex == 1
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 2;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 215.w,
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
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectDesignationBottomSheet extends StatefulWidget {
  const SelectDesignationBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectDesignationBottomSheet> createState() =>
      _SelectDesignationBottomSheet();
}

class _SelectDesignationBottomSheet extends State<SelectDesignationBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                  'Select Designation',
                  style: kManRope_700_20_white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              // height: 188.h,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          _gIndex = 0;
                          Navigator.of(context).pop();
                        }),
                        child: Container(
                          height: 44.h,
                          width: 123.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: _gIndex == 0 ? k006D77 : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            'Counselor',
                            style: _gIndex == 0
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      GestureDetector(
                        onTap: () => setState(() {
                          _gIndex = 1;
                          Navigator.of(context).pop();
                        }),
                        child: Container(
                          height: 44.h,
                          width: 123.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: _gIndex == 1 ? k006D77 : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            'Physiatrist',
                            style: _gIndex == 1
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      GestureDetector(
                        onTap: () => setState(() {
                          _gIndex = 2;
                          Navigator.of(context).pop();
                        }),
                        child: Container(
                          height: 44.h,
                          width: 123.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: _gIndex == 2 ? k006D77 : Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            'Psychologist',
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
          ],
        ),
      ),
    );
  }
}

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
              Container(
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

class _SpecializationBottomSheet extends State<SpecializationBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 675.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 46.w),
              child: Center(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      'Select Designation',
                      style: kManRope_700_20_white,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 188.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          'Counselor',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          'Physiatrist',
                          style: _gIndex == 1
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 2;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 2 ? k006D77 : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          'Psychologist',
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
        ],
      ),
    );
  }
}

class SpecializationBottomSheet extends StatefulWidget {
  const SpecializationBottomSheet({Key? key}) : super(key: key);

  @override
  State<SpecializationBottomSheet> createState() =>
      _SpecializationBottomSheetState();
}

class _SpecializationBottomSheetState extends State<SpecializationBottomSheet> {
  final List<String> data = [
    'Anxiety',
    'Relationship Issue',
    'Suicidal Ideation',
    'Grief & Loss',
    'Anxiety',
    'Depression','Stress',
    'OCD','Grief','Anger',
  ];

  final List<String> languages = [
    'Hindi',
    'English',
    'Tamil',
    'Sanskrit',
    'Marathi',
    'Punjabi',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                  'Select Specialization',
                  style: kManRope_700_16_white,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 140.w),
              child: SizedBox(
                height: 280.h,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/box.svg',
                            height: 24.h,
                            width: 24.w,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            data[index],
                            style: kManRope_400_16_626A6A,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h,bottom: 20),
              child: Center(
                child: MainButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 63.h, vertical: 15.h),
                    child: Text(
                      "Done",
                      style: kManRope_500_18_FFFFF,
                    ),
                  ),
                  color: k006D77,
                  shape: CustomDecoration().smallButtonDecoration(),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  final List<String> languages = [
    'Hindi',
    'English',
    'Tamil',
    'Sanskrit',
    'Marathi',
    'Punjabi',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 428.h,
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
                'Select Language',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 236.h,
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h,left: 140.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/box.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        languages[index],
                        style: kManRope_400_16_626A6A,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              // height: 56.h,
              // width: 168.w,
              child: Center(
                child: MainButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 63.h, vertical: 15.h),
                    child: Text(
                      "Done",
                      style: kManRope_500_18_FFFFF,
                    ),
                  ),
                  color: k006D77,
                  shape: CustomDecoration().smallButtonDecoration(),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountNumberBottomSheet extends StatefulWidget {
  const AccountNumberBottomSheet({Key? key}) : super(key: key);

  @override
  State<AccountNumberBottomSheet> createState() => _AccountNumberBottomSheet();
}

class _AccountNumberBottomSheet extends State<AccountNumberBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        // color: k006D77,
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(40), topRight: Radius.circular(40)),   // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      height: 207.h,
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
                'Select Account',
                style: kManRope_700_16_white,
              ),
              // child: Row(
              //   children: [
              //     // GestureDetector(
              //     //   onTap: () => Navigator.of(context).pop(),
              //     //   child: Icon(
              //     //     Icons.arrow_back_ios,
              //     //     color: Colors.white,
              //     //     size: 20.sp,
              //     //   ),
              //     // ),
              //     // SizedBox(
              //     //   width: 50.w,
              //     // ),
              //
              //   ],
              // ),
            ),
          ),
          Container(
            height: 136.h,
            padding: const EdgeInsets.only(top: 20.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 215.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 0 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                        '1 2 3 4 5 6 7 8 9 1 2 3 1 4',
                        style: _gIndex == 0
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 1;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 215.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 1 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                        '1 2 3 4 5 6 7 8 9 1 2 3 1 4',
                        style: _gIndex == 1
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalenderBottomSheet extends StatefulWidget {
  const CalenderBottomSheet({Key? key}) : super(key: key);

  @override
  State<CalenderBottomSheet> createState() => _CalenderBottomSheet();
}

class _CalenderBottomSheet extends State<CalenderBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 280.h,
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
              child: Text(
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            // height: 200.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 :Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'This Month',
                              style: _gIndex == 0
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 50.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'This Week',
                              style: _gIndex == 1
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'This Year',
                              style: _gIndex == 1
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
        ],
      ),
    );
  }
}


class HistoryFilterBottomSheet extends StatefulWidget {
  const HistoryFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<HistoryFilterBottomSheet> createState() => _HistoryFilterBottomSheet();
}

class _HistoryFilterBottomSheet extends State<HistoryFilterBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 170.h,
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
                'Cancel Meeting',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            // height: 120.h,
            padding:EdgeInsets.only(top: 20.h),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 0;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 215.w,
                    decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Cancel Meeting',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),

                SizedBox(height: 20.h),
                // GestureDetector(
                //   onTap: () => setState(() {
                //     _gIndex = 1;
                //     Navigator.of(context).pop();
                //   }),
                //   child: Container(
                //     height: 50.h,
                //     width: 215.w,
                //     decoration: BoxDecoration(
                //       borderRadius:
                //       const BorderRadius.all(Radius.circular(5)),
                //       color: _gIndex == 1 ? k006D77 : Colors.transparent,
                //     ),
                //     child: Center(
                //         child: Text(
                //           'This Week',
                //           style: _gIndex == 1
                //               ? kManRope_500_16_white
                //               : kManRope_500_16_626A6A,
                //         )),
                //   ),
                // ),
                // SizedBox(height: 8.h),
                // GestureDetector(
                //   onTap: () => setState(() {
                //     _gIndex = 1;
                //     Navigator.of(context).pop();
                //   }),
                //   child: Container(
                //     height: 44.h,
                //     width: 215.w,
                //     decoration: BoxDecoration(
                //       borderRadius:
                //       const BorderRadius.all(Radius.circular(5)),
                //       color: _gIndex == 1 ? k006D77 : Colors.transparent,
                //     ),
                //     child: Center(
                //         child: Text(
                //           'This Year',
                //           style: _gIndex == 1
                //               ? kManRope_500_16_white
                //               : kManRope_500_16_626A6A,
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







class PostBottomSheet extends StatefulWidget {
  const PostBottomSheet({Key? key}) : super(key: key);

  @override
  State<PostBottomSheet> createState() => _PostBottomSheet();
}

class _PostBottomSheet extends State<PostBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 310.h,
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
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            // height: 240.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                              'Share',
                              style: _gIndex == 0
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 50.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'Save',
                              style: _gIndex == 1
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'Hide',
                              style: _gIndex == 1
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 215.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'Report',
                              style: _gIndex == 1
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
        ],
      ),
    );
  }
}


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheet();
}

class _FilterBottomSheet extends State<FilterBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 271.h,
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
              child: Text(
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            // height: 200.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 215.w,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 0 ? k006D77 : Colors.white,
                      ),
                      child: Center(
                          child: Text(
                            'one week',
                            style: _gIndex == 0
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 1;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 50.h,
                      width: 215.w,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 1 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'one month',
                            style: _gIndex == 1
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 2;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 215.w,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 2 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'one year',
                            style: _gIndex == 2
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // GestureDetector(
                  //   onTap: () => setState(() {
                  //     _gIndex = 1;
                  //     Navigator.of(context).pop();
                  //   }),
                  //   child: Container(
                  //     height: 44.h,
                  //     width: 215.w,
                  //     decoration: BoxDecoration(
                  //       borderRadius:
                  //       const BorderRadius.all(Radius.circular(5)),
                  //       color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  //     ),
                  //     child: Center(
                  //         child: Text(
                  //           'Report',
                  //           style: _gIndex == 1
                  //               ? kManRope_500_16_white
                  //               : kManRope_500_16_626A6A,
                  //         )),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CancelBottomSheet extends StatefulWidget {
  const CancelBottomSheet({Key? key}) : super(key: key);

  @override
  State<CancelBottomSheet> createState() =>
      _CancelBottomSheet();
}

class _CancelBottomSheet extends State<CancelBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: k006D77,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: 259.h,
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
                'Select Designation',
                style: kManRope_700_20_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 188.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 0;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 123.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 0 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'Counselor',
                              style: _gIndex == 0
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 1;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 123.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 1 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'Physiatrist',
                              style: _gIndex == 1
                                  ? kManRope_500_16_white
                                  : kManRope_500_16_626A6A,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _gIndex = 2;
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 44.h,
                        width: 123.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          color: _gIndex == 2 ? k006D77 : Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                              'Psychologist',
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
        ],
      ),
    );
  }
}