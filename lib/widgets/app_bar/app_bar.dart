import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';

import '../../AllScreens/UserPanel/UScreens/UHome/notification_screen.dart';
import '../../constants/fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({required this.appBarText, Key? key}) : super(key: key);
  String appBarText;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      elevation: 0,
      backgroundColor: kEDF6F9,
      leadingWidth: 70,
      title: Text(
        appBarText,
        style: kManRope_500_16_006D77,
      ),
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 30,
          margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(22),
          child: Image.asset(
            'assets/images/Vector 175.png',
            width: 10,
          ),
        ),
      ),
    );
  }
}

// class AppBar extends StatelessWidget {
//   // final MaterialStateProperty<Color> backgroundColor;
//   final Color textStyleColor;
//   final Color backgroundColor;
//   final Function onTap;
//   final String title;
//   const AppBar({
//     Key? key,
//     required this.onTap,
//     required this.title,
//     required this.textStyleColor,
//     required this.backgroundColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       elevation: 1,
//       color: backgroundColor,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(30))),
//       onPressed: () {
//         onTap();
//       },
//       child: Center(
//         child: Text(
//           title,
//           style: FontConstant.k18w500materialbuttonText,
//         ),
//       ),
//     );
//   }
// }

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
                builder: (context) => const NotificationsScreen()));
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

class CusAppBar extends StatelessWidget with PreferredSizeWidget {
  CusAppBar({
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
    // return AppBar(
    //     toolbarHeight: 60,
    //     elevation: 0,
    //     backgroundColor: kEDF6F9,
    //     leadingWidth: 50,
    //     titleSpacing: 1,
    //   title: Text(
    //     appBarText ?? '',
    //     style: kManRope_500_16_006D77,
    //   ),
    //    leading: GestureDetector(
    //   behavior: HitTestBehavior.translucent,
    //   onTap: () {
    //     Navigator.pop(context);
    //   },
    //   child: Image.asset(
    //     imgPath,
    //       width: 32.w,
    //       height: 48.h,
    //   ),
    // ),
    //   // flexibleSpace: Padding(
    //   //   padding: const EdgeInsets.only(top:55.0),
    //   //   child: Row(
    //   //     children: [
    //   //       Image.asset(
    //   //         imgPath,
    //   //         width: 15,
    //   //         height: 12,
    //   //       ),
    //   //       // Text(
    //   //       //   appBarText ?? '',
    //   //       //   style: kManRope_500_16_006D77,
    //   //       // ),
    //   //
    //   //
    //   //     ],
    //   //   ),
    //   // ),
    //   // leadingWidth: 40,
    //   // titleSpacing: 1,
    //   // title: Text(
    //   //   appBarText ?? '',
    //   //   style: kManRope_500_16_006D77,
    //   // ),
    //   // leading: GestureDetector(
    //   //   behavior: HitTestBehavior.translucent,
    //   //   onTap: () {
    //   //     Navigator.pop(context);
    //   //   },
    //   //   child: Padding(
    //   //     padding: const EdgeInsets.symmetric(vertical: 20),
    //   //     child: Image.asset(
    //   //       imgPath,
    //   //       width: 5,
    //   //       height: 5,
    //   //     ),
    //   //   ),
    //   // ),
    // );
  }
}

class CuswhiteAppBar extends StatelessWidget with PreferredSizeWidget {
  CuswhiteAppBar({
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
    ) /*AppBar(
      toolbarHeight: 60,
      elevation: 0,
      backgroundColor: kFFFFFF,
      leadingWidth: 281.w,
      // title: false,
      automaticallyImplyLeading: false,
      // titleSpacing: 0,
      // title: Text(
      //   appBarText,
      //   style: kManRope_500_16_006D77,
      //   // textAlign: TextAlign.left,
      // ),
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                imgPath,
                width: 32.w,
                height: 48.h,
              ),
            ),
            Text(
              appBarText,
              style: kManRope_500_16_006D77,
              // textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    )*/
        ;
  }
}

class DotappBar extends StatelessWidget with PreferredSizeWidget {
  DotappBar({
    required this.onTap,
    required this.imgPath,
    Key? key,
  }) : super(key: key);

  // String appBarText;
  String imgPath;
  final Function() onTap;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: 48,
        padding: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                child: Image.asset(
                  "assets/images/iconbacklargeicon.png",
                  // imgPath,
                  width: 48,
                ),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              // onTap: () {
              //
              //     showModalBottomSheet(
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.only(
              //               topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              //         ),
              //         context: context,
              //         builder: (context) => HistoryFilterBottomSheet());
              //
              //
              // },
              child: Container(
                padding: EdgeInsets.only(right: 16),
                // color: Colors.red,
                child: Image.asset(
                  imgPath,
                  height: 48.h,
                  width: 32.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //   AppBar(
    //   toolbarHeight: 60,
    //   elevation: 0,
    //   backgroundColor: Colors.white,
    //   leadingWidth: 50,
    //   actions: [JoiningPopup()],
    //   leading: GestureDetector(
    //     behavior: HitTestBehavior.translucent,
    //     onTap: () {
    //       Navigator.pop(context);
    //     },
    //     child: Image.asset(
    // "assets/images/iconbackappbarlarge.png",
    // height: 48.h,
    // width: 32.w;

    // ),
    //   ),
    // );
    // }
// }

// class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
//   HomeAppBar(
//       {
//       // required this.appBarText,
//       // required this.imgPath,
//       Key? key})
//       : super(key: key);
//   // String appBarText;
//   // String imgPath;
//
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       child: AppBar(
//         toolbarHeight: 48.h,
//         automaticallyImplyLeading: false,
//         backgroundColor: kEDF6F9,
//         elevation: 0,
//         centerTitle: false,
//         title: Text(
//           'Good Morning, Pankaj',
//           style: kManRope_700_20_686868,
//         ),
//         actions: [
//           GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             child: Image.asset(
//               'assets/images/icon notification48.png',
//               width: 48.w,
//               height: 48.h,
//               color: k686868,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  }
}

class WhiteCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  WhiteCustomAppBar({required this.appBarText, Key? key}) : super(key: key);
  String appBarText;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 40.w,
      backgroundColor: Colors.white,
      title: Text(
        appBarText,
        style: kManRope_500_16_006D77,
      ),
      titleSpacing: 18.w,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
