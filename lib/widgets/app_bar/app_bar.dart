import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/widgets/popupdialogs.dart';

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
      backgroundColor: kWhiteBGColor,
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
    return AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: kWhiteBGColor,
        leadingWidth: 50,
        titleSpacing: 1,
      title: Text(
        appBarText ?? '',
        style: kManRope_500_16_006D77,
      ),
       leading: GestureDetector(
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
      // flexibleSpace: Padding(
      //   padding: const EdgeInsets.only(top:55.0),
      //   child: Row(
      //     children: [
      //       Image.asset(
      //         imgPath,
      //         width: 15,
      //         height: 12,
      //       ),
      //       // Text(
      //       //   appBarText ?? '',
      //       //   style: kManRope_500_16_006D77,
      //       // ),
      //
      //
      //     ],
      //   ),
      // ),
      // leadingWidth: 40,
      // titleSpacing: 1,
      // title: Text(
      //   appBarText ?? '',
      //   style: kManRope_500_16_006D77,
      // ),
      // leading: GestureDetector(
      //   behavior: HitTestBehavior.translucent,
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 20),
      //     child: Image.asset(
      //       imgPath,
      //       width: 5,
      //       height: 5,
      //     ),
      //   ),
      // ),
    );
  }
}

class CuswhiteAppBar extends StatelessWidget with PreferredSizeWidget {
  CuswhiteAppBar({
    required this.appBarText,
    required this.imgPath,
    Key? key,
  }) : super(key: key);
  String appBarText;
  String imgPath;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}

class DotappBar extends StatelessWidget with PreferredSizeWidget {
  DotappBar(
      {
      // required this.appBarText,
      required this.imgPath,
      Key? key})
      : super(key: key);
  // String appBarText;
  String imgPath;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 50,
      actions: [JoiningPopup()],
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          "assets/images/iconbackappbarlarge.png",
          height: 48.h,
          width: 32.w,

        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar(
      {
      // required this.appBarText,
      // required this.imgPath,
      Key? key})
      : super(key: key);
  // String appBarText;
  // String imgPath;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: AppBar(
        toolbarHeight: 48.h,
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteBGColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Good Morning, Pankaj',
          style: kManRope_700_20_686868,
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Image.asset(
              'assets/images/icon notification48.png',
              width: 48.w,
              height: 48.h,
              color: k686868,
            ),
          ),
        ],
      ),
    );
  }
}
