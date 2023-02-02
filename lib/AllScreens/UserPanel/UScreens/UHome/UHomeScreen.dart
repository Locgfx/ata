import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/booking_confirmation.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/all_psochologist_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/book_appointment_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/home_screen_widgets/bookings.dart';
import 'package:greymatter/widgets/home_screen_widgets/grid_card.dart';
import 'package:greymatter/widgets/home_screen_widgets/info.dart';
import 'package:greymatter/widgets/home_screen_widgets/psycologist_slider.dart';
import 'package:greymatter/widgets/home_screen_widgets/recommended_activities.dart';
import 'package:greymatter/widgets/home_screen_widgets/recommended_videos.dart';
import 'package:greymatter/widgets/home_screen_widgets/upcoming_appointment_card.dart';
import 'package:greymatter/widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';

import '../../../../widgets/home_screen_widgets/slider_card.dart';
import 'notification_screen.dart';

class UHomeScreen extends StatefulWidget {
  const UHomeScreen({Key? key}) : super(key: key);

  @override
  State<UHomeScreen> createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  final PageController _controller = PageController();

  // final _pageController = PageController(viewportFraction: 0.877);
  //
  // double currentPage = 0;
  //
  //
  // @override
  // void initState() {
  //   _pageController.addListener(() {
  //     setState(() {
  //       currentPage = _pageController.page!.toDouble();
  //     });
  //   });
  //   super.initState();
  // }

  int _index = 0;
  int _index2 = 0;
  List _bgImageList = [
    'assets/images/offercard1.png',
    'assets/images/offercard2.png',
    'assets/images/offercard3.png',
  ];
  // List<String> _charImageList = [
  //   'assets/images/sliderchar1.png',
  //   'assets/images/sliderchar2.png',
  //   'assets/images/sliderchar3.png',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
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
        title: Container(
          padding: EdgeInsets.only(left: 6.w),
          color: Colors.transparent,
          child: Text(
            "Good Morning, Pankaj",
            style: kManRope_700_20_white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationsScreen()));
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(right: 12),
              child: Image.asset(
                "assets/images/iconwhitenotification.png",
                height: 48.w,
                width: 48.w,
              ),
            ),
          ),
        ],
      ),
      /*HomeAppBar(
        text: Text(
          "Good Morning, Pankaj",
          style: kManRope_700_20_white,
        ),
        color: k5A72ED,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationsScreen()));
            },
            child: Image.asset(
              "assets/images/iconwhitenotification.png",
              height: 48.h,
              width: 48.w,
            )),
      ),*/
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: ClipPathClass(),
                  child: Container(
                    height: 320.h,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: k5A72ED,
                      //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100))
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: 150.h),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 56.h,
                            width: 1.sw,
                            child: TextField(
                                decoration: TextfieldDecoration(
                                        label:
                                            'Search for health problem, Psychologist')
                                    .whiteColorSearchField()),
                          ),
                          SizedBox(height: 36.h),
                          Text('In the Spotlight',
                              style: kManRope_700_16_white),
                          SizedBox(height: 8.h),
                          Text('Explore deals, offers and more',
                              style: kManRope_400_16_CBD3FB),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      height: 250.h,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _index = index;
                            });
                            //print(_index);
                          },
                          aspectRatio: 2,
                          viewportFraction: 0.8,
                          autoPlay: true,
                          reverse: false,
                          enableInfiniteScroll: false,
                        ),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return SliderCard(
                              index: int.parse((realIndex % 3).toString()));
                        },
                        itemCount: 300,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: k5A72ED.withOpacity(0.15),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(2)),
                          ),
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            // height: 4,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: _index % 3 == 0
                                  ? k5A72ED
                                  : Colors.transparent,
                            ),
                            duration: Duration(milliseconds: 100),
                          ),
                        ),
                        Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: k5A72ED.withOpacity(0.15),
                            //borderRadius: BorderRadius.circular(2),
                          ),
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            // height: 4,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: _index % 3 == 1
                                  ? k5A72ED
                                  : Colors.transparent,
                            ),
                            duration: Duration(milliseconds: 100),
                          ),
                        ),
                        Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: k5A72ED.withOpacity(0.15),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(2)),
                          ),
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            // height: 4,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: _index % 3 == 2
                                  ? k5A72ED
                                  : Colors.transparent,
                            ),
                            duration: Duration(milliseconds: 100),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
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
                          //               color: _index % 3 == 0
                          //                   ? k5A72ED
                          //                   : Colors.transparent,
                          //               borderRadius: BorderRadius.circular(2),
                          //             ),
                          //             duration:
                          //             const Duration(milliseconds: 200),
                          //           ),
                          //           AnimatedContainer(
                          //             width: 24.w,
                          //             decoration: BoxDecoration(
                          //               color: _index % 3 == 1
                          //                   ? k5A72ED
                          //                   : Colors.transparent,
                          //               borderRadius: BorderRadius.circular(2),
                          //             ),
                          //             duration:
                          //             const Duration(milliseconds: 200),
                          //           ),
                          //           AnimatedContainer(
                          //             width: 24.w,
                          //             decoration: BoxDecoration(
                          //               color: _index % 3 == 2
                          //                   ? k5A72ED
                          //                   : Colors.transparent,
                          //               borderRadius: BorderRadius.circular(2),
                          //             ),
                          //             duration:
                          //             const Duration(milliseconds: 200),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 40.h),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BookingConfirmationScreen(
                                              isCancellationAvailable: true,
                                            )));
                              },
                              child: UpcomingAppointmentCard()),
                          SizedBox(height: 40.h),
                          Text(
                            'Choose from Top Specialities',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Book confirmed appointments',
                            style: kManRope_400_16_626A64_07,
                          ),
                          SizedBox(height: 24.h),
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(top: 5),
                              shrinkWrap: true,
                              itemCount: 8,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: 1 / 1.5,
                                      mainAxisSpacing: 1.0,
                                      crossAxisSpacing: 5.0),
                              itemBuilder: (ctx, index) {
                                if (index >= 7) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  const BookAppointmentScreen()));
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 84.w,
                                            height: 84.h,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                // image: DecorationImage(
                                                //   image: AssetImage("assets/images/iconrightarrow24white.png"),
                                                //   fit: BoxFit.cover
                                                // ),
                                                border: Border.all(
                                                    color: kFFFFFF, width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: k006D77),
                                            child: Padding(
                                              padding: EdgeInsets.all(18.0),
                                              child: Image.asset(
                                                'assets/images/iconrightarrow24white.png',
                                                height: 24.h,
                                                width: 24.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          Text(
                                            'Show all',
                                            style: kManRope_400_16_626A6A,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return GridCard(index: index);
                                }
                              }),
                          SizedBox(height: 40.h),
                          const Bookings(),
                          SizedBox(height: 40.h),
                          Text(
                            'We are here to help you',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Book confirmed appointments',
                            style: kManRope_400_16_626A64_07,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                        color: Colors.white,
                        // height: 314.h,
                        // padding: EdgeInsets.only(top: 20.h),
                        width: 1.sw,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: Column(
                            children: [
                              PsychologistSlider(),
                              // PsychologistSlider(),
                              // SizedBox(
                              //   width: 1.sw,
                              //   // height: 118.h,
                              //   child: ListView.builder(
                              //     itemCount: 3,
                              //     scrollDirection: Axis.horizontal,
                              //     itemBuilder: (context, int realIndex) {
                              //       return PsychologistSlider();
                              //     },
                              //     /*options: CarouselOptions(
                              //         onPageChanged: (index, reason) {
                              //           setState(() {
                              //             _index2 = index;
                              //           });
                              //         },*/
                              //     /*aspectRatio: 1 / 2,
                              //         viewportFraction: 0.8,
                              //         reverse: false,
                              //         enableInfiniteScroll: false),*/
                              //   ),
                              // ),
                              /*Row(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedContainer(
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            color: _index2 == 0
                                                ? k5A72ED
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        ),
                                        AnimatedContainer(
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            color: _index2 == 1
                                                ? k5A72ED
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        ),
                                        AnimatedContainer(
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            color: _index2 == 2
                                                ? k5A72ED
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),*/
                              SizedBox(height: 16.h),
                              Container(
                                width: 1.sw,
                                height: 56.h,
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: CustomSecondaryButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  AllPsychologistScreen()));
                                    },
                                    text: 'View All Psychologist'),
                              ),
                              SizedBox(
                                height: 20.h,
                              )
                            ],
                          ),
                        )),
                    SizedBox(height: 20.h),
                    const RecommendedVideos(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const RecommendedActivities(),
                    const Info(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
