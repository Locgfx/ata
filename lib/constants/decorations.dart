import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/fonts.dart';

import 'colors.dart';

class CustomDecoration {
  BoxDecoration containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: kEDF6F9,
    );
  }

  BoxDecoration top50containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      color: kFFFFFF,
    );
  }

  BoxDecoration outline5A72EDDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: k5A72ED.withOpacity(0.24)));
  }

  BoxDecoration outlineC7C7C7DDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      border: Border.all(color: kC7C7C7),
    );
  }

  BoxDecoration card20Edf6Decoration() {
    return BoxDecoration(
      color: kEDF6F9,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kFFFFFF),
    );
  }

  BoxDecoration card24Edf6Decoration() {
    return BoxDecoration(
      color: kEDF6F9,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 16,
          spreadRadius: -10,
        ),
      ],
      border: Border.all(color: kFFFFFF),
    );
  }

  BoxDecoration card20Decoration() {
    return BoxDecoration(
      color: kFFFFFF,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kFFFFFF),
    );
  }

  BoxDecoration cardWhite24Decoration() {
    return BoxDecoration(
      color: kFFFFFF,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kFFFFFF),
    );
  }

  BoxDecoration containerkE2F2F4() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: kEDF6F9,
    );
  }

  BoxDecoration radius16Decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: kEDF6F9,
    );
  }

  BoxDecoration outlineButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: kEDF6F9,
    );
  }

  // ShapeBorder outlineButton10Decoration() {
  //   return RoundedRectangleBorder(
  //     side: BorderSide(color: k006D77,),
  //     borderRadius: BorderRadius.all(Radius.circular(10)),
  //   );
  // }

  ShapeBorder button16Decoration() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }

  ShapeBorder button08Decoration() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(08)),
    );
  }

  ShapeBorder buttonDecoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }

  ShapeBorder button10outlineDecoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  ShapeBorder button10BC5656outlineDecoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: kBC5656),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  ShapeBorder outline16ButtonDecoration() {
    return RoundedRectangleBorder(
        side: BorderSide(color: k006D77, width: 1),
        borderRadius: BorderRadius.circular(16));
  }

  ShapeBorder border10Decoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  ShapeBorder border16Decoration() {
    return RoundedRectangleBorder(
      side: BorderSide(color: k006D77),
      borderRadius: BorderRadius.all(Radius.circular(16)),
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
  final double radius;
  final Color fillColor;

  // final String? ImageButton;
  TextfieldDecoration({
    this.hintstyle,
    this.child,
    this.radius = 16,
    this.fillColor = Colors.white,
    // this.ImageButton,
    required this.label,
  });
  InputDecoration searchFieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        // hintText: 'Search for help',
        hintStyle: kManRope_400_14_626A6A,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius)),
        fillColor: fillColor,
        filled: true,
        suffixIconConstraints: BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),
        // suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
        // border: InputBorder.none,
        hintText: label,
        // hintStyle: hintstyle!,
        // suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: child ?? SizedBox.shrink()));
  }

  InputDecoration searchFieldBigIconDecoration() {
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
        suffixIconConstraints: BoxConstraints(maxHeight: 50.h, maxWidth: 50.w),
        // suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
        // border: InputBorder.none,
        hintText: label,
        // hintStyle: hintstyle!,
        // suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: child ?? SizedBox.shrink());
  }

  InputDecoration searchFieldOutlineDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(left: 16, right: 16),
        // hintText: 'Search for help',
        hintStyle: kManRope_400_14_626A6A,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.0)),
        fillColor: Colors.transparent,
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

  InputDecoration whiteColorSearchField(Function onTap) {
    return InputDecoration(
      hintText: label,
      hintStyle: kManRope_400_14_626A6A,
      contentPadding: EdgeInsets.only(left: 16),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16.0)),
      fillColor: Colors.white,
      filled: true,
      suffixIconConstraints: BoxConstraints(maxHeight: 55.h, maxWidth: 55.w),
      suffixIcon: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            color: Colors.transparent,
            child: Image.asset(
              'assets/images/iconsearchblue.png',
              height: 48,
              width: 48,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textfieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        focusColor: kEDF6F9,
        fillColor: fillColor,
        hintText: label,
        hintStyle: kManRope_400_14_626A6A,
        suffixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10),
        suffixIcon: child ?? SizedBox.shrink());
  }

  InputDecoration textFieldEDF6F9Decoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
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
        focusColor: kEDF6F9,
        fillColor: kEDF6F9,
        hintText: label,
        hintStyle: kManRope_400_14_626A6A,
        suffixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10),
        suffixIcon: child ?? SizedBox.shrink());
  }

  InputDecoration textfielde2f2f4Decoration() {
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
        focusColor: kEDF6F9,
        fillColor: kE2F2F4,
        hintText: label,
        hintStyle: kManRope_400_14_001314,
        suffixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10),
        suffixIcon: child ?? SizedBox.shrink());
  }

  InputDecoration textfieldProfileDecoration() {
    return InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.only(
          bottom: 10,
        ),
        border: InputBorder.none,
        hintStyle: kManRope_400_16_001314,
        hintText: label);
  }

  InputDecoration underlinefieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(
          bottom: 20,
        ),
        border: InputBorder.none,
        // contentPadding: EdgeInsets.zero,
        hintText: label,
        hintStyle: hintstyle ?? TextStyle(),
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: child ?? SizedBox.shrink()));
  }

  // InputDecoration otpDecoration() {
  //   return InputDecoration(
  //     contentPadding: EdgeInsets.only(left:
  //       20,
  //     ),
  //       border: InputBorder.none,
  //       hintText: label,
  //       hintStyle: kManRope_700_20_001314,
  //
  //     );
  // }

  InputDecoration blankfieldDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16,
        ),
        border: InputBorder.none,
        hintText: label,
        hintStyle: hintstyle ?? TextStyle(),
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: child ?? SizedBox.shrink()));
  }

  InputDecoration smalltextfieldDecoration() {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: k006D77, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: k006D77, width: 1)),
      hintText: label,
      hintStyle: kManRope_400_16_626A6A,
      suffixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
      suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: child ?? SizedBox.shrink()),
      contentPadding: EdgeInsets.only(
        left: 16.w,
      ),
      // filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: k006D77,
        ),
        // focusColor: kEDF6F9,
        // fillColor: kEDF6F9,
      ),
    );
  }
}
