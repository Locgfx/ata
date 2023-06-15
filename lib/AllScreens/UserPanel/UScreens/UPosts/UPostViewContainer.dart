import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:readmore/readmore.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_posts_model/user_posts_model.dart';
import '../../UWidgets/UPostWidget/UPostInteractions.dart';
import 'UPostPage.dart';

class UPostViewContainer extends StatefulWidget {
  final bool isCommentsViewable;
  final UserPostModel model;
  const UPostViewContainer({
    Key? key,
    required this.isCommentsViewable,
    required this.model,
  }) : super(key: key);

  @override
  State<UPostViewContainer> createState() => _UPostViewContainerState();
}

class _UPostViewContainerState extends State<UPostViewContainer> {
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
                    //postModel.removeAt(index);
                  });
                } else {
                  setState(() {
                    // isLoading = true;
                  });
                  //getData();
                }
              },
              postModel: [widget.model],
              index: index,
            ));
  }

  int imgIndex = 0;
  PageController page = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: Colors.white, shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: widget.model.photo.toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: SpinKitThreeBounce(
                              color: k006D77,
                              size: 10,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.model.name.toString(),
                              style: kManRope_500_16_Black),
                          Text(
                              DateTime.now()
                                          .difference(DateTime.parse(
                                              widget.model.dateTime.toString()))
                                          .inMinutes <=
                                      59
                                  ? "${DateTime.now().difference(DateTime.parse(widget.model.dateTime.toString())).inMinutes} min ago"
                                  : DateTime.now()
                                              .difference(DateTime.parse(widget
                                                  .model.dateTime
                                                  .toString()))
                                              .inHours <=
                                          23
                                      ? "${DateTime.now().difference(DateTime.parse(widget.model.dateTime.toString())).inHours} hour ago"
                                      : "${DateTime.now().difference(DateTime.parse(widget.model.dateTime.toString())).inDays} day ago",
                              style: kManRope_400_12_626A6A),
                          // SizedBox(height: 8.h),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _postbottomsheet(0);
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
          widget.model.gallary!.isNotEmpty
              ? Stack(
                  children: [
                    Container(
                        height: 285.h,
                        width: 380.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: PageView.builder(
                            itemCount: widget.model.gallary!.length,
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
                                imageUrl: widget.model.gallary![ind].toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: SpinKitThreeBounce(
                                    color: k006D77,
                                    size: 30,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              );
                            })),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "${imgIndex + 1}/${widget.model.gallary!.length}",
                            style: kManRope_400_14_white,
                          ),
                        ))
                  ],
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: ReadMoreText(
                    widget.model.caption.toString(),
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
          SizedBox(
            height: 8.h,
          ),
          UPostInteractions(
            savedPost: "no",
            isCommentsViewable: false,
            modelList: [widget.model],
            index: 0,
          ),
          if (widget.model.gallary!.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: ReadMoreText(
                widget.model.caption.toString(),
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
    );
  }
}
