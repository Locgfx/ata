import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/see_all_videos.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class AllVideos extends StatefulWidget {
  const AllVideos({Key? key}) : super(key: key);

  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  // final controller = PageController(viewportFraction: 0.8, keepPage: true);

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }
  //
  //
  // UserVideoCategoryModel model = UserVideoCategoryModel();
  // bool _isLoading = false;
  // getData() {
  //   _isLoading = true;
  //   final resp = UserVideoCategoryApi().get();
  //   resp.then((value) {
  //     print(value);
  //     setState(() {
  //       try {
  //         model = UserVideoCategoryModel.fromJson(value);
  //         // print(model.text);
  //         _isLoading = false;
  //       } catch (e) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       }
  //     });
  //   });
  // }
  //


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
          hasThreeDots: false,
          appBarText: "All videos",
          imgPath: "assets/images/iconbackappbar2.png"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
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
                      )).searchFieldBigIconDecoration(),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SeeAllVideos()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending Videos',
                        style: kManRope_700_16_001314,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SeeAllVideos())),
                        child: Text(
                          'See all',
                          style: kManRope_500_16_006D77,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                height: 260.h,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Image.asset(
                            'assets/images/yogavideodemo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Name xyz',
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
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fitness Videos',
                      style: kManRope_700_16_001314,
                    ),
                    Text(
                      'See all',
                      style: kManRope_500_16_006D77,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                height: 260.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Image.asset(
                            'assets/images/fitnessvideodemo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Name xyz',
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
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
