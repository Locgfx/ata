import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/post_page.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/saved_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class PostScreen extends StatefulWidget {
  final int index;
  const PostScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> with TickerProviderStateMixin {
  late TabController _pageController;
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = TabController(length: 2, vsync: this);
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.index,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: Platform.isAndroid
              ? SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                )
              : SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TabBar(
                        indicatorWeight: 2,
                        controller: _pageController,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: kManRope_700_16_001314,
                        unselectedLabelStyle: kManRope_500_16_626A6A,
                        indicatorColor: k006D77,
                        labelColor: Colors.black,
                        unselectedLabelColor: k626A6A,
                        onTap: (v) {
                          setState(() {
                            _pageController.animateTo(
                              v,
                              duration: Duration(milliseconds: 1500),
                            );
                          });
                        },
                        tabs: [
                          Tab(
                            text: 'Posts',
                            height: 54,
                          ),
                          Tab(
                            text: 'Saved',
                            height: 54,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.sh,
                  child: TabBarView(
                    //physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      PostPage(),
                      SavedScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
