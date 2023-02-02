import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class JoiningPopup extends StatelessWidget {
  const JoiningPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 40,
        icon: ImageIcon(
          AssetImage(
            "assets/images/Frame 48.png",
          ),
          color: k001314,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      child: Text(
                        "Cancle appointment",
                        style: kManRope_400_16_626A6A,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        });
  }
}

class CalenderPopup extends StatelessWidget {
  const CalenderPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      icon: SvgPicture.asset(
        'assets/icons/calender.svg',
        height: 24.h,
        width: 24.w,
      ),
      itemBuilder: (context) => [
        // PopupMenuItem 1
        PopupMenuItem(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ),
          value: 1,
          // row with 2 children
          child: Text(
            "This month",
            style: kManRope_400_20_Black,
          ),
        ),
        // PopupMenuItem 2
        PopupMenuItem(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ),
          value: 2,
          // row with two children
          child: Text("This year", style: kManRope_400_20_Black),
        ),
        PopupMenuItem(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
            bottom: 30,
          ),
          value: 3,
          // row with two children
          child: Text("This week", style: kManRope_400_20_Black),
        ),
      ],
      offset: Offset(0, 100),
      color: kEDF6F9,
      elevation: 2,
      // on selected we show the dialog box
      onSelected: (value) {},
    );
  }
}

class CalenderWidget extends StatelessWidget {
  final Widget? child;

  // final EdgeInsets? padding;

  const CalenderWidget({
    Key? key,
    required this.child,

    // this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: k006D77,
          onPrimary: Colors.white,
          surface: k006D77,
          onSurface: k001314,
        ),
        dialogBackgroundColor: kEDF6F9,
      ),
      child: child!,
    );
  }
}

class TimeWidget extends StatelessWidget {
  final Widget? child;
  // final EdgeInsets? padding;
  TimeWidget({
    Key? key,
    required this.child,
    // this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          // change the border color
          primary: k006D77,
          background: kEDF6F9,
          // change the text color
          onSurface: k006D77,
        ),
        // button colors

        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            primary: kEDF6F9,
          ),
        ),
      ),
      child: child!,
    );
  }
}
