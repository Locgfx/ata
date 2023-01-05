import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greymatter/constants/fonts.dart';

import 'colors.dart';

class CustomDecoration {
  BoxDecoration containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: kWhiteBGColor,
    );
  }

  BoxDecoration containerkE2F2F4() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: kWhiteBGColor,
    );
  }

  BoxDecoration radius16Decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: kWhiteBGColor,
    );
  }

  ShapeBorder buttonDecoration() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }

  ShapeBorder borderDecoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  BoxDecoration topCircularRadius() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      color: Colors.white,
    );
  }
}

class TextfieldDecoration {
  final String label;
  final Widget? child;

  // final String? ImageButton;
  TextfieldDecoration({
    this.child,
    // this.ImageButton,
    required this.label,
  });

  InputDecoration textfieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusColor: kWhiteBGColor,
        fillColor: kWhiteBGColor,
        hintText: label,
        hintStyle: kManRope_400_14_626A6A,
        suffixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: child ?? SizedBox.shrink()));
  }
}
