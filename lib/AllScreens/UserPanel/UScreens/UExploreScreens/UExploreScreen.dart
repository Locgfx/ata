import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UExplorePage.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UMySessionPage.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class UExploreScreen extends StatefulWidget {
  final int index;
  const UExploreScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<UExploreScreen> createState() => _UExploreScreenState();
}

class _UExploreScreenState extends State<UExploreScreen>
    with TickerProviderStateMixin {
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
    setPage();
    _pageController = TabController(length: 2, vsync: this);
    //_pageController.animateTo(widget.index);
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.index;
      });
    });
  }

  setPage() {
    //print(widget.index);
    setState(() {
      pageIndex = widget.index;
    });
    /*if (_pageController.hasClients) {
      setState(() {
        selectedIndex = widget.index;
        print(widget.index);
        _pageController.jumpToPage(widget.index);
      });
    }*/
  }

  bool isLoading = false;

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
                            text: 'Explore',
                            height: 54,
                          ),
                          Tab(
                            text: 'My sessions',
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
                    controller: _pageController,
                    /*onPageChanged: (page) {
                  setState(() {
                    pageIndex = page;
                  });
                },*/
                    children: [
                      UExplorePage(
                        issue: '',
                        issueId: '',
                        bookingType: 'a',
                      ),
                      UMySessionPage(),
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
