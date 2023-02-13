import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

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
                style: kManRope_700_20_white,
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
                  padding: EdgeInsets.only(bottom: 16.h, left: 140.w),
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
          ),
        ],
      ),
    );
  }
}