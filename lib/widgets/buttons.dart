import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';

class MainButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color color;
  final ShapeBorder shape;
  // final EdgeInsets? padding;

  const MainButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
    required this.shape,
    // this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      // padding: padding!,
      onPressed: onPressed,
      child: child,
      color: color,
      shape: shape,
    );
  }
}

class RoundedSmallButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color color;
  final ShapeBorder shape;

  const RoundedSmallButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
    required this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      color: color,
      shape: shape,
    );
  }
}

class BottomSmallButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  // final Widget child;
  // final Color color;
  // final ShapeBorder shape;

  const BottomSmallButton({
    Key? key,
    required this.onPressed,
    required this.text,
    // required this.child,
    // required this.color,
    // required this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 120.w, right: 120.w, bottom: 40),
      child: MaterialButton(
        elevation: 0,
        color: k006D77,
        // height: 60,
        // minWidth: 168,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
          side: const BorderSide(color: k006D77),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          child: Text(
            text,
            style: kManRope_400_16_white,
          ),
        ),
      ),
    );
  }
}

class RoundedBottomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const RoundedBottomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 130.w, right: 130.w, bottom: 52.h),
      child: MainButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 14),
            child: Text(
              text,
              style: kManRope_500_16_white,
            ),
          ),
          color: k006D77,
          shape: CustomDecoration().smallButtonDecoration()),
    );
  }
}
