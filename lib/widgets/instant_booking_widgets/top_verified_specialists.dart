import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class TopVerifiedSpecialist extends StatefulWidget {
  const TopVerifiedSpecialist({Key? key}) : super(key: key);

  @override
  State<TopVerifiedSpecialist> createState() => _TopVerifiedSpecialistState();
}

class _TopVerifiedSpecialistState extends State<TopVerifiedSpecialist> {
  int _index = 0;

  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;

  //indicator handler
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        //print(currentPage);
      });
    });
    super.initState();
  }

  // List<String> images = [
  //   "assets/images/person1instant.png","assets/images/person1instant.png","assets/images/person1instant.png",
  //
  // ];

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 124.h,
    //   child: PageView(
    //     physics: BouncingScrollPhysics(),
    //     controller: _pageController,
    //     scrollDirection: Axis.horizontal,
    //     children: [
    //     Container(
    //     width: 200.w,
    //     height: 124.h,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(24),
    //       gradient: LinearGradient(colors: [
    //         k5A72ED.withOpacity(0.4),
    //         k83C5BE.withOpacity(0.4),
    //       ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.only(left: 24.h,top: 24.h),
    //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Connect within 60s',
    //                 style: kManRope_700_16_001314,
    //               ),
    //               SizedBox(height: 8.h),
    //               Text('Top verified Specialities',
    //                   style: kManRope_500_14_626A6A),
    //               SizedBox(height: 16.h),
    //               Text(
    //                 'Know More',
    //                 style: kManRope_500_16_006D77,
    //               )
    //             ],
    //           ),
    //           Expanded(
    //               child: Stack(
    //                 clipBehavior: Clip.none,
    //                 children: [
    //                   Positioned(
    //                     left: 0,
    //                     top: 20,
    //                     child: Container(
    //                       width: 48.w,
    //                       height: 48.h,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/images/person1instant.png"),fit: BoxFit.cover
    //                         ),
    //                         color: Colors.grey,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(color: Colors.white),
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 20,
    //                     top: 20,
    //                     child: Container(
    //                       width: 48.w,
    //                       height: 48.h,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/images/person2instant.png"),fit: BoxFit.cover
    //                         ),
    //                         color: Colors.grey,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(color: Colors.white),
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 40,
    //                     top: 20,
    //                     child: Container(
    //                       width: 48.w,
    //                       height: 48.h,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/images/person3instant.png"),fit: BoxFit.cover
    //                         ),
    //                         color: Colors.grey,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(color: Colors.white),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               )),
    //         ],
    //       ),
    //     ),
    //   ),
    //     Container(
    //       // margin: EdgeInsets.only(right: 16.w),
    //       // padding: const EdgeInsets.all(24),
    //       width: 329.w,
    //       height: 124.h,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(24),
    //         gradient: LinearGradient(colors: [
    //           k5A72ED.withOpacity(0.4),
    //           k83C5BE.withOpacity(0.4),
    //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //       ),
    //       child: Padding(
    //         padding: EdgeInsets.only(left: 24.h,top: 24.h),
    //         child: Row(mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'Connect within 60s',
    //                   style: kManRope_700_16_001314,
    //                 ),
    //                 SizedBox(height: 8.h),
    //                 Text('Top verified Specialities',
    //                     style: kManRope_500_14_626A6A),
    //                 SizedBox(height: 16.h),
    //                 Text(
    //                   'Know More',
    //                   style: kManRope_500_16_006D77,
    //                 )
    //               ],
    //             ),
    //             Expanded(
    //                 child: Stack(
    //                   clipBehavior: Clip.none,
    //                   children: [
    //                     Positioned(
    //                       left: 0,
    //                       top: 20,
    //                       child: Container(
    //                         width: 48.w,
    //                         height: 48.h,
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage("assets/images/person1instant.png"),fit: BoxFit.cover
    //                           ),
    //                           color: Colors.grey,
    //                           shape: BoxShape.circle,
    //                           border: Border.all(color: Colors.white),
    //                         ),
    //                       ),
    //                     ),
    //                     Positioned(
    //                       left: 20,
    //                       top: 20,
    //                       child: Container(
    //                         width: 48.w,
    //                         height: 48.h,
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage("assets/images/person2instant.png"),fit: BoxFit.cover
    //                           ),
    //                           color: Colors.grey,
    //                           shape: BoxShape.circle,
    //                           border: Border.all(color: Colors.white),
    //                         ),
    //                       ),
    //                     ),
    //                     Positioned(
    //                       left: 40,
    //                       top: 20,
    //                       child: Container(
    //                         width: 48.w,
    //                         height: 48.h,
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage("assets/images/person3instant.png"),fit: BoxFit.cover
    //                           ),
    //                           color: Colors.grey,
    //                           shape: BoxShape.circle,
    //                           border: Border.all(color: Colors.white),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ),
    //   Container(
    //     // margin: EdgeInsets.only(right: 16.w),
    //     // padding: const EdgeInsets.all(24),
    //     width: 329.w,
    //     height: 124.h,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(24),
    //       gradient: LinearGradient(colors: [
    //         k5A72ED.withOpacity(0.4),
    //         k83C5BE.withOpacity(0.4),
    //       ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.only(left: 24.h,top: 24.h),
    //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Connect within 60s',
    //                 style: kManRope_700_16_001314,
    //               ),
    //               SizedBox(height: 8.h),
    //               Text('Top verified Specialities',
    //                   style: kManRope_500_14_626A6A),
    //               SizedBox(height: 16.h),
    //               Text(
    //                 'Know More',
    //                 style: kManRope_500_16_006D77,
    //               )
    //             ],
    //           ),
    //           Expanded(
    //               child: Stack(
    //                 clipBehavior: Clip.none,
    //                 children: [
    //                   Positioned(
    //                     left: 0,
    //                     top: 20,
    //                     child: Container(
    //                       width: 48.w,
    //                       height: 48.h,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/images/person1instant.png"),fit: BoxFit.cover
    //                         ),
    //                         color: Colors.grey,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(color: Colors.white),
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 20,
    //                     top: 20,
    //                     child: Container(
    //                       width: 48.w,
    //                       height: 48.h,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/images/person2instant.png"),fit: BoxFit.cover
    //                         ),
    //                         color: Colors.grey,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(color: Colors.white),
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 40,
    //                     top: 20,
    //                     child: Container(
    //                       width: 48.w,
    //                       height: 48.h,
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/images/person3instant.png"),fit: BoxFit.cover
    //                         ),
    //                         color: Colors.grey,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(color: Colors.white),
    //                       ),
    //                     ),),
    //                 ],
    //               )),
    //         ],
    //       ),
    //     ),
    //   ),
    //     ],
    //   ),
    // );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
              height: 124.h,
              width: 1.sw,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _index = index;
                      });
                    },
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.7,
                    reverse: false,
                    enableInfiniteScroll: false),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    // padding: const EdgeInsets.all(24),
                    width: 329.w,
                    height: 124.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(colors: [
                        k5A72ED.withOpacity(0.4),
                        k83C5BE.withOpacity(0.4),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.h, top: 24.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Connect within 60s',
                                style: kManRope_700_16_001314,
                              ),
                              SizedBox(height: 8.h),
                              Text('Top verified Specialities',
                                  style: kManRope_500_14_626A6A),
                              SizedBox(height: 16.h),
                              Text(
                                'Know More',
                                style: kManRope_500_16_006D77,
                              )
                            ],
                          ),
                          Expanded(
                              child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: 0,
                                top: 20,
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/person1instant.png"),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 20,
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/person2instant.png"),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 40,
                                top: 20,
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/person3instant.png"),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 3,
              )),
        ),
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: k5A72ED.withOpacity(0.15),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: _index == 0 ? k5A72ED : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    duration: const Duration(milliseconds: 200),
                  ),
                  AnimatedContainer(
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: _index == 1 ? k5A72ED : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    duration: const Duration(milliseconds: 200),
                  ),
                  AnimatedContainer(
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: _index == 2 ? k5A72ED : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    duration: const Duration(milliseconds: 200),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
