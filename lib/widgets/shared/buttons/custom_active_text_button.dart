import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';

import '../../../constants/fonts.dart';

class CustomActiveTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? bColor;
  final TextStyle? tColor;
  const CustomActiveTextButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.bColor,
      this.tColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            height: 56.h,
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: tColor ?? kManRope_500_16_white,
                ),
              ],
            ),
            color: bColor ?? k006D77,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // <-- Radius
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSmallActiveTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomSmallActiveTextButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        height: 56.h,
        minWidth: 168.w,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: kManRope_500_16_white,
            ),
          ],
        ),
        color: k006D77,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48), // <-- Radius
        ),
      ),
    );
  }
}

class CustomActiveTextButton1 extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomActiveTextButton1(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            height: 56,
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: kManRope_500_16_white,
                ),
              ],
            ),
            color: k006D77,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48), // <-- Radius
            ),
          ),
        ),
      ],
    );
  }
}
