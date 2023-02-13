import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/USeelAllVideosScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_all_videos_api.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_video_category_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_all_videos_model.dart';
import 'package:greymatter/model/UModels/user_home_models/user_video_category_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

class UAllVideosScreen extends StatefulWidget {
  const UAllVideosScreen({Key? key}) : super(key: key);

  @override
  State<UAllVideosScreen> createState() => _UAllVideosScreenState();
}

class _UAllVideosScreenState extends State<UAllVideosScreen> {
  // final controller = PageController(viewportFraction: 0.8, keepPage: true);



  @override
  void initState() {
    getData();
    getVideosData();
    super.initState();
  }

  UserVideoCategoryModel model = UserVideoCategoryModel();
  List<UserVideoCategoryModel> topvideolistcategory = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserVideoCategoryApi().get();
    resp.then((value) {
      print(value);
      if(mounted){
        setState(() {
          for (var v in value) {
            topvideolistcategory.add(UserVideoCategoryModel.fromJson(v));
          }
          _isLoading = false;
        });}
    });
  }


  UserAllVideosModel allvideos = UserAllVideosModel();
  List<UserAllVideosModel> allvideolist = [];

  getVideosData() {
    _isLoading = true;
    final resp = UserAllVideosApi().get();
    resp.then((value) {
      print(value);
      if(mounted){
        setState(() {
          for (var v in value) {
            allvideolist.add(UserAllVideosModel.fromJson(v));
          }
          _isLoading = false;
        });}
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
              appBarText: "All videos",
              imgPath: "assets/images/iconbackappbar2.png"),
          body: SingleChildScrollView(
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
                    child: TextField(
                      decoration: TextfieldDecoration(
                        label: 'Nature',
                        child: Image.asset(
                          "assets/images/iconsearchblue.png",
                          height: 48.h,
                          width: 48.w,
                        ),
                      ).searchFieldBigIconDecoration(),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 1.sh,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: topvideolistcategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    topvideolistcategory[index].name.toString(),
                                    style: kManRope_700_16_001314,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const USeeAllVideosScreen())),
                                    child: Text(
                                      'See all',
                                      style: kManRope_500_16_006D77,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            SizedBox(
                              height: 260.h,
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: allvideolist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Stack(
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
                                              imageUrl:
                                              allvideolist[index]
                                                  .videoPoster
                                                  .toString(),fit: BoxFit.cover,
                                              placeholder: (context, url) =>  Center(
                                                child: SpinKitThreeBounce(
                                                  color: k006D77,
                                                  size: 10,
                                                ),
                                              ),
                                              errorWidget: (context, url, error) =>  Icon(Icons.error),
                                            ),
                                          ),
                                          Image.asset("assets/images/youtube.png",height: 36,width: 36,)
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        allvideolist[index]
                                            .name
                                            .toString(),
                                        style: kManRope_500_16_001314,
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) =>
                                    SizedBox(
                                      width: 16.w,
                                    ),
                              ),
                            ),

                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            width: 16.w,
                          ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => const SeeAllVideos()));
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 24),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Trending Videos',
                  //           style: kManRope_700_16_001314,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () => Navigator.of(context).push(
                  //               MaterialPageRoute(
                  //                   builder: (context) => const SeeAllVideos())),
                  //           child: Text(
                  //             'See all',
                  //             style: kManRope_500_16_006D77,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  //
                  // SizedBox(
                  //   height: 24.h,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 24),
                  //   height: 260.h,
                  //   child: ListView.separated(
                  //     padding: EdgeInsets.zero,
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemCount: 4,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             height: 182.w,
                  //             width: 182.w,
                  //             clipBehavior: Clip.hardEdge,
                  //             decoration: const BoxDecoration(
                  //               color: Colors.grey,
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(20)),
                  //             ),
                  //             child: Image.asset(
                  //               'assets/images/yogavideodemo.png',
                  //               fit: BoxFit.fill,
                  //             ),
                  //           ),
                  //           SizedBox(height: 16),
                  //           Text(
                  //             'Name xyz',
                  //             style: kManRope_500_16_001314,
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         SizedBox(
                  //       width: 16.w,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 24),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Fitness Videos',
                  //         style: kManRope_700_16_001314,
                  //       ),
                  //       Text(
                  //         'See all',
                  //         style: kManRope_500_16_006D77,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 24.h,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 24),
                  //   height: 260.h,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemCount: 4,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             height: 182.w,
                  //             width: 182.w,
                  //             clipBehavior: Clip.hardEdge,
                  //             decoration: const BoxDecoration(
                  //               color: Colors.grey,
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(20)),
                  //             ),
                  //             child: Image.asset(
                  //               'assets/images/fitnessvideodemo.png',
                  //               fit: BoxFit.fill,
                  //             ),
                  //           ),
                  //           SizedBox(height: 16),
                  //           Text(
                  //             'Name xyz',
                  //             style: kManRope_500_16_001314,
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         SizedBox(
                  //       width: 16.w,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
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
