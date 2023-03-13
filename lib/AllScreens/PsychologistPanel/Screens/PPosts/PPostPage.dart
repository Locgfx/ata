import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PPosts/PCreatePost.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_posts_api.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_posts_model/user_posts_model.dart';
import 'package:greymatter/widgets/BottomSheets/PostBottomSheet.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:readmore/readmore.dart';
import '../../../../constants/colors.dart';
import '../../../UserPanel/UScreens/UPosts/UPostPage.dart';
import '../../../UserPanel/UWidgets/UPostWidget/UPostInteractions.dart';

class PPostPage extends StatefulWidget {
  const PPostPage({Key? key}) : super(key: key);

  @override
  State<PPostPage> createState() => _PPostPageState();
}

class _PPostPageState extends State<PPostPage> {
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

  void _postbottomsheet(int index) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => MenuBottomSheet(
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

  int _postCount = 0;

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
                        EdgeInsets.only(left: 24.w, right: 24.h, bottom: 200.h),
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        if (_postCount >= 10) {
                          getReloadedData();
                        }
                      },
                      isLoading: isLoading,
                      child: ListView.separated(
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
                                                          shape:
                                                              BoxShape.circle),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: CachedNetworkImage(
                                                    imageUrl: postModel[index]
                                                        .photo
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                      child: SpinKitThreeBounce(
                                                        color: k006D77,
                                                        size: 10,
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                                SizedBox(width: 8.w),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                        : Stack(
                                            children: [
                                              Container(
                                                  height: 285.h,
                                                  width: 380.w,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.white,
                                                  ),
                                                  child: PageView.builder(
                                                      itemCount:
                                                          postModel[index]
                                                              .gallary!
                                                              .length,
                                                      controller: page,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      onPageChanged: (val) {
                                                        setState(() {
                                                          imgIndex = val;
                                                        });
                                                      },
                                                      pageSnapping: true,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              ind) {
                                                        return CachedNetworkImage(
                                                          imageUrl:
                                                              postModel[index]
                                                                  .gallary![ind]
                                                                  .toString(),
                                                          fit: BoxFit.cover,
                                                          placeholder:
                                                              (context, url) =>
                                                                  Center(
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: k006D77,
                                                              size: 30,
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        );
                                                      })),
                                              Positioned(
                                                  right: 10,
                                                  top: 10,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black45,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Text(
                                                      "${imgIndex + 1}/${postModel[index].gallary!.length}",
                                                      style:
                                                          kManRope_400_14_white,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    UPostInteractions(
                                      savedPost: "no",
                                      isCommentsViewable: false,
                                      //widget.isCommentsViewable,
                                      modelList: postModel,
                                      index: index,
                                    ),
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
                              child: CircularProgressIndicator(),
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
          Positioned(
            bottom: 180,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => PCreatePostScreen()))
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
