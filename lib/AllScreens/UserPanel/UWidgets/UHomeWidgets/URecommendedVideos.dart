import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_recommended_videos_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/model/UModels/user_home_models/user_recommended_videos.dart';

class URecommendedVideosSlider extends StatefulWidget {
  const URecommendedVideosSlider({Key? key}) : super(key: key);

  @override
  State<URecommendedVideosSlider> createState() => _URecommendedVideosSliderState();
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
      print(value);
      if(mounted){
        setState(() {
          for (var v in value) {
            recommendedVideos.add(UserRecommendedVideoModel.fromJson(v));
          }
          _isLoading = false;
        });}
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading || recommendedVideos.isEmpty ? SizedBox() :SizedBox(
      height: 160.h,
      child: ListView.builder(
        itemCount: recommendedVideos.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Container(
            width: 248.w,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(left: 24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: recommendedVideos[i]
                  .videoPoster
                  .toString(),fit: BoxFit.cover,
              placeholder: (context, url) =>  Center(
                child: SpinKitThreeBounce(
                  color: k006D77,
                  size: 20,
                ),
              ),
              errorWidget: (context, url, error) =>  Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
