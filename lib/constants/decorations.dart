import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  BoxDecoration outlineButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: kWhiteBGColor,
    );
  }

  ShapeBorder button16Decoration() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }

  ShapeBorder buttonDecoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }

  ShapeBorder outline16ButtonDecoration() {
    return RoundedRectangleBorder(
        side: BorderSide(color: k006D77),
        borderRadius: BorderRadius.circular(16));
  }

  ShapeBorder border10Decoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  ShapeBorder smallButtonDecoration() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(48)),
    );
  }

  ShapeBorder smallButton10Decoration() {
    return RoundedRectangleBorder(
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
  final TextStyle? hintstyle;
  final String label;
  final Widget? child;

  // final String? ImageButton;
  TextfieldDecoration({
    this.hintstyle,
    this.child,
    // this.ImageButton,
    required this.label,
  });
  InputDecoration searchFieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16,
        ),
        // hintText: 'Search for help',
        hintStyle: kManRope_400_14_626A6A,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.0)),
        fillColor: Colors.white,
        filled: true,
        suffixIconConstraints: BoxConstraints(maxHeight: 35.h, maxWidth: 35.w),
        // suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
        // border: InputBorder.none,
        hintText: label,
        // hintStyle: hintstyle!,
        // suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: child ?? SizedBox.shrink()));
  }

  // 'assets/icons/search.svg'
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

  InputDecoration underlinefieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 0,
        ),
        border: InputBorder.none,
        hintText: label,
        hintStyle: hintstyle!,
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: child ?? SizedBox.shrink()));
  }

  InputDecoration smalltextfieldDecoration() {
    return InputDecoration(
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: k006D77, width: 1)),
      hintText: label,
      hintStyle: kManRope_400_16_626A6A,
      suffixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10),
      suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: child ?? SizedBox.shrink()),
      contentPadding: EdgeInsets.only(
        left: 16,
      ),
      // filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: k006D77,
        ),
        // focusColor: kWhiteBGColor,
        // fillColor: kWhiteBGColor,
      ),
    );
  }
}
