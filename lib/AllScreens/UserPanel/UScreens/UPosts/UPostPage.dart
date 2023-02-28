import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UAllcomments.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UPostWidget/UPostInteractions.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_posts_api.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_posts_model/user_posts_model.dart';
import 'package:greymatter/widgets/BottomSheets/PostBottomSheet.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

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

class _UPostPageState extends State<UPostPage>
    with AutomaticKeepAliveClientMixin {
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
  getData() {
    isLoading = true;
    final resp = UserPostApi().get(scroll: 0.toString());
    resp.then((value) {
      log(value.toString());
      if (mounted) {
        postModel.clear();
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

  void _postbottomsheet(int index) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => MenuBottomSheet(
              onPop: () {
                setState(() {
                  isLoading = true;
                });
                getData();
              },
              postModel: postModel,
              index: index,
            ));
  }

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
                    child: ListView.separated(
                      itemCount: postModel.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: index == 0 ? 40 : 0),
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
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              clipBehavior: Clip.hardEdge,
                                              child: CachedNetworkImage(
                                                imageUrl: postModel[index]
                                                    .photo
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
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
                                                Text('2 hours ago',
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
                                    : Container(
                                        height: 285.h,
                                        width: 380.w,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                        ),
                                        child: PageView.builder(
                                            itemCount: postModel[index]
                                                .gallary!
                                                .length,
                                            controller: page,
                                            scrollDirection: Axis.horizontal,
                                            pageSnapping: true,
                                            itemBuilder:
                                                (BuildContext context, ind) {
                                              return CachedNetworkImage(
                                                imageUrl: postModel[index]
                                                    .gallary![ind]
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: SpinKitThreeBounce(
                                                    color: k006D77,
                                                    size: 30,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              );
                                            })),
                                SizedBox(
                                  height: 8.h,
                                ),
                                UPostInteractions(
                                  isCommentsViewable: widget.isCommentsViewable,
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
                      },
                      separatorBuilder: (ctx, index) {
                        return SizedBox(height: 40.h);
                      },
                    ),
                  ),
          ),
          Positioned(
            bottom: 180,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UCreatePost()));
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class MenuBottomSheet extends StatefulWidget {
  final List<UserPostModel> postModel;
  final int index;
  final Function onPop;
  const MenuBottomSheet(
      {Key? key,
      required this.postModel,
      required this.index,
      required this.onPop})
      : super(key: key);

  @override
  State<MenuBottomSheet> createState() => _MenuBottomSheet();
}

class _MenuBottomSheet extends State<MenuBottomSheet> {
  void _reportbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const ReportBottomSheet());
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
                onTap: () => setState(() {
                  Share.share("text");
                  //Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Share',
                    style: kManRope_500_16_626A6A,
                  )),
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  final resp = UserSavePostApi().get(
                      postId: widget.postModel[widget.index].id.toString(),
                      postType:
                          widget.postModel[widget.index].postedBy.toString());
                  resp.then((value) {
                    setState(() {
                      if (value['status'] == true) {
                        if (value['message'] == "Saved") {
                          //isSaved = 1;
                          widget.postModel[widget.index].isSaved = 1;
                          Navigator.of(context).pop();
                          widget.onPop();
                        } else {
                          //isSaved = 0;
                          widget.postModel[widget.index].isSaved = 0;
                          Navigator.of(context).pop();
                          widget.onPop();
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
              GestureDetector(
                onTap: () => setState(() {
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
