import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UAllcomments.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UPostPage.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/my_activities/my_activities.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets/PostBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:readmore/readmore.dart';

import '../../../../model/UModels/user_posts_model/user_posts_model.dart';
import '../../../../widgets/loadingWidget.dart';
import '../../UWidgets/UPostWidget/UPostInteractions.dart';

class UMyActivityScreen extends StatefulWidget {
  const UMyActivityScreen({Key? key}) : super(key: key);

  @override
  State<UMyActivityScreen> createState() => _UMyActivityScreenState();
}

class _UMyActivityScreenState extends State<UMyActivityScreen> {
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
                  _getData();
                }
              },
              postModel: postModel,
              index: index,
            ));
  }

  List<UserPostModel> postModel = [];
  int scroll = 0;
  int _postCount = 0;
  bool isLoading = false;

  _getReloadedData() {
    scroll++;
    isLoading = true;
    final resp = MyActivity().get(scroll: "$scroll");
    resp.then((value) {
      log(value.toString());
      if (mounted) {
        postModel.clear();
        _postCount = value.length;
        setState(() {
          for (var v in value) {
            postModel.add(UserPostModel.fromJson(v));
          }
          //log(postModel.toString());
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  _getData() {
    isLoading = true;
    final resp = MyActivity().get(scroll: "0");
    resp.then((value) {
      log(value.toString());
      if (mounted) {
        postModel.clear();
        _postCount = value.length;
        setState(() {
          for (var v in value) {
            postModel.add(UserPostModel.fromJson(v));
          }
          //log(postModel.toString());
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  int imgIndex = 0;
  PageController page = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
          hasThreeDots: false,
          appBarText: "My activity",
          imgPath: "assets/images/iconbackappbar2.png"),
      body: isLoading
          ? Container(
              //padding: EdgeInsets.only(bottom: 159.0),
              child: LoadingWidget(),
            )
          : postModel.isEmpty
              ? Container(
                  width: 1.sw,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Image.asset(
                        "assets/images/emptypost.png",
                        height: 220,
                        width: 265,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "You haven't posted anything yet.",
                        style: kManRope_500_16_404040,
                      )
                    ],
                  ),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.w, right: 24.h, bottom: 20.h),
                      child: LazyLoadScrollView(
                        onEndOfPage: () {
                          if (_postCount >= 10) {
                            _getReloadedData();
                          }
                        },
                        child: ListView.separated(
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
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle),
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            postModel[index]
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
                                                                        .difference(DateTime.parse(postModel[index]
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
                                                      clipBehavior:
                                                          Clip.hardEdge,
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
                                                          onPageChanged: (val) {
                                                            setState(() {
                                                              imgIndex = val;
                                                            });
                                                          },
                                                          controller: page,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          pageSnapping: true,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  ind) {
                                                            return CachedNetworkImage(
                                                              imageUrl: postModel[
                                                                      index]
                                                                  .gallary![ind]
                                                                  .toString(),
                                                              fit: BoxFit.cover,
                                                              placeholder:
                                                                  (context,
                                                                          url) =>
                                                                      Center(
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color:
                                                                      k006D77,
                                                                  size: 30,
                                                                ),
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            );
                                                          })),
                                                  Positioned(
                                                      right: 10,
                                                      top: 10,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.black45,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
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
                                          isCommentsViewable: true,
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
                            itemCount: postModel.length + 1),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
    );
  }
}
