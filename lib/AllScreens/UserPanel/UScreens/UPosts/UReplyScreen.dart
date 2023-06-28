import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/DoctorApis/comment_api/post_reply_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Apis/UserAPis/user_posts_api/comment_like_api.dart';
import '../../../../Apis/UserAPis/user_posts_api/load_more_replies.dart';
import '../../../../constants/globals.dart';
import '../../../../model/UModels/user_posts_model/comment_model.dart';
import '../../../../widgets/app_bar/app_bar.dart';
import '../../../../widgets/comment_widgets/user_comment_widget.dart';

class UReplyScreen extends StatefulWidget {
  List<CommentModel> modelList;
  int index;
  String postedBy;
  String postedbyMe;

  UReplyScreen(
      {Key? key,
      required this.modelList,
      required this.index,
      required this.postedbyMe,
      required this.postedBy})
      : super(key: key);

  @override
  State<UReplyScreen> createState() => _UReplyScreenState();
}

class _UReplyScreenState extends State<UReplyScreen> {
  final cont = TextEditingController();
  bool _postCommentLoading = false;
  List<Replies> repliesList = [];

  @override
  void initState() {
    setPrefs();
    if (widget.modelList[widget.index].replies!.isNotEmpty) {
      loadedData = widget.modelList[widget.index].replies!.length;
      _showBtn = true;
      for (var v in widget.modelList[widget.index].replies!) {
        repliesList.add(v);
      }
    }
    totalVotes = widget.modelList[widget.index].totalLikes ?? 0;
    yourVote = widget.modelList[widget.index].isLiked ?? 0;
    totalReplies =
        int.parse(widget.modelList[widget.index].totalReplies ?? "0");
    super.initState();
  }

  _postReply() {
    final resp = PostReplyApi().get(
        commentedBy: widget.modelList[widget.index].commentedBy.toString(),
        commentId: int.parse(widget.modelList[widget.index].id.toString()),
        postType: widget.modelList[widget.index].postType.toString(),
        reply: cont.text.trim());
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        setState(() {
          cont.clear();
          repliesList.add(Replies.fromJson(value['reply']));
          _postCommentLoading = false;
        });
      } else {
        setState(() {
          _postCommentLoading = false;
          Fluttertoast.showToast(msg: value["error"]);
        });
      }
    });
  }

  _likeUnlikeComment() {
    final resp = CommentLikeApi().get(
        commentId: int.parse(widget.modelList[widget.index].id.toString()),
        postType: widget.postedBy);
    resp.then((value) {
      log(value.toString());
      setState(() {
        if (value['status'] == true) {
          if (value['message'] == "liked") {
            totalVotes++;
            yourVote = 1;
          } else {
            if (totalVotes >= 1) {
              totalVotes--;
            } else {
              totalVotes = 0;
            }
            yourVote = 0;
          }
        }
      });
    });
  }

  int _scroll = 0;
  int loadedData = 0;
  _getReplies() {
    _scroll++;
    final resp = LoadMoreReplies().get(
        commentId: widget.modelList[widget.index].id.toString(),
        postType: widget.modelList[widget.index].postType.toString(),
        scroll: "$_scroll");
    resp.then((value) {
      log(value.length.toString());
      if (value['status'] == true) {
        setState(() {
          for (var v in value['replies']) {
            repliesList.add(Replies.fromJson(v));
          }
          loadedData = value['replies'].length;
          if (value.length >= 2) {
            _showBtn = false;
          }
          _repliesLoading = false;
        });
      } else {
        setState(() {
          _repliesLoading = false;
          _showBtn = false;
        });
      }
    });
  }

  String userType = '';
  setPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString(Keys().userType) ?? "u";
    });
    log(userType);
  }

  bool _repliesLoading = false;
  bool _showBtn = false;
  int totalReplies = 0;
  int totalVotes = 0;
  int yourVote = 0;

  Widget? _commentField() {
    if (userType.toLowerCase() == "p") {
      return SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextField(
                      controller: cont,
                      style: kManRope_400_14_626A6A,
                      maxLines: 2,
                      minLines: 1,
                      onChanged: (v) {
                        setState(() {});
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 24),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Colors.transparent),
                        ),
                        //fillColor: Colors.white,
                        hintText: "Add a comment",
                        // hintStyle: kManRope_400_14_626A6A,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _postCommentLoading
                      ? SpinKitThreeBounce(
                          color: k006D77,
                          size: 15,
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _postCommentLoading = true;
                            });
                            _postReply();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "assets/images/iconsendlarge (2).png",
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                                //SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ),
      );
    } else if (userType.toLowerCase() == "u" &&
        widget.postedbyMe.toString() == "1") {
      return SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextField(
                      controller: cont,
                      style: kManRope_400_14_626A6A,
                      maxLines: 2,
                      minLines: 1,
                      onChanged: (v) {
                        setState(() {});
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 24),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Colors.transparent),
                        ),
                        //fillColor: Colors.white,
                        hintText: "Add a comment",
                        // hintStyle: kManRope_400_14_626A6A,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _postCommentLoading
                      ? SpinKitThreeBounce(
                          color: k006D77,
                          size: 15,
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _postCommentLoading = true;
                            });
                            _postReply();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "assets/images/iconsendlarge (2).png",
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                                //SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: '',
      ),
      backgroundColor: kEDF6F9,
      bottomNavigationBar: _commentField(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Replies to ${widget.modelList[widget.index].name.toString()}’s comment on this post ",
                style: kManRope_400_16_001314,
              ),
              SizedBox(height: 27),
              CommentUserTile(
                onPop: (val) {
                  Navigator.pop(context);
                },
                modelList: widget.modelList,
                index: widget.index,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 327.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            widget.modelList[widget.index].comment.toString(),
                            style: kManRope_400_14_626A6A,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Reply",
                                    style: kManRope_400_12_626A6A,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "$totalReplies",
                                  style: kManRope_400_12_626A6A,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 22),
                          InkWell(
                            onTap: () {
                              _likeUnlikeComment();
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  yourVote == 0
                                      ? Image.asset(
                                          'assets/images/iconlike24.png',
                                          height: 24.h,
                                          width: 24.w,
                                        )
                                      : Image.asset(
                                          'assets/images/likedpost.png',
                                          height: 24.h,
                                          width: 24.w,
                                        ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.w),
                                    child: Text(totalVotes.toString(),
                                        style: kManRope_400_14_626A6A),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              if (repliesList.isNotEmpty)
                SizedBox(
                  height: 15,
                ),
              if (repliesList.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 327.w,
                      child: ListView.separated(
                        separatorBuilder: (ctx, ind) => SizedBox(
                          height: 15,
                        ),
                        itemBuilder: (ctx, indexx) {
                          return usercommWidget2(
                            onPop: (val) {
                              setState(() {
                                repliesList.removeAt(indexx);
                              });
                            },
                            postType: widget.modelList[widget.index].postType
                                .toString(),
                            modelList: repliesList,
                            index: indexx,
                          );
                        },
                        itemCount: repliesList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              _repliesLoading
                  ? SpinKitThreeBounce(
                      color: k006D77,
                      size: 10,
                    )
                  : _showBtn == false
                      ? SizedBox.shrink()
                      : Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _repliesLoading = true;
                              });
                              _getReplies();
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                color: Colors.transparent,
                                child: Text(
                                  "Load replies",
                                  style: kManRope_400_12_006D77,
                                )),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
