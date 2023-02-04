import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/booking_confirmation.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/all_psochologist_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/all_videos.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/book_appointment_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_offer_banner_api.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_recommended_videos_api.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/userspecialistapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_offer_banner_model.dart';
import 'package:greymatter/model/UModels/user_home_models/user_recommended_videos.dart';
import 'package:greymatter/widgets/home_screen_widgets/bookings.dart';
import 'package:greymatter/widgets/home_screen_widgets/info.dart';
import 'package:greymatter/widgets/home_screen_widgets/psycologist_slider.dart';
import 'package:greymatter/widgets/home_screen_widgets/recommended_activities.dart';
import 'package:greymatter/widgets/home_screen_widgets/upcoming_appointment_card.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';
import 'notification_screen.dart';

class UHomeScreen extends StatefulWidget {
  const UHomeScreen({Key? key}) : super(key: key);

  @override
  State<UHomeScreen> createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    getOfferBannerData();
    getTopSpecialistData();
    getRecommendedVideoData();
    super.initState();
  }

  bool isLoading = false;

  UserOfferBannerModel model = UserOfferBannerModel();
  List<UserOfferBannerModel> offerBanner = [];


  int _index = 0;

  //-----------------------offerbannerapi-----------------------------
  getOfferBannerData() {
    isLoading = true;
    final resp = UserOfferBannerApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          offerBanner.add(UserOfferBannerModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  //-------------- topSpecialistGridView-----------------------

  UserSpecialistModel modeltopspecialist = UserSpecialistModel();
  List<UserSpecialistModel> specialistModel = [];

  getTopSpecialistData() {
    isLoading = true;
    final resp = UserSpecialistApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          specialistModel.add(UserSpecialistModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  //-----------------------RecommededVideosApi---------------------------

  UserRecommendedVideoModel modelrecommendedvideos =
      UserRecommendedVideoModel();
  List<UserRecommendedVideoModel> recommendedVideos = [];

  getRecommendedVideoData() {
    isLoading = true;
    final resp = UserRecommendedVideosApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          recommendedVideos.add(UserRecommendedVideoModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 40.h),
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
                        //-------------------------offerCard--------------------------------

                        Column(
                          children: [
                            SizedBox(
                              height: 250.h,
                              child: CarouselSlider.builder(
                                itemCount: offerBanner.length,
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
                                  enableInfiniteScroll: true,
                                ),
                                itemBuilder: (BuildContext context, int index, int realIndex) {
                                  return Container(
                                    width: 1.sw,
                                    margin: EdgeInsets.only(right: 16),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 24.h),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(offerBanner[index]
                                            .banner
                                            .toString()),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                offerBanner.length,
                                (index) {
                                  return Container(
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      color: k5A72ED.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: AnimatedContainer(
                                      alignment: Alignment.centerLeft,
                                      // height: 4,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: _index == index
                                            ? k5A72ED
                                            : Colors.transparent,
                                      ),
                                      duration: Duration(milliseconds: 100),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        //----------------------------------------------------------

                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              // TopSpecialistGridview(),
                              GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 5),
                                  shrinkWrap: true,
                                  itemCount: specialistModel.length,
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
                                                        color: kFFFFFF,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
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
                                      return Container(
                                        width: 83.w,
                                        height: 118.h,
                                        // color: Colors.red,
                                        child: Column(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 84.h,
                                              width: 84.w,
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  // image: DecorationImage(
                                                  //   image: AssetImage(_imgList[index],),fit: BoxFit.cover,
                                                  // ),
                                                  color:
                                                      kFFFFFF.withOpacity(0.40),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  specialistModel[index]
                                                      .icon
                                                      .toString(),
                                                  height: 62.h,
                                                  width: 58.w,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            Text(
                                              specialistModel[index]
                                                  .name
                                                  .toString(),
                                              style: kManRope_400_16_626A6A,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }),

                              // GridView.builder(
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     padding: const EdgeInsets.only(top: 5),
                              //     shrinkWrap: true,
                              //     itemCount: 8,
                              //     gridDelegate:
                              //         const SliverGridDelegateWithFixedCrossAxisCount(
                              //             crossAxisCount: 4,
                              //             childAspectRatio: 1 / 1.5,
                              //             mainAxisSpacing: 1.0,
                              //             crossAxisSpacing: 5.0),
                              //     itemBuilder: (ctx, index) {
                              //       if (index >= 7) {
                              //         return GestureDetector(
                              //           onTap: () {
                              //             Navigator.of(context).push(
                              //                 MaterialPageRoute(
                              //                     builder: (ctx) =>
                              //                         const BookAppointmentScreen()));
                              //           },
                              //           child: Container(
                              //             color: Colors.transparent,
                              //             child: Column(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: [
                              //                 Container(
                              //                   width: 84.w,
                              //                   height: 84.h,
                              //                   clipBehavior: Clip.hardEdge,
                              //                   decoration: BoxDecoration(
                              //                       // image: DecorationImage(
                              //                       //   image: AssetImage("assets/images/iconrightarrow24white.png"),
                              //                       //   fit: BoxFit.cover
                              //                       // ),
                              //                       border: Border.all(
                              //                           color: kFFFFFF, width: 1),
                              //                       borderRadius:
                              //                           BorderRadius.circular(24),
                              //                       color: k006D77),
                              //                   child: Padding(
                              //                     padding: EdgeInsets.all(18.0),
                              //                     child: Image.asset(
                              //                       'assets/images/iconrightarrow24white.png',
                              //                       height: 24.h,
                              //                       width: 24.w,
                              //                       fit: BoxFit.cover,
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 8.h),
                              //                 Text(
                              //                   'Show all',
                              //                   style: kManRope_400_16_626A6A,
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         );
                              //       } else {
                              //         return GridCard(index: index);
                              //       }
                              //     }),
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

                        //--------------------------------psychologistslider-------------------
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


                                  //----------------------------------------------------------------
                                  SizedBox(height: 16.h),
                                  Container(
                                    width: 1.sw,
                                    height: 56.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
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
                        // RecommendedVideos(),
                        //---------------------------------------------------------------------------
                        Container(
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
                                  itemCount: recommendedVideos.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, i) {
                                    return Container(
                                      width: 248.w,
                                      margin: EdgeInsets.only(left: 24.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              recommendedVideos[i]
                                                  .videoPoster
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    );
                                  },
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AllVideos()));
                                    },
                                    text: 'View All Videos',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //----------------------------------------------------------------------------
                        const RecommendedActivities(),
                        const Info(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isLoading) LoadingWidget(),
      ],
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
