import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/search_videos_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_video_category_api.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_home_models/user_all_videos_model.dart';
import '../../../../widgets/shared/video_player.dart';

class USeeAllVideosScreen extends StatefulWidget {
  final String categoryId;
  const USeeAllVideosScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<USeeAllVideosScreen> createState() => _USeeAllVideosScreenState();
}

class _USeeAllVideosScreenState extends State<USeeAllVideosScreen> {
  List<Videos> modelList = [];

  bool _isLoading = false;
  int _scroll = 0;
  int _dataLength = 0;

  _getReloadedData() {
    _scroll++;
    // _isLoading = true;
    final resp = UserVideoCategoryApi()
        .get(categoryId: widget.categoryId, scroll: "$_scroll");
    resp.then((value) {
      setState(() {
        _dataLength = value.length;
        for (var v in value) {
          modelList.add(Videos.fromJson(v));
        }
        //_isLoading = false;
      });
    });
  }

  _getData() {
    _isLoading = true;
    final resp =
        UserVideoCategoryApi().get(categoryId: widget.categoryId, scroll: "0");
    resp.then((value) {
      setState(() {
        _dataLength = value.length;
        for (var v in value) {
          modelList.add(Videos.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: "All videos",
        imgPath: "assets/images/iconbackappbar2.png",
      ),
      body: _isLoading
          ? Center(
              child: LoadingWidget(),
            )
          : Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
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
                            label: 'Search videos',
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
                  LazyLoadScrollView(
                    onEndOfPage: () async {
                      if (_dataLength >= 10) {
                        _getReloadedData();
                      }
                    },
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      //scrollDirection: Axis.vertical,
                      //physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 25.h,
                          childAspectRatio: 0.75),
                      itemCount: modelList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => VideoPlayerWidget(
                                        videoLink:
                                            modelList[index].video.toString()),
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 182.w,
                                    width: 182.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: modelList[index]
                                          .videoPoster
                                          .toString(),
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
                                  Image.asset(
                                    "assets/images/youtube.png",
                                    height: 36,
                                    width: 36,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              modelList[index].name.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: kManRope_500_16_001314,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }
}
