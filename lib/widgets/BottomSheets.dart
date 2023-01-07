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
    return SizedBox(
      height: 259.h,
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
                      'Select Gender',
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
                          'Male',
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
                          'Female',
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
        ],
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

class _SelectDesignationBottomSheet
    extends State<SelectDesignationBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 259.h,
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

// class DatePickerBottomSheet extends StatefulWidget {
//   const DatePickerBottomSheet({Key? key}) : super(key: key);
//
//   @override
//   State<DatePickerBottomSheet> createState() => _DatePickerBottomSheet();
// }
//
// class _DatePickerBottomSheet extends State<DatePickerBottomSheet> {
//   int _gIndex = 0;
//   int dateSelected = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 259.h,
//       child: Column(
//         children: [
//           Container(
//             height: 71.h,
//             decoration: const BoxDecoration(
//               color: k006D77,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(8), topRight: Radius.circular(8)),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(left: 46.w),
//               child: Center(
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.of(context).pop(),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                         size: 20.sp,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 60.w,
//                     ),
//                     Text(
//                       'Select Gender',
//                       style: kManRope_700_20_white,
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 190.h,
//             color: Color.fromARGB(255, 255, 255, 255),
//             child: Column(
//               children: [
//                 Container(
//                   // padding: EdgeInsets.all(10),
//                   height: 190.h,
//                   child: CupertinoDatePicker(
//                       mode: CupertinoDatePickerMode.date,
//                       minimumYear: 1980,
//                       maximumYear: 2023,
//                       onDateTimeChanged: (val) {
//                         setState(() {
//                           dateSelected = val.toString() as int;
//                         });
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
    'Depression'
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
    return SizedBox(
      height: 428.h,
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
                      width: 71.w,
                    ),
                    Text(
                      'Select Specialization',
                      style: kManRope_700_16_white,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          Center(
            child: MainButton(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 63, vertical: 15),
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
        ],
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
                      width: 80.w,
                    ),
                    Text(
                      'Select Language',
                      style: kManRope_700_16_white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 140.w),
            child: SizedBox(
              height: 280.h,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: languages.length,
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
                          languages[index],
                          style: kManRope_400_16_626A6A,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: MainButton(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 63, vertical: 15),
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
    return SizedBox(
      height: 207.h,
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
                      width: 50.w,
                    ),
                    Text(
                      'Select Designation',
                      style: kManRope_700_16_white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 136.h,
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
                          '1 2 3 4 5 6 7 8 9 1 2 3 1 4',
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
          ),
        ],
      ),
    );
  }
}