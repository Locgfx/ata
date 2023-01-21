import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/post_page.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/saved_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int _index = 0;
  // late TabController _tabController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 6, vsync: this);
  //   _tabController.animateTo(2);
  // }
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
                                  'Posts',
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
                                    'Saved',
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
                  // SizedBox(
                  //   width: 36.w,
                  // ),
                  /*GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        selectedIndex = pageIndex = 1;
                        _pageController.jumpToPage(
                          pageIndex,
                        );
                        pageIndex = 1;
                      });
                    },
                    child: Padding(
                      padding:EdgeInsets.only(top:20.h,bottom: 20.h,left: 50.w,right: 50.w),
                      child: Column(
                        children: [
                          Text(
                            'Saved',
                            style: pageIndex == 1
                            ?kManRope_700_16_001314
                                : kManRope_400_16_626A6A


                          ),
                     Container(
                      height: 1.5.h,
                      width: 60.w,
                      margin: EdgeInsets.only(top: 14),
                      color: pageIndex == 1 ? k006D77: Colors.white
                    ),
                        ],
                      ),
                    ),
                  ),*/
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
                    PostPage(),
                    SavedScreen(),


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
  }
}
