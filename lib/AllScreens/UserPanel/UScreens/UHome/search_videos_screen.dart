import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/search_video.dart';
import 'package:greymatter/model/UModels/user_home_models/search_video_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../constants/fonts.dart';
import '../../../../widgets/shared/video_player.dart';

class SearchVideosScreen extends StatefulWidget {
  const SearchVideosScreen({Key? key}) : super(key: key);

  @override
  State<SearchVideosScreen> createState() => _SearchVideosScreenState();
}

class _SearchVideosScreenState extends State<SearchVideosScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  List<SearchVideoModel> _modelList = [];
  int _scroll = 0;
  int _itemCount = 0;
  String _string = '';
  _getData() {
    final resp = SearchVideo().get(search: _controller.text, start: "0");
    resp.then((value) {
      log(value.toString());
      _modelList.clear();
      if (value == false) {
        setState(() {
          _isLoading = false;
        });
      } else {
        if (value.runtimeType == List<dynamic>) {
          setState(() {
            _string = "";
            for (var v in value) {
              _modelList.add(SearchVideoModel.fromJson(v));
            }
            _isLoading = false;
          });
        } else {
          _string = "No videos found.";
          setState(() {
            _isLoading = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 60.w,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Search Videos',
          style: kManRope_500_16_006D77,
        ),
        titleSpacing: 0.w,
        leading: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(
          children: [
            Container(
              height: 56.h,
              // margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: CustomDecoration().outline5A72EDDecoration(),
              child: TextField(
                controller: _controller,
                autofocus: true,
                decoration: TextfieldDecoration(
                        label: 'Search videos',
                        hintstyle: kManRope_400_14_626A6A)
                    .whiteColorSearchField(() {
                  if (_controller.text.length > 1) {
                    print("object");
                    setState(() {
                      _isLoading = true;
                    });
                    _getData();
                  }
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _isLoading
                ? Center(
                    child: SpinKitThreeBounce(
                      color: k006D77,
                      size: 30,
                    ),
                  )
                : _string != ""
                    ? Center(
                        child: Text(_string),
                      )
                    : Flexible(
                        child: ListView.separated(
                            //physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => VideoPlayerWidget(
                                            videoLink: _modelList[index]
                                                .video
                                                .toString()),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 1.sw,
                                        height: 200.h,
                                        clipBehavior: Clip.hardEdge,
                                        //margin: EdgeInsets.only(right: 24.w, left: i == 0 ? 24.w : 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: 1.sw,
                                              child: CachedNetworkImage(
                                                imageUrl: _modelList[index]
                                                    .videoPoster
                                                    .toString(),
                                                fit: BoxFit.fitWidth,
                                                placeholder: (context, url) =>
                                                    Opacity(
                                                  opacity: 0.9,
                                                  child: Shimmer.fromColors(
                                                    child: Container(
                                                      width: 1.sw,
                                                      height: 160,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                    ),
                                                    baseColor: Colors.black12,
                                                    highlightColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                            SizedBox(
                                                width: 50,
                                                child: Image.asset(
                                                    'assets/images/youtube.png')),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        _modelList[index].name.toString(),
                                        style: kManRope_500_16_001314,
                                      ),
                                    ],
                                  ),
                                ),
                            separatorBuilder: (ctx, ind) => SizedBox(
                                  height: 12,
                                ),
                            itemCount: _modelList.length),
                      )
          ],
        ),
      ),
    );
  }
}
