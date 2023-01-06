import 'package:flutter/material.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class MainButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color color;
  final ShapeBorder shape;

  const MainButton({
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
      padding: EdgeInsets.only(left: 100, right: 100, bottom: 40),
      child: MaterialButton(
        color: k006D77,
        height: 60,
        minWidth: 168,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
          side: const BorderSide(color: k006D77),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: kManRope_400_16_white,
        ),
      ),
    );
  }
}
