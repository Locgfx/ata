import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UNotificationScreen.dart';
import 'package:greymatter/constants/colors.dart';
import '../../constants/fonts.dart';


class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar(
      {required this.text,
      required this.child,
      required this.color,
      // required this.imagecolor,

      Key? key})
      : super(key: key);
  // String appBarText;
  final Color color;
  // final Color imagecolor;
  final Widget child;
  final Text text;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: color,
      systemOverlayStyle: Platform.isAndroid
          ? SystemUiOverlayStyle(
              statusBarColor: color,
              statusBarIconBrightness: Brightness.dark,
            )
          : SystemUiOverlayStyle.dark,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UNotificationsScreen()));
          },
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(right: 12),
            child: child,
          ),
        ),
      ],
      title: Container(
        color: color,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 6.w),
                child: text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    this.appBarText,
    required this.imgPath,
    Key? key,
  }) : super(key: key);
  String? appBarText;
  String imgPath;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kEDF6F9,
        height: 48,
        padding: EdgeInsets.only(top: 16),
        child: Row(
          children: [
            GestureDetector(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(left: 16),
                child: Image.asset(
                  imgPath,
                  width: 32.w,
                  height: 48.h,
                ),
              ),
            ),
            Text(
              appBarText ?? '',
              style: kManRope_500_16_006D77,
              // textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );

  }
}

class CustomWhiteAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomWhiteAppBar({
    required this.appBarText,
    required this.imgPath,
    this.text,
    this.onThreeDotTap,
    required this.hasThreeDots,
    Key? key,
  }) : super(key: key);
  String appBarText;
  String imgPath;
  Widget? text;
  Function? onThreeDotTap;
  bool hasThreeDots;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      systemOverlayStyle: Platform.isAndroid
          ? SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            )
          : SystemUiOverlayStyle.dark,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        color: Colors.white,
        height: 48,
        padding: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  // behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    color: Colors.transparent,
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  appBarText,
                  style: kManRope_500_16_006D77,
                  // textAlign: TextAlign.left,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: SizedBox(
                height: 48.h,
                width: 100.w,
                // color: Colors.red,
                // padding: EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    text ?? SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            if (hasThreeDots)
              GestureDetector(
                  onTap: () {
                    onThreeDotTap!();
                  },
                  child: Container(
                      width: 40.w,
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/images/3doticonlarge.png',
                        fit: BoxFit.fitWidth,
                      ))),
          ],
        ),
      ),
    );
  }
}




