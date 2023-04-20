import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BottomSheets/ReportBottomSheet.dart';

class MyPostOptionsDialog extends StatefulWidget {
  final String postId;
  final String postType;
  final String commentType;
  const MyPostOptionsDialog(
      {Key? key,
      required this.postType,
      required this.postId,
      required this.commentType})
      : super(key: key);

  @override
  State<MyPostOptionsDialog> createState() => _MyPostOptionsDialogState();
}

class _MyPostOptionsDialogState extends State<MyPostOptionsDialog> {
  _reportSheet() {
    log(widget.commentType);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => ReportCommentBottomSheet(
              commentType: widget.commentType,
              postId: widget.postId,
              postType: widget.postType,
              type: widget.commentType,
            ));
  }

  @override
  void initState() {
    _getPrefs();
    super.initState();
  }

  late bool _isUser;
  _getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    _isUser = prefs.getBool(Keys().isUser) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 40,
        /*icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
        ),*/
        child: SvgPicture.asset(
          'assets/icons/kebabMenu.svg',
          height: 24.h,
          width: 24.w,
        ),
        itemBuilder: (context) {
          return [
            if (!_isUser)
              PopupMenuItem(
                onTap: () {
                  // final resp = DeleteCommentApi()
                  //     .get(commentId: commentId, postType: postType);
                  // resp.then((value) {});
                },
                enabled: true,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Delete",
                        style: kManRope_500_16_626A6A,
                      ),
                    ],
                  ),
                ),
              ),
            PopupMenuItem(
              enabled: false,
              child: InkWell(
                onTap: () {
                  //log("message");
                  _reportSheet();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 16, top: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Report",
                        style: kManRope_500_16_626A6A,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}

class CalenderDialog extends StatelessWidget {
  const CalenderDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              // enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, top: 16, bottom: 16, right: 24),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "This Month",
                          style: kManRope_500_16_626A6A,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "This Week",
                          style: kManRope_500_16_626A6A,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "This Year",
                          style: kManRope_500_16_626A6A,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }
}
