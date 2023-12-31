import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UPostWidget/UPostInteractions.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/delete_post_api.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/hide_post_api.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_posts_api.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_posts_model/user_posts_model.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:readmore/readmore.dart';

import '../../../../Apis/UserAPis/user_posts_api/user_save_post_api.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/BottomSheets/ReportBottomSheet.dart';
import 'UCreatepost.dart';

class UPostPage extends StatefulWidget {
  final bool isCommentsViewable;
  UPostPage({
    Key? key,
    required this.isCommentsViewable,
  }) : super(key: key);

  @override
  State<UPostPage> createState() => _UPostPageState();
}

class _UPostPageState extends State<UPostPage> {
  bool isExpanded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  UserPostModel model = UserPostModel();
  List<UserPostModel> postModel = [];

  bool isLoading = false;
  bool isLoading2 = false;

  int scroll = 0;

  Future<String> getReloadedData() async {
    scroll++;
    isLoading = true;
    final resp = UserPostApi().get(scroll: scroll.toString());
    resp.then((value) {
      log(value.toString());
      if (mounted) {
        // postModel.clear();
        _postCount = value.length;
        log(_postCount.toString());
        setState(() {
          for (var v in value) {
            postModel.add(UserPostModel.fromJson(v));
          }
          //log(postModel.toString());
          isLoading = false;
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    });
    return "Success";
  }

  Future<String> getData() async {
    isLoading = true;
    final resp = UserPostApi().get(scroll: 0.toString());
    resp.then((value) {
      log(value.toString());
      if (mounted) {
        postModel.clear();
        _postCount = value.length;
        log(_postCount.toString());
        setState(() {
          for (var v in value) {
            postModel.add(UserPostModel.fromJson(v));
          }
          //log(postModel.toString());
          isLoading = false;
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    });
    return "Success";
  }

  int _postCount = 0;
  @override
  void dispose() {
    super.dispose();
  }

  void _postbottomsheet(int index) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => MenuBottomSheet(
              postedBy: postModel[index].postedBy.toString(),
              savedPost: "no",
              onPop: (val) {
                if (val == "Hide") {
                  setState(() {
                    postModel.removeAt(index);
                  });
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  getData();
                }
              },
              postModel: postModel,
              index: index,
            ));
  }

  int imgIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kEDF6F9,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            backgroundColor: kEDF6F9,
            body: isLoading
                ? Padding(
                    padding: EdgeInsets.only(bottom: 159.0),
                    child: LoadingWidget(),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.h, bottom: 80.h),
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        if (_postCount >= 10) {
                          getReloadedData();
                        }
                      },
                      isLoading: isLoading,
                      child: RefreshIndicator(
                        onRefresh: () {
                          setState(() {
                            isLoading = true;
                          });
                          return getData();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.only(bottom: 80),
                          itemCount: postModel.length + 1,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            if (index < postModel.length) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: index == 0 ? 40 : 0),
                                child: Container(
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 1.sw,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 45.h,
                                              // width: 135.w,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 45.h,
                                                    width: 45.w,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.white,
                                                            shape: BoxShape
                                                                .circle),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: CachedNetworkImage(
                                                      imageUrl: postModel[index]
                                                          .photo
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      placeholder:
                                                          (context, url) =>
                                                              Center(
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: k006D77,
                                                          size: 10,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          postModel[index]
                                                              .name
                                                              .toString(),
                                                          style:
                                                              kManRope_500_16_Black),
                                                      Text(
                                                          DateTime.now()
                                                                      .difference(DateTime.parse(postModel[
                                                                              index]
                                                                          .dateTime
                                                                          .toString()))
                                                                      .inMinutes <=
                                                                  59
                                                              ? "${DateTime.now().difference(DateTime.parse(postModel[index].dateTime.toString())).inMinutes} min ago"
                                                              : DateTime.now()
                                                                          .difference(DateTime.parse(postModel[index]
                                                                              .dateTime
                                                                              .toString()))
                                                                          .inHours <=
                                                                      23
                                                                  ? "${DateTime.now().difference(DateTime.parse(postModel[index].dateTime.toString())).inHours} hour ago"
                                                                  : "${DateTime.now().difference(DateTime.parse(postModel[index].dateTime.toString())).inDays} day ago",
                                                          style:
                                                              kManRope_400_12_626A6A),
                                                      // SizedBox(height: 8.h),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _postbottomsheet(index);
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Image.asset(
                                                  "assets/images/Frame 8565.png",
                                                  height: 48.h,
                                                  width: 48.w,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 17.h),
                                      isLoading
                                          ? SizedBox()
                                          : postModel[index].gallary!.isNotEmpty
                                              ? PostImgBuilder(
                                                  postModel: postModel,
                                                  index: index,
                                                )
                                              : Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: ReadMoreText(
                                                    postModel[index]
                                                        .caption
                                                        .toString(),
                                                    style:
                                                        kManRope_400_14_626A6A,
                                                    trimLines: 1,
                                                    colorClickableText: k006D77,
                                                    trimMode: TrimMode.Line,
                                                    trimCollapsedText:
                                                        'Show more',
                                                    trimExpandedText:
                                                        'Show less',
                                                    moreStyle:
                                                        kManRope_600_14_006D77,
                                                    lessStyle:
                                                        kManRope_600_14_006D77,
                                                  ),
                                                ),
                                      if (postModel[index].gallary!.isNotEmpty)
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                      UPostInteractions(
                                        savedPost: "no",
                                        isCommentsViewable:
                                            widget.isCommentsViewable,
                                        modelList: postModel,
                                        index: index,
                                      ),
                                      if (postModel[index].gallary!.isNotEmpty)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: ReadMoreText(
                                            postModel[index].caption.toString(),
                                            style: kManRope_400_14_626A6A,
                                            trimLines: 1,
                                            colorClickableText: k006D77,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: 'Show more',
                                            trimExpandedText: 'Show less',
                                            moreStyle: kManRope_600_14_006D77,
                                            lessStyle: kManRope_600_14_006D77,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (_postCount >= 10 && isLoading) {
                              return Center(
                                child: SpinKitThreeBounce(
                                  color: k006D77,
                                  size: 20,
                                ),
                              );
                            } else if (_postCount < 10) {
                              return SizedBox.shrink();
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 40.h);
                          },
                        ),
                      ),
                    ),
                  ),
          ),
          Positioned(
            bottom: 200,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(
                        MaterialPageRoute(builder: (context) => UCreatePost()))
                    .then((value) {
                  setState(() {
                    isLoading = true;
                  });
                  getData();
                });
              },
              child: SvgPicture.asset(
                'assets/icons/addPost_1.svg',
                height: 72.h,
                width: 72.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBottomSheet extends StatefulWidget {
  final List<UserPostModel> postModel;
  final int index;
  final Function(String) onPop;
  final String savedPost;
  final String postedBy;
  const MenuBottomSheet(
      {Key? key,
      required this.postModel,
      required this.index,
      required this.postedBy,
      required this.savedPost,
      required this.onPop})
      : super(key: key);

  @override
  State<MenuBottomSheet> createState() => _MenuBottomSheet();
}

class _MenuBottomSheet extends State<MenuBottomSheet> {
  void _reportbottomsheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => ReportBottomSheet(
              postModel: widget.postModel,
              index: widget.index,
              savedPost: widget.savedPost,
            ));
  }

  @override
  void initState() {
    if (widget.postModel[widget.index].isSaved == 0) {
      savedText = "Save";
    } else {
      savedText = "Unsave";
    }
    super.initState();
  }

  String savedText = "Save";

  //int _gIndex = 0;
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
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  final resp = UserSavePostApi().get(
                      postId: widget.savedPost == "yes"
                          ? widget.postModel[widget.index].postId.toString()
                          : widget.postModel[widget.index].id.toString(),
                      postType:
                          widget.postModel[widget.index].postedBy.toString());
                  resp.then((value) {
                    setState(() {
                      if (value['status'] == true) {
                        if (value['message'] == "Saved") {
                          //isSaved = 1;
                          widget.postModel[widget.index].isSaved = 1;
                          Navigator.of(context).pop();
                          widget.onPop("Save");
                        } else {
                          //isSaved = 0;
                          widget.postModel[widget.index].isSaved = 0;
                          Navigator.of(context).pop();
                          widget.onPop("Save");
                        }
                      }
                    });
                  });
                },
                child: Container(
                  height: 50.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    savedText,
                    style: kManRope_500_16_626A6A,
                  )),
                ),
              ),
              SizedBox(height: 8.h),
              widget.postModel[widget.index].postByMe.toString() == "0"
                  ? Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            final resp = HidePostApi().get(
                                postId: widget.savedPost == "yes"
                                    ? widget.postModel[widget.index].postId
                                        .toString()
                                    : widget.postModel[widget.index].id
                                        .toString(),
                                postType: widget
                                    .postModel[widget.index].postedBy
                                    .toString());
                            resp.then((value) {
                              if (value['status'] == true) {
                                Navigator.of(context).pop();
                                widget.onPop("Hide");
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Something went wrong. Please try again.");
                                Navigator.of(context).pop();
                              }
                            });
                          }),
                          child: Container(
                            height: 44.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Colors.transparent,
                            ),
                            child: Center(
                                child: Text(
                              'Hide',
                              style: kManRope_500_16_626A6A,
                            )),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        GestureDetector(
                          onTap: () => setState(() {
                            Navigator.of(context).pop();
                            _reportbottomsheet();
                          }),
                          child: Container(
                            height: 44.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Colors.transparent,
                            ),
                            child: Center(
                                child: Text(
                              'Report',
                              style: kManRope_500_16_626A6A,
                            )),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        final resp = DeletePostApi().get(
                            postedBy: widget.postedBy,
                            postId: widget.savedPost == "yes"
                                ? widget.postModel[widget.index].postId
                                    .toString()
                                : widget.postModel[widget.index].id.toString());
                        resp.then((value) {
                          if (value['status'] == true) {
                            Navigator.of(context).pop();
                            widget.onPop("Delete");
                            Fluttertoast.showToast(
                                msg: "Post deleted successfully.");
                          } else {
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(msg: value['error']);
                          }
                        });
                      },
                      child: Container(
                        height: 44.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'Delete',
                          style: kManRope_500_16_626A6A,
                        )),
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}

class PostImgBuilder extends StatefulWidget {
  final List<UserPostModel> postModel;
  final int index;
  const PostImgBuilder({Key? key, required this.postModel, required this.index})
      : super(key: key);

  @override
  State<PostImgBuilder> createState() => _PostImgBuilderState();
}

class _PostImgBuilderState extends State<PostImgBuilder> {
  int imgIndex = 0;
  final PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 550.h,
            width: 1.sw,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black87,
            ),
            child: PageView.builder(
                itemCount: widget.postModel[widget.index].gallary!.length,
                controller: page,
                onPageChanged: (val) {
                  setState(() {
                    imgIndex = val;
                  });
                },
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                itemBuilder: (BuildContext context, ind) {
                  return CachedNetworkImage(
                    // height: 600.sh,
                    width: 1.sw,
                    imageUrl:
                        widget.postModel[widget.index].gallary![ind].toString(),
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => Center(
                      child: SpinKitThreeBounce(
                        color: k006D77,
                        size: 30,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                })),
        Positioned(
            right: 10,
            top: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "${imgIndex + 1}/${widget.postModel[widget.index].gallary!.length}",
                style: kManRope_400_14_white,
              ),
            ))
      ],
    );
  }
}
