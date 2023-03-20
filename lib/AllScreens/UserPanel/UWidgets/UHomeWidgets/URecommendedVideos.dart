import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_recommended_videos_api.dart';
import 'package:greymatter/model/UModels/user_home_models/user_recommended_videos.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../widgets/shared/video_player.dart';

class URecommendedVideosSlider extends StatefulWidget {
  const URecommendedVideosSlider({Key? key}) : super(key: key);

  @override
  State<URecommendedVideosSlider> createState() =>
      _URecommendedVideosSliderState();
}

class _URecommendedVideosSliderState extends State<URecommendedVideosSlider> {
  int _index2 = 0;
  int _indexx = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  UserRecommendedVideoModel model = UserRecommendedVideoModel();
  List<UserRecommendedVideoModel> recommendedVideos = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserRecommendedVideosApi().get();
    resp.then((value) {
      //print(value);
      if (mounted) {
        setState(() {
          for (var v in value) {
            recommendedVideos.add(UserRecommendedVideoModel.fromJson(v));
          }
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading || recommendedVideos.isEmpty
        ? Opacity(
            opacity: 0.9,
            child: Shimmer.fromColors(
              child: SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: 240,
                      height: 160,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 240,
                      height: 160,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ],
                ),
              ),
              baseColor: Colors.black12,
              highlightColor: Colors.white,
            ),
          )
        : SizedBox(
            height: 160.h,
            child: ListView.builder(
              itemCount: recommendedVideos.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoPlayerWidget(
                            videoLink: recommendedVideos[i].video.toString()),
                      ),
                    );
                  },
                  child: Container(
                    width: 248.w,
                    clipBehavior: Clip.hardEdge,
                    margin:
                        EdgeInsets.only(right: 24.w, left: i == 0 ? 24.w : 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 1.sw,
                          child: CachedNetworkImage(
                            imageUrl:
                                recommendedVideos[i].videoPoster.toString(),
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) => Opacity(
                              opacity: 0.9,
                              child: Shimmer.fromColors(
                                child: Container(
                                  width: 1.sw,
                                  height: 160,
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                baseColor: Colors.black12,
                                highlightColor: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                            width: 50,
                            child: Image.asset('assets/images/youtube.png')),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
