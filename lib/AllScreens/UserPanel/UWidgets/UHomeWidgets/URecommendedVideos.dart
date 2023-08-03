import 'dart:developer';

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
      log(value.toString() + "vodeos");
      if (mounted) {
        setState(() {
          if (value.runtimeType == List<dynamic>) {
            for (var v in value) {
              recommendedVideos.add(UserRecommendedVideoModel.fromJson(v));
            }
          } else {}
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
                    margin: EdgeInsets.only(right: 16, left: 8),
                    height: 200,
                    width: 280,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl:
                                recommendedVideos[i].videoPoster.toString(),
                            fit: BoxFit.cover,
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
                        Center(
                          child: SizedBox(
                              width: 50,
                              child: Image.asset('assets/images/youtube.png')),
                        ),
                      ],
                    ),
                  ),
                  // child: Container(
                  //   width: 248.w,
                  //   clipBehavior: Clip.hardEdge,
                  //   margin:
                  //       EdgeInsets.only(right: 24.w, left: i == 0 ? 24.w : 0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       SizedBox(
                  //         width: 248.w,
                  //         child: CachedNetworkImage(
                  //           imageUrl:
                  //               recommendedVideos[i].videoPoster.toString(),
                  //           fit: BoxFit.fitWidth,
                  //           placeholder: (context, url) => Opacity(
                  //             opacity: 0.9,
                  //             child: Shimmer.fromColors(
                  //               child: Container(
                  //                 width: 1.sw,
                  //                 height: 160,
                  //                 margin: EdgeInsets.symmetric(horizontal: 16),
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   borderRadius: BorderRadius.circular(24),
                  //                 ),
                  //               ),
                  //               baseColor: Colors.black12,
                  //               highlightColor: Colors.white,
                  //             ),
                  //           ),
                  //           errorWidget: (context, url, error) =>
                  //               Icon(Icons.error),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //           width: 50,
                  //           child: Image.asset('assets/images/youtube.png')),
                  //     ],
                  //   ),
                  // ),
                );
              },
            ),
          );
  }
}
