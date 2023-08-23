import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Apis/Notifications_apis/seen_notification_repo.dart';
import '../../../../constants/fonts.dart';
import '../../../../constants/globals.dart';

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
    getPrefs();
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
    controller.dispose();
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

  String userName = '';
  getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    String a = prefs.getString(Keys().userName)!;
    setState(() {
      userName = a;
    });
  }

  int selectedIndex = 0;
  int index = 0;
  bool flag = true;

  bool isLoading = false;

  final CardSwiperController controller = CardSwiperController();
  final cards = candidates.map(ExampleCard.new).toList();

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
                  "Good ${DateTime.now().hour < 12 ? 'Morning' : DateTime.now().hour > 12 && DateTime.now().hour < 15 ? 'Afternoon' : 'Evening'}, ${userName != '' ? userName : 'User'}",
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
          // Center(
          //   child: CardSwiper(
          //     controller: controller,
          //     cardsCount: cards.length,
          //     onSwipe: _onSwipe,
          //     onUndo: _onUndo,
          //     numberOfCardsDisplayed: 3,
          //     backCardOffset: const Offset(40, 40),
          //     padding: const EdgeInsets.symmetric(horizontal: 30.0),
          //     cardBuilder: (
          //       context,
          //       index,
          //       horizontalThresholdPercentage,
          //       verticalThresholdPercentage,
          //     ) =>
          //         cards[index],
          //   ),
          // ),
          // Swiper(
          //   loop: false,
          //   itemBuilder: (BuildContext context, int index) {
          //     return BackdropFilter(
          //       filter: ImageFilter.blur(
          //           sigmaX: 1.0, sigmaY: 1.0, tileMode: TileMode.clamp),
          //       child: Material(
          //         elevation: 3,
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           padding: EdgeInsets.all(16),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(12)),
          //           child: Column(
          //             children: [
          //               Row(
          //                 children: [
          //                   Expanded(
          //                     flex: 4,
          //                     child: Text(
          //                       "New appointment request received",
          //                       style: kManRope_600_24_07000A,
          //                     ),
          //                   ),
          //                   Expanded(
          //                     child: Container(
          //                         height: 36,
          //                         width: 36,
          //                         decoration: BoxDecoration(
          //                             color: kE1EEF2, shape: BoxShape.circle),
          //                         child: Center(
          //                           child: Text(
          //                             "5",
          //                             style: kManRope_700_16_006D77,
          //                           ),
          //                         )),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(height: 16),
          //               Row(
          //                 children: [
          //                   Container(
          //                     height: 80,
          //                     width: 80,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Image.asset(
          //                         "assets/images/WF Image Placeholder.png"),
          //                   ),
          //                   SizedBox(width: 16),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         "Cody Fisher",
          //                         style: kManRope_500_16_Black,
          //                       ),
          //                       Text("Anxiety", style: kManRope_400_16_7D7878),
          //                       Text("18-7-2023, 12:00 Pm",
          //                           style: kManRope_400_16_7D7878),
          //                     ],
          //                   )
          //                 ],
          //               ),
          //               SizedBox(height: 16),
          //               Container(
          //                 height: 2,
          //                 width: 1.sw,
          //                 decoration: BoxDecoration(
          //                     color: k626A6A.withOpacity(0.08),
          //                     borderRadius: BorderRadius.circular(1)),
          //               ),
          //               SizedBox(
          //                 height: 16,
          //               ),
          //               Row(
          //                 children: [
          //                   Expanded(
          //                     child: SizedBox(
          //                       height: 56,
          //                       child: MainButton(
          //                           onPressed: () {},
          //                           child: Text(
          //                             "Decline",
          //                             style: kManRope_500_16_B64C4C,
          //                           ),
          //                           color: Colors.white,
          //                           shape: RoundedRectangleBorder(
          //                               side: BorderSide(
          //                                   width: 1, color: kB64C4C),
          //                               borderRadius:
          //                                   BorderRadius.circular(10))),
          //                     ),
          //                   ),
          //                   SizedBox(width: 16),
          //                   Expanded(
          //                     child: SizedBox(
          //                       height: 56,
          //                       child: MainButton(
          //                           onPressed: () {},
          //                           child: Text(
          //                             "Accept",
          //                             style: kManRope_500_16_white,
          //                           ),
          //                           color: k006D77,
          //                           shape: RoundedRectangleBorder(
          //                               borderRadius:
          //                                   BorderRadius.circular(10))),
          //                     ),
          //                   )
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          //   itemCount: 5,
          //   itemWidth: 1.sw,
          //   itemHeight: 300.0,
          //   layout: SwiperLayout.TINDER,
          // ),

          if (isLoading) LoadingWidget()
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

class ExampleCard extends StatelessWidget {
  final ExampleCandidateModel candidate;

  const ExampleCard(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.redAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              height: 400,
              decoration: BoxDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleCandidateModel {
  String name;
  String job;
  String city;
  List<Color> color;

  ExampleCandidateModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'One, 1',
    job: 'Developer',
    city: 'Areado',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  ExampleCandidateModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'New York',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  ExampleCandidateModel(
    name: 'Three, 3',
    job: 'Engineer',
    city: 'London',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ExampleCandidateModel(
    name: 'Four, 4',
    job: 'Designer',
    city: 'Tokyo',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
  ),
];
