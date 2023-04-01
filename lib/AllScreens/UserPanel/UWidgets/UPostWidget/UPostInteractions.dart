import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/comment_like_api.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_like_post_api.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_save_post_api.dart';
import 'package:greymatter/model/UModels/user_posts_model/user_posts_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../constants/fonts.dart';
import '../../UScreens/UPosts/UAllcomments.dart';

class UPostInteractions extends StatefulWidget {
  bool isCommentsViewable;
  String savedPost;
  List<UserPostModel> modelList;
  int index;
  UPostInteractions(
      {Key? key,
      required this.isCommentsViewable,
      required this.savedPost,
      required this.modelList,
      required this.index})
      : super(key: key);

  @override
  State<UPostInteractions> createState() => _UPostInteractionsState();
}

class _UPostInteractionsState extends State<UPostInteractions>
    with AutomaticKeepAliveClientMixin {
  int totalVotes = 0;
  int yourVote = 0;
  int isSaved = 0;

  @override
  void initState() {
    totalVotes = widget.modelList[widget.index].totalLikes ?? 0;
    yourVote = widget.modelList[widget.index].isLiked ?? 0;
    isSaved = widget.modelList[widget.index].isSaved ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 48.h,
                width: 73.w,
                // color: Colors.red,
                child: InkWell(
                  onTap: () {
                    final resp = UserLikePostApi().get(
                        postType: widget.modelList[widget.index].postedBy!,
                        postId: widget.savedPost == "yes"
                            ? int.parse(widget.modelList[widget.index].postId!)
                            : int.parse(widget.modelList[widget.index].id!));
                    resp.then((value) {
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
              ),
              SizedBox(
                width: 16.w,
              ),
              GestureDetector(
                onTap: () {
                  if (widget.isCommentsViewable) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UCommentPage(
                          model: widget.modelList[widget.index],
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 48.h,
                  width: 75.w,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/images/iconcomment24.png',
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                          widget.modelList[widget.index].totalComments
                              .toString(),
                          style: kManRope_400_14_626A6A),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  final resp = UserSavePostApi().get(
                      postId: widget.savedPost == "yes"
                          ? widget.modelList[widget.index].postId.toString()
                          : widget.modelList[widget.index].id.toString(),
                      postType:
                          widget.modelList[widget.index].postedBy.toString());
                  resp.then((value) {
                    setState(() {
                      if (value['status'] == true) {
                        if (value['message'] == "Saved") {
                          isSaved = 1;
                          widget.modelList[widget.index].isSaved = 1;
                        } else {
                          isSaved = 0;
                          widget.modelList[widget.index].isSaved = 0;
                        }
                      }
                    });
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  height: 48,
                  width: 48,
                  // color: Colors.red,
                  child: isSaved == 0
                      ? Image.asset(
                          'assets/images/iconbookmark48.png',
                          height: 48,
                          width: 48,
                        )
                      : SizedBox(
                          height: 48,
                          width: 48,
                          child: Image.asset(
                            'assets/images/savedfilled.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                ),
              ),
              // SizedBox(
              //   width: 8.w,
              // ),
              InkWell(
                onTap: () {
                  Share.share("text");
                },
                child: Container(
                  color: Colors.transparent,
                  height: 48,
                  width: 48,
                  // color: Colors.red,
                  child: Image.asset(
                    'assets/images/iconshare48.png',
                    height: 44,
                    width: 44,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
