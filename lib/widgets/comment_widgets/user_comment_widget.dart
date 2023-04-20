import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/load_more_replies.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/model/UModels/user_posts_model/comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../AllScreens/UserPanel/UScreens/UPosts/UReplyScreen.dart';
import '../../Apis/UserAPis/user_posts_api/comment_like_api.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../popmenu_widgets/popmenu_widget.dart';

class usercommentWidget1 extends StatefulWidget {
  List<CommentModel> modelList;
  int index;
  Function onPop;
  String postedBy;
  usercommentWidget1({
    Key? key,
    required this.modelList,
    required this.postedBy,
    required this.onPop,
    required this.index,
  }) : super(key: key);

  @override
  State<usercommentWidget1> createState() => _usercommentWidget1State();
}

class _usercommentWidget1State extends State<usercommentWidget1> {
  int _scroll = 0;
  int loadedData = 0;
  List<Replies> repliesList = [];

  bool _isUser = false;
  _getPrefs() async {
    var _prefs = await SharedPreferences.getInstance();
    _isUser = _prefs.getBool(Keys().isUser) ?? false;
  }

  @override
  void initState() {
    _getPrefs();
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

  bool _repliesLoading = false;
  bool _showBtn = false;
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

  int totalReplies = 0;
  int totalVotes = 0;
  int yourVote = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentUserTile(
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
                            onTap: _isUser
                                ? () {}
                                : () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UReplyScreen(
                                                  modelList: widget.modelList,
                                                  index: widget.index,
                                                  postedBy: widget.postedBy,
                                                ))).then((value) {
                                      widget.onPop();
                                    });
                                  },
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
        if (widget.modelList[widget.index].replies!.isNotEmpty)
          SizedBox(
            height: 15,
          ),
        if (widget.modelList[widget.index].replies!.isNotEmpty)
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
                      postType:
                          widget.modelList[widget.index].postType.toString(),
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
                : InkWell(
                    onTap: () {
                      setState(() {
                        _repliesLoading = true;
                      });
                      _getReplies();
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: Colors.transparent,
                        child: Text(
                          "Load replies",
                          style: kManRope_400_12_006D77,
                        )),
                  ),
      ],
    );
  }
}

class usercommWidget2 extends StatelessWidget {
  List<Replies> modelList;
  int index;
  String postType;
  usercommWidget2(
      {Key? key,
      required this.modelList,
      required this.index,
      required this.postType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CommentUserTile2(
          modelList: modelList,
          index: index,
          postType: postType,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 280.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  modelList[index].reply.toString(),
                  style: kManRope_400_14_626A6A,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CommentUserTile extends StatefulWidget {
  List<CommentModel> modelList;
  int index;
  CommentUserTile({Key? key, required this.index, required this.modelList})
      : super(key: key);

  @override
  State<CommentUserTile> createState() => _CommentUserTileState();
}

class _CommentUserTileState extends State<CommentUserTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  width: 45.w,
                  height: 45.w,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: Image.network(
                    widget.modelList[widget.index].photo.toString(),
                    fit: BoxFit.fill,
                    errorBuilder: (q, w, e) =>
                        Image.asset('assets/images/userP.png'),
                  )),
              SizedBox(width: 8.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.modelList[widget.index].name.toString(),
                      style: kManRope_500_16_Black),
                  SizedBox(height: 1.h),
                  Text(
                      DateTime.now()
                                  .difference(DateTime.parse(widget
                                      .modelList[widget.index].dateTime
                                      .toString()))
                                  .inMinutes <=
                              59
                          ? "${DateTime.now().difference(DateTime.parse(widget.modelList[widget.index].dateTime.toString())).inMinutes} min ago"
                          : DateTime.now()
                                      .difference(DateTime.parse(widget
                                          .modelList[widget.index].dateTime
                                          .toString()))
                                      .inHours <=
                                  23
                              ? "${DateTime.now().difference(DateTime.parse(widget.modelList[widget.index].dateTime.toString())).inHours} hour ago"
                              : "${DateTime.now().difference(DateTime.parse(widget.modelList[widget.index].dateTime.toString())).inDays} day ago",
                      style: kManRope_400_12_626A6A),
                  SizedBox(height: 8.h),
                ],
              ),
            ],
          ),
          MyPostOptionsDialog(
            commentType: "comment",
            postType: widget.modelList[widget.index].postType.toString(),
            postId: widget.modelList[widget.index].id.toString(),
          ),
        ],
      ),
    );
  }
}

class CommentUserTile2 extends StatefulWidget {
  List<Replies> modelList;
  int index;
  String postType;
  CommentUserTile2(
      {Key? key,
      required this.index,
      required this.modelList,
      required this.postType})
      : super(key: key);

  @override
  State<CommentUserTile2> createState() => _CommentUserTile2State();
}

class _CommentUserTile2State extends State<CommentUserTile2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  width: 45.w,
                  height: 45.w,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: Image.network(
                    widget.modelList[widget.index].photo.toString(),
                    fit: BoxFit.fill,
                    errorBuilder: (q, w, e) =>
                        Image.asset('assets/images/userP.png'),
                  )),
              SizedBox(width: 8.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.modelList[widget.index].name.toString(),
                      style: kManRope_500_16_Black),
                  SizedBox(height: 1.h),
                  Text(
                      DateTime.now()
                                  .difference(DateTime.parse(widget
                                      .modelList[widget.index].dateTime
                                      .toString()))
                                  .inMinutes <=
                              59
                          ? "${DateTime.now().difference(DateTime.parse(widget.modelList[widget.index].dateTime.toString())).inMinutes} min ago"
                          : DateTime.now()
                                      .difference(DateTime.parse(widget
                                          .modelList[widget.index].dateTime
                                          .toString()))
                                      .inHours <=
                                  23
                              ? "${DateTime.now().difference(DateTime.parse(widget.modelList[widget.index].dateTime.toString())).inHours} hour ago"
                              : "${DateTime.now().difference(DateTime.parse(widget.modelList[widget.index].dateTime.toString())).inDays} day ago",
                      style: kManRope_400_12_626A6A),
                  SizedBox(height: 8.h),
                ],
              ),
            ],
          ),
          MyPostOptionsDialog(
            commentType: "reply",
            postType: widget.postType,
            postId: widget.modelList[widget.index].id.toString(),
          ),
        ],
      ),
    );
  }
}
