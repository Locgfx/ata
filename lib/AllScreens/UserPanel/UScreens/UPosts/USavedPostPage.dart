import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UAllcomments.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/UCreatepost.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/user_saved_posts_api.dart';
import 'package:greymatter/model/UModels/user_posts_model/user_saved_posts_model.dart';
import 'package:greymatter/widgets/BottomSheets/PostBottomSheet.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:readmore/readmore.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_posts_model/user_posts_model.dart';
import '../../UWidgets/UPostWidget/UPostInteractions.dart';
import 'UPostPage.dart';

class USavedPostPage extends StatefulWidget {
  final bool isCommentsViewable;
  const USavedPostPage({Key? key, required this.isCommentsViewable})
      : super(key: key);

  @override
  State<USavedPostPage> createState() => _USavedPostPageState();
}

class _USavedPostPageState extends State<USavedPostPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  UserSavedPostsModel model = UserSavedPostsModel();
  List<UserPostModel> savedpostlist = [];

  bool isLoading = false;
  bool isLoading2 = false;

  Future<String> getData() async {
    isLoading = true;
    final resp = UserSavedPostsApi().get();
    resp.then((value) {
      log(value.toString());
      savedpostlist.clear();
      setState(() {
        for (var v in value) {
          savedpostlist.add(UserPostModel.fromJson(v));
        }
        isLoading = false;
      });
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
              savedPost: "yes",
              onPop: () {
                setState(() {
                  isLoading = true;
                });
                getData();
              },
              postModel: savedpostlist,
              index: index,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kEDF6F9,
      child: RefreshIndicator(
        onRefresh: () {
          setState(() {
            isLoading = true;
          });
          return getData();
        },
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
                  : savedpostlist.isEmpty
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
                                "You haven't saved any post yet.",
                                style: kManRope_500_16_404040,
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.h, bottom: 159),
                          child: ListView.separated(
                            itemCount: savedpostlist.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
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
                                                      imageUrl:
                                                          savedpostlist[index]
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
                                                          savedpostlist[index]
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
                                                  itemCount:
                                                      savedpostlist[index]
                                                          .gallary!
                                                          .length,
                                                  controller: page,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  pageSnapping: true,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          ind) {
                                                    return CachedNetworkImage(
                                                      imageUrl:
                                                          savedpostlist[index]
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
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      UPostInteractions(
                                        savedPost: "yes",
                                        isCommentsViewable:
                                            widget.isCommentsViewable,
                                        modelList: savedpostlist,
                                        index: index,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ReadMoreText(
                                          savedpostlist[index]
                                              .caption
                                              .toString(),
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
            /* Positioned(
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
            ),*/
          ],
        ),
      ),
    );
  }
}
