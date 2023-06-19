import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PMeetingScreens/cancelledlist.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PMeetingScreens/completedlist.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PMeetingScreens/upcominglist.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UNotificationScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UClipClass.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/total_revenue_api/total_revenue_api.dart';
import 'package:greymatter/Apis/Notifications_apis/notification_repo.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/model/PModels/home_models/total_revenue_model/total_revenue_model.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shimmerLoader.dart';

import '../../../../Apis/Notifications_apis/seen_notification_repo.dart';
import '../../../../constants/fonts.dart';

class PHomeScreen extends StatefulWidget {
  const PHomeScreen({Key? key}) : super(key: key);

  @override
  State<PHomeScreen> createState() => _PHomeScreenState();
}

class _PHomeScreenState extends State<PHomeScreen>
    with TickerProviderStateMixin {
  late TabController _pageController;
  int pageIndex = 0;

  final NotificationRepo _repo = NotificationRepo();

  Timer? _timer;
  bool _newNotification = false;
  @override
  void initState() {
    _pageController = TabController(length: 3, vsync: this);
    _getData();

    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      _newNotification = await _repo.newNotification();
      setState(() {});
      log(_newNotification.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  bool _isLoading = false;
  TotalRevenueModel model = TotalRevenueModel();
  _getData() {
    _isLoading = true;
    final resp = TotalRevenueApi().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        setState(() {
          model = TotalRevenueModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  final NotificationSeenRepo _notificationSeenRepo = NotificationSeenRepo();

  int selectedIndex = 0;
  int index = 0;
  bool flag = true;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: k5A72ED,
              automaticallyImplyLeading: false,
              systemOverlayStyle: Platform.isAndroid
                  ? SystemUiOverlayStyle(
                      statusBarColor: k5A72ED,
                      statusBarIconBrightness: Brightness.dark,
                    )
                  : SystemUiOverlayStyle.dark,
              centerTitle: false,
              title: Padding(
                padding: EdgeInsets.only(left: 6.w),
                child: Text(
                  "Good Morning, Pankaj",
                  style: kManRope_700_20_white,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () async {
                    // await _notificationSeenRepo.seenAll();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UNotificationsScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: _newNotification
                          ? SvgPicture.asset(
                              "assets/icons/bell_off.svg",
                              width: 20,
                              height: 20,
                            )
                          : SvgPicture.asset(
                              "assets/icons/bell_on.svg",
                              width: 20,
                              height: 20,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: kEDF6F9,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 140.h,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: k5A72ED,
                      //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100))
                    ),
                  ),
                ),
                Container(
                  //constraints: BoxConstraints(maxHeight: 700.h),
                  margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Column(
                      children: [
                        _isLoading
                            ? ShimmerLoader(
                                height: 150,
                              )
                            : Container(
                                // height: 180.h,
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: 1.sw,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: kE1EEF2,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 24.w,
                                    right: 24.w,
                                    top: 24.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/Revenue.svg',
                                                height: 48.h,
                                                width: 48.w,
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Text(
                                                'Revenue',
                                                style: kManRope_400_16_263238,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Container(
                                            height: 1.h,
                                            width: 143.w,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            "₹${model.totalRs}",
                                            style: kManRope_700_36_36B3BF,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Last Month: ₹${model.lastMonthRs}',
                                            style: kManRope_400_16_263238,
                                          ),
                                          SizedBox(
                                            height: 24.h,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/Bookings.svg',
                                                height: 48.h,
                                                width: 48.w,
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Text(
                                                'Bookings',
                                                style: kManRope_400_16_263238,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Container(
                                            height: 1.h,
                                            width: 143.w,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            model.totalBooking.toString(),
                                            style: kManRope_700_36_36B3BF,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'Last Month: ${model.lastMonthBooking}',
                                            style: kManRope_400_16_263238,
                                          ),
                                          SizedBox(
                                            height: 24.h,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(height: 40.h),
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
                                    text: 'Upcoming',
                                    height: 54,
                                  ),
                                  Tab(
                                    text: 'Cancelled',
                                    height: 54,
                                  ),
                                  Tab(
                                    text: 'Completed',
                                    height: 54,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 23.h),
                        Expanded(
                          child: TabBarView(
                            controller: _pageController,
                            /*onPageChanged: (page) {
                          setState(
                            () {
                              pageIndex = page;
                            },
                          );
                        },*/
                            children: <Widget>[
                              UpcomingList(),
                              CancelledList(),
                              CompletedList(),
                            ],
                          ),
                        ),
                        //SizedBox(height: 30.h),
                        /*Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 24,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MainButton(
                                onPressed: () {
                                  if (pageIndex == 0) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpcomingMeetings()));
                                  }
                                  if (pageIndex == 1) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CancelledMeetings()));
                                  }
                                  if (pageIndex == 2) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompletedMeetings()));
                                  }
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, bottom: 20.h),
                                  child: Text(
                                    "See all",
                                    style: kManRope_500_16_white,
                                  ),
                                ),
                                color: k006D77,
                                shape: CustomDecoration().button16Decoration()),
                          ),
                        ],
                      ),
                    ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading) LoadingWidget()
        ],
      ),
    );
  }
}
