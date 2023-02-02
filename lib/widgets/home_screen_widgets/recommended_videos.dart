import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/all_videos.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';

class RecommendedVideos extends StatefulWidget {
  const RecommendedVideos({Key? key}) : super(key: key);

  @override
  State<RecommendedVideos> createState() => _RecommendedVideosState();
}

class _RecommendedVideosState extends State<RecommendedVideos> {
  int _index2 = 0;
  int _indexx = 0;

  List _bgImagevideoList = [
    'assets/images/nature.png',
    'assets/images/nature.png',
    'assets/images/nature.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      //height: 376.h,
      // padding: EdgeInsets.only(bottom: 20.h),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended videos',
                  style: kManRope_700_16_001314,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Relax your mind with us',
                  style: kManRope_400_16_626A64_07,
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 160.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return Container(
                  width: 248.w,
                  margin: EdgeInsets.only(left: 24.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(
                          _bgImagevideoList[i],
                        ),
                        fit: BoxFit.cover),
                  ),
                );
              },
              itemCount: _bgImagevideoList.length,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              width: 1.sw,
              height: 56.h,
              child: CustomSecondaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllVideos()));
                },
                text: 'View All Videos',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
