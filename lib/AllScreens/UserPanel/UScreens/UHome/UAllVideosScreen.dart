import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/USeelAllVideosScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/search_videos_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_all_videos_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_all_videos_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

import '../../../../widgets/shared/video_player.dart';

class UAllVideosScreen extends StatefulWidget {
  const UAllVideosScreen({Key? key}) : super(key: key);

  @override
  State<UAllVideosScreen> createState() => _UAllVideosScreenState();
}

class _UAllVideosScreenState extends State<UAllVideosScreen> {
  // final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (dataLength >= 10) {
          _getReloadedData();
        }
      }
    });
    _getData();
    super.initState();
  }

  bool _isLoading = false;

  int _scroll = 0;
  int dataLength = 0;

  final ScrollController _scrollController = ScrollController();
  List<UserAllVideoModel> modelList = [];
  _getReloadedData() {
    _scroll++;
    //_isLoading = true;
    final resp = UserAllVideosApi().get(scroll: "$_scroll");
    resp.then((value) {
      setState(() {
        dataLength = value.length;
        for (var v in value) {
          modelList.add(UserAllVideoModel.fromJson(v));
        }
        //_isLoading = false;
      });
    });
  }

  _getData() {
    _isLoading = true;
    final resp = UserAllVideosApi().get(scroll: "0");
    resp.then((value) {
      setState(() {
        dataLength = value.length;
        for (var v in value) {
          modelList.add(UserAllVideoModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kEDF6F9,
          appBar: CustomWhiteAppBar(
              hasThreeDots: false,
              appBarText: "All Videos",
              imgPath: "assets/images/iconbackappbar2.png"),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: kFFFFFF,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: k5A72ED.withOpacity(0.24))),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => SearchVideosScreen()));
                      },
                      child: IgnorePointer(
                        child: TextField(
                          decoration: TextfieldDecoration(
                            label: 'Search videos here',
                            child: Image.asset(
                              "assets/images/iconsearchblue.png",
                              height: 48.h,
                              width: 48.w,
                            ),
                          ).searchFieldBigIconDecoration(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    // height: 1.sh - 140.h,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: modelList.length + 1,
                      itemBuilder: (BuildContext context, int indexx) {
                        print(modelList.length);
                        if (indexx < modelList.length) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (modelList[indexx].videos!.isNotEmpty)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      modelList[indexx].name.toString(),
                                      style: kManRope_700_16_001314,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  USeeAllVideosScreen(
                                                    categoryId:
                                                        modelList[indexx]
                                                            .id
                                                            .toString(),
                                                  ))),
                                      child: Text(
                                        'See all',
                                        style: kManRope_500_16_006D77,
                                      ),
                                    ),
                                  ],
                                ),
                              if (modelList[indexx].videos!.isNotEmpty)
                                SizedBox(height: 24.h),
                              if (modelList[indexx].videos!.isNotEmpty)
                                SizedBox(
                                  height: 260.h,
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount:
                                        modelList[indexx].videos?.length ?? 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      VideoPlayerWidget(
                                                          videoLink: modelList[
                                                                  indexx]
                                                              .videos![index]
                                                              .video
                                                              .toString()),
                                                ),
                                              );
                                            },
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                Container(
                                                  height: 182.w,
                                                  width: 182.w,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: modelList[indexx]
                                                        .videos![index]
                                                        .videoPoster
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
                                                Image.asset(
                                                  "assets/images/youtube.png",
                                                  height: 36,
                                                  width: 36,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          SizedBox(
                                            width: 182.w,
                                            child: Text(
                                              modelList[indexx]
                                                  .videos![index]
                                                  .name
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: kManRope_500_16_001314,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            SizedBox(
                                      width: 16.w,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        } else if (dataLength < 10) {
                          return SizedBox.shrink();
                        } else if (_scrollController.position.maxScrollExtent ==
                            _scrollController.offset) {
                          return Center(
                              child: SpinKitThreeBounce(
                            color: k006D77,
                            size: 10,
                          ));
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: 16.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading) LoadingWidget()
      ],
    );
  }
}
