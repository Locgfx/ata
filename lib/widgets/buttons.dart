import 'package:flutter/material.dart';
import 'package:greymatter/constants/colors.dart';

class MainButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color color;

  const MainButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: k006D77),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
