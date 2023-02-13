import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

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
    'Depression',
    'Stress',
    'OCD',
    'Grief',
    'Anger',
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
                style: kManRope_700_20_white,
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
            padding: EdgeInsets.only(top: 10.h, bottom: 20),
            child: Center(
              child: MainButton(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 63.h, vertical: 15.h),
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
    );
  }
}
