import 'package:flutter/material.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';

class CardWidget extends StatelessWidget{
  final Widget child;
  // final Color color;
  // final BoxBorder? border;
  final Decoration decoration;
  CardWidget({
    Key? key,
    // required this.color,
    required this.child,
    // this.border,
    required this.decoration,

  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:decoration,
      child:child);
  }
}