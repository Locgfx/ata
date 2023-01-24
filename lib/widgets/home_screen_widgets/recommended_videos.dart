import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/all_videos.dart';
import 'package:greymatter/constants/colors.dart';
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
    'assets/images/nature.png', 'assets/images/nature.png', 'assets/images/nature.png',


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
          Container(
            // height: 223.h,
            // width: 1.sw,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                padEnds: false,
                height: 140.h,
                onPageChanged: (index, reason) {
                  setState(() {
                    _indexx = index;
                  });
                  print(_indexx);
                },
                aspectRatio: 2,
                viewportFraction: 0.6,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: false,
              ),
              itemBuilder:
                  (BuildContext context, int index, int realIndex) {
                return Container(
                  height: 140.h,
                  width: 248.w,
                  padding: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(_bgImagevideoList[index],),
                        fit: BoxFit.cover
                    ),
                  ),
                );
              },
              itemCount: _bgImagevideoList.length,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: k5A72ED.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: AnimatedContainer(
                      alignment: Alignment.centerLeft,
                      // height: 4,
                      width:  24 ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color:  _indexx == index
                            ? k5A72ED
                            : Colors.transparent,
                      ), duration: Duration(milliseconds: 100),
                    ),
                  );
                },
                ),
              ),
            ],
          ),
          // Container(
          //   padding: EdgeInsets.only(left: 24),
          //   width: 1.sw,
          //   height: 190.h,
          //   child: ListView.separated(
          //     separatorBuilder: (ctx, ind) => SizedBox(
          //       width: 16.w,
          //     ),
          //     itemCount: 3,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (BuildContext context, int realIndex) {
          //       return Container(
          //         width: 248.w,
          //         height: 140.h,
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Image.asset('assets/images/nature.png'),
          //             SizedBox(height: 8.h),
          //             Text(
          //               'Nature',
          //               style: kManRope_500_16_001314,
          //             )
          //           ],
          //         ),
          //       );
          //     },
          //     /* options: CarouselOptions(
          //         onPageChanged: (index, reason) {
          //           setState(() {
          //             _index2 = index;
          //           });
          //         },
          //         aspectRatio: 16 / 8,
          //         viewportFraction: 0.8,
          //         reverse: false,
          //         enableInfiniteScroll: false),*/
          //   ),
          // ),
          // /* dots for
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 4.h,
          //       decoration: BoxDecoration(
          //         color: k5A72ED.withOpacity(0.15),
          //         borderRadius: BorderRadius.circular(2),
          //       ),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           AnimatedContainer(
          //             width: 24.w,
          //             decoration: BoxDecoration(
          //               color: _index2 == 0 ? k5A72ED : Colors.transparent,
          //               borderRadius: BorderRadius.circular(2),
          //             ),
          //             duration: const Duration(milliseconds: 200),
          //           ),
          //           AnimatedContainer(
          //             width: 24.w,
          //             decoration: BoxDecoration(
          //               color: _index2 == 1 ? k5A72ED : Colors.transparent,
          //               borderRadius: BorderRadius.circular(2),
          //             ),
          //             duration: const Duration(milliseconds: 200),
          //           ),
          //           AnimatedContainer(
          //             width: 24.w,
          //             decoration: BoxDecoration(
          //               color: _index2 == 2 ? k5A72ED : Colors.transparent,
          //               borderRadius: BorderRadius.circular(2),
          //             ),
          //             duration: const Duration(milliseconds: 200),
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),*/
          SizedBox(height: 16.h),
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
