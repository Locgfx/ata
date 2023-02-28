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
import 'package:readmore/readmore.dart';
import '../../../../constants/colors.dart';

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

  getData() {
    isLoading = true;
    final resp = UserPostApi().get(scroll: 0.toString());
    resp.then((value) {
      print(value);
      if (mounted) {
        setState(() {
          for (var v in value) {
            postModel.add(UserPostModel.fromJson(v));
          }
          isLoading = false;
        });
      }
    });
  }

  void _postbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const PostBottomSheet());
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
                        EdgeInsets.only(left: 24.w, right: 24.h, bottom: 159),
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
                                                // SizedBox(height: 1.h),
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
                                          _postbottomsheet();
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
                                SizedBox(
                                  height: 48.h,
                                  width: 1.sw,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 48.h,
                                            width: 73.w,
                                            // color: Colors.red,

                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/iconlike24.png',
                                                    height: 24.h,
                                                    width: 24.w,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12.w),
                                                    child: Text('375',
                                                        style:
                                                            kManRope_400_14_626A6A),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // if (widget.isCommentsViewable) {
                                              // Navigator.of(context).push(
                                              // MaterialPageRoute(
                                              // builder: (context) => const UCommentPage(),
                                              // ),
                                              // );
                                              // }
                                            },
                                            child: Container(
                                              height: 48.h,
                                              width: 75.w,
                                              color: Colors.transparent,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      // if (widget.isCommentsViewable) {
                                                      // Navigator.of(context).push(
                                                      // MaterialPageRoute(
                                                      // builder: (context) =>
                                                      // const UCommentPage(),
                                                      // ),
                                                      // );
                                                      // }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12),
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
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Text('20',
                                                      style:
                                                          kManRope_400_14_626A6A),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 48,
                                            width: 48,
                                            // color: Colors.red,
                                            child: Image.asset(
                                              'assets/images/iconbookmark48.png',
                                              height: 48,
                                              width: 48,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 8.w,
                                          // ),
                                          SizedBox(
                                            height: 48,
                                            width: 48,
                                            // color: Colors.red,
                                            child: Image.asset(
                                              'assets/images/iconshare48.png',
                                              height: 44,
                                              width: 44,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PCreatePostScreen()));
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
