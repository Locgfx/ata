import 'package:flutter/material.dart';
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
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 40,
          padding: EdgeInsets.all(22),
          child: Image.asset(
            imgPath,
            width: 10,
          ),
        ),
      ),
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
      leadingWidth: 50,
      titleSpacing: 1,
      title: Text(
        appBarText,
        style: kManRope_500_16_006D77,
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 40,
          padding: EdgeInsets.all(22),
          child: Image.asset(
            imgPath,
            width: 10,
          ),
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
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          // margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(22),
          child: Image.asset(
            "assets/images/Vector 175.png",
          ),
        ),
      ),
    );
  }
}
