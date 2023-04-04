import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class UInfo extends StatelessWidget {
  const UInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: k006D77,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png', width: 32.w, height: 44.h),
              SizedBox(width: 8.w),
              Text(
                'Atar',
                style: kManRope_400_20_White,
              ),
              Text(
                'axis',
                style: kManRope_700_20_white,
              )
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Our vision is to help mankind live healthier, longer lives by making quality healthcare accessible, and affordable',
            style: kManRope_400_20_White07,
          ),
          SizedBox(height: 16.h),
          Text(
            "Made by Locgfx @ Delhi.",
            style: kManRope_400_14_white.copyWith(
                color: Colors.white.withOpacity(0.48)),
          ),
        ],
      ),
    );
  }
}
