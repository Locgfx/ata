import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/explore_page.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'my_sessions_page.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _index = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          setState(() {
                            selectedIndex = pageIndex = 0;
                            _pageController.jumpToPage(
                              pageIndex,
                            );
                            pageIndex = 0;
                          });
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 16),
                              child: Center(
                                child: Text(
                                  'Explore',
                                  style: pageIndex == 0
                                      ? kManRope_700_16_001314
                                      : kManRope_400_16_626A6A,
                                ),
                              ),
                            ),

                            Container(
                              height: 1.5.h,
                              width: 60.w,
                              //margin: EdgeInsets.only(top: 14),
                              color: pageIndex == 0 ? k006D77 : Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          setState(() {
                            selectedIndex = pageIndex = 1;
                            _pageController.jumpToPage(
                              pageIndex,
                            );
                            pageIndex = 1;
                          });
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 16),
                              child: Center(
                                child: Text(
                                    'My sessions',
                                    style: pageIndex == 1
                                        ? kManRope_700_16_001314
                                        : kManRope_400_16_626A6A
                                  // : kManRope_700_16_001314

                                ),
                              ),
                            ),
                            Container(
                              height: 1.5.h,
                              width: 60.w,
                              //margin: EdgeInsets.only(top: 14),
                              color: pageIndex == 1  ? k006D77 : Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                height: 1.sh,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(
                          () {
                        pageIndex = page;
                      },
                    );
                  },
                  children: [
                    ExplorePage(issue: ''),
                    MySessionPage()

                  ],
                ),
              ),
              //  flag ?
              // const PsychologistPostPage():
              // const PsychologistSavedScreen()
              //  Row(
              //    children: [
              //      Container(
              //        height: 1.5.h,
              //        width: 60.w,
              //        color: flag ? k006D77 : kWhiteBGColor,
              //        // color: flag ? kWhiteBGColor : k006D77,
              //      ),
              //      Container(
              //        height: 1.5.h,
              //        width: 60.w,
              //        color: flag ? kWhiteBGColor : k006D77,
              //      ),
              //    ],
              //  ),
            ],
          ),
        ),
      ),

      // extendBody: true,
      // body: [
      //
      //   const PsychologistPostPage(),
      //   const PsychologistSavedScreen()
      //   // const PsychologistPostPage(),
      //   // const PsychologistSavedScreen(),
      // ].elementAt(_index),

      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 70.h,
      //   backgroundColor: Colors.white,
      //     title: Padding(
      //       padding: EdgeInsets.only(top: 30.h),
      //       child: SizedBox(
      //         height: 44.h,
      //         width: 380.w,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             GestureDetector(
      //               behavior: HitTestBehavior.translucent,
      //               onTap: () {
      //                 setState(() {
      //                   _index = 0;
      //                 });
      //               },
      //               child: SizedBox(
      //                 height: 44.h,
      //                 width: 190.w,
      //                 child: Column(
      //                   children: [
      //                     Text(
      //                       'Posts',
      //                       style: _index == 0 ?
      //                       kManRope_700_16_001314:
      //                       kManRope_500_16_626A6A,
      //                     ),
      //                     Container(
      //                       height: 3.h,
      //                       width: 60.w,
      //                       margin: EdgeInsets.only(top: 14),
      //                       color: _index == 0 ? k006D77 : Colors.white,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             // SizedBox(width: 100.w),
      //             GestureDetector(
      //               behavior: HitTestBehavior.translucent,
      //
      //               onTap: () {
      //                 setState(() {
      //                   _index = 1;
      //                 });
      //               },
      //               child: SizedBox(
      //                 height: 44.h,
      //                 width: 190.w,
      //                 child: Column(
      //                   children: [
      //                     Text(
      //                       'Saved',
      //                       style: _index == 0 ?
      //                       kManRope_500_16_626A6A:
      //                       kManRope_700_16_001314,
      //
      //                     ),
      //                     Container(
      //                       height: 2.h,
      //                       width: 60.w,
      //                       margin: EdgeInsets.only(top: 14),
      //                       color: _index == 1 ? k006D77 : Colors.white,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // centerTitle: true,

      // title: Row(
      //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         setState(() {
      //           _index = 0;
      //         });
      //       },
      //       child: Column(
      //         children: [
      //           Text(
      //             'Posts',
      //             style: _index == 0 ?
      //             kManRope_700_16_001314:
      //             kManRope_500_16_626A6A,
      //           ),
      //           Container(
      //             height: 3.h,
      //             width: 60.w,
      //             margin: EdgeInsets.only(top: 14),
      //             color: _index == 0 ? k006D77 : Colors.white,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(width: 100.w),
      //     GestureDetector(
      //       onTap: () {
      //         setState(() {
      //           _index = 1;
      //         });
      //       },
      //       child: Column(
      //         children: [
      //           Text(
      //             'Saved',
      //             style: _index == 0 ?
      //             kManRope_700_16_001314:
      //             kManRope_500_16_626A6A,
      //           ),
      //           Container(
      //             height: 2.h,
      //             width: 60.w,
      //             margin: EdgeInsets.only(top: 14),
      //             color: _index == 1 ? k006D77 : Colors.white,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      // title:
      //     ),
      //   ),
      // );)
    );
    // return Scaffold(
    //   extendBody: true,
    //   body: [
    //     const ExplorePage(
    //       issue: '',
    //     ),
    //     const MySessionPage(),
    //   ].elementAt(_index),
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: Colors.white,
    //     title: Padding(
    //       padding: EdgeInsets.only(top: 22.h),
    //       child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     _index = 0;
    //                   });
    //                 },
    //                 child: Row(
    //                   children: [
    //                     Text(
    //                       'Explore',
    //                       style: kManRope_700_16_001314,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(),
    //               GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     _index = 1;
    //                   });
    //                 },
    //                 child: Text(
    //                   'My sessions',
    //                   style: kManRope_700_16_001314,
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 1.w,
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 12.h,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Container(
    //                 height: 2.h,
    //                 width: 77.w,
    //                 color: _index == 0 ? k006D77 : Colors.white,
    //               ),
    //               SizedBox(),
    //               Container(
    //                 height: 2.h,
    //                 width: 106.w,
    //                 color: _index == 1 ? k006D77 : Colors.white,
    //               ),
    //               SizedBox(
    //                 width: 18.w,
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
