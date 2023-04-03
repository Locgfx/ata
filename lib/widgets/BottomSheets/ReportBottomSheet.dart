import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/report_post_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

import '../../constants/decorations.dart';
import '../../model/UModels/user_posts_model/user_posts_model.dart';
import '../buttons.dart';

class ReportBottomSheet extends StatefulWidget {
  final List<UserPostModel> postModel;
  final int index;
  final String savedPost;
  const ReportBottomSheet(
      {Key? key,
      required this.postModel,
      required this.index,
      required this.savedPost})
      : super(key: key);

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  int _gIndex = 0;

  List<String> reportText = [
    'Spam',
    'False information',
    'Harassment or hateful speech',
    'Adult content',
    'Violence or physical harm',
    'Block user',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 310.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 0;
                    // Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      reportText[0],
                      style: _gIndex == 0
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 1;
                    // Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 50.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 1 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[1],
                      style: _gIndex == 1
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 2;
                    //  Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 2 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[2],
                      style: _gIndex == 2
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 3;
                    // Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 3 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[3],
                      style: _gIndex == 3
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 4;
                    //Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 4 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[4],
                      style: _gIndex == 4
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 5;
                    // Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 5 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[5],
                      style: _gIndex == 5
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 6;
                    // Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 6 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[6],
                      style: _gIndex == 6
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              final resp = ReportPostApi().get(
                                  type: "post",
                                  postType: widget
                                      .postModel[widget.index].postedBy
                                      .toString(),
                                  reportText: reportText[_gIndex],
                                  postId: widget.savedPost == "yes"
                                      ? int.parse(widget
                                          .postModel[widget.index].postId
                                          .toString())
                                      : int.parse(widget
                                          .postModel[widget.index].id
                                          .toString()));
                              resp.then((value) {
                                if (value['status'] == true) {
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(
                                      msg: "Post reported successfully.");
                                } else {
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(
                                      msg: "Report failed. Please try again");
                                }
                              });
                              log(reportText[_gIndex]);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 0.w, right: 0.w),
                              child: Text(
                                "Report",
                                style: kManRope_400_16_white,
                              ),
                            ),
                            color: k006D77,
                            shape:
                                CustomDecoration().smallButton10Decoration()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}

class ReportCommentBottomSheet extends StatefulWidget {
  final String type;
  final String postId;
  final String postType;
  final String commentType;
  const ReportCommentBottomSheet(
      {Key? key,
      required this.type,
      required this.postId,
      required this.commentType,
      required this.postType})
      : super(key: key);

  @override
  State<ReportCommentBottomSheet> createState() =>
      _ReportCommentBottomSheetState();
}

class _ReportCommentBottomSheetState extends State<ReportCommentBottomSheet> {
  int _gIndex = 0;

  List<String> reportText = [
    'Spam',
    'False information',
    'Harassment or hateful speech',
    'Adult content',
    'Violence or physical harm',
    'Block user',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 310.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 0;
                    // Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      reportText[0],
                      style: _gIndex == 0
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 1;
                    // Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 50.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 1 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[1],
                      style: _gIndex == 1
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 2;
                    //  Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 2 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[2],
                      style: _gIndex == 2
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 3;
                    // Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 3 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[3],
                      style: _gIndex == 3
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 4;
                    //Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 4 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[4],
                      style: _gIndex == 4
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 5;
                    // Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 5 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[5],
                      style: _gIndex == 5
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 6;
                    // Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 6 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      reportText[6],
                      style: _gIndex == 6
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              final resp = ReportPostApi().get(
                                  type: widget.commentType,
                                  postType: widget.postType,
                                  reportText: reportText[_gIndex],
                                  postId: int.parse(widget.postId));
                              resp.then((value) {
                                if (value['status'] == true) {
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(
                                      msg: "Comment reported successfully.");
                                } else {
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(
                                      msg: "Report failed. Please try again");
                                }
                              });
                              log(reportText[_gIndex]);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 0.w, right: 0.w),
                              child: Text(
                                "Report",
                                style: kManRope_400_16_white,
                              ),
                            ),
                            color: k006D77,
                            shape:
                                CustomDecoration().smallButton10Decoration()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
