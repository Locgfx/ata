import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UBookingConfirmationScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddactivity.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UAllPsychologistScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UAllVideosScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UNotificationScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UBookings.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UClipClass.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UInfo.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UOfferBanner.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/URecommendedVideos.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UTopSpecialistGridview.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UUpcomingAppointmentCard.dart';
import 'package:greymatter/Apis/UserAPis/user_explore_apis/user_explore_api.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_activity_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_activity_model.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';

class UHomeScreen extends StatefulWidget {
  const UHomeScreen({Key? key}) : super(key: key);

  @override
  State<UHomeScreen> createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    getPsychologistData();
    getActivityData();
    super.initState();
  }

  bool isLoading = false;


  UserActivityModel modelUserActivity = UserActivityModel();
  List<UserActivityModel> userActivity = [];

  getActivityData() {
    isLoading = true;
    final resp = UserActivityApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          userActivity.add(UserActivityModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  //---------------psychologist slider---------------

  UPsychologistModel model = UPsychologistModel();
  List<UPsychologistModel> psychologists = [];
  bool _isLoading = false;

  getPsychologistData() {
    _isLoading = true;
    final resp = UserExploreApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          psychologists.add(UPsychologistModel.fromJson(v));
        }
        _isLoading = false;
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
                      builder: (context) => const UNotificationsScreen()));
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
                        OfferBanner(),

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
                                                UBookingConfirmationScreen(
                                                  isCancellationAvailable: true,
                                                )));
                                  },
                                  child: UUpcomingAppointmentCard()),
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
                              isLoading ? SizedBox() : TopSpecialistGridview(),
                              SizedBox(height: 40.h),
                              UBookings(),
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
                        isLoading || psychologists.isEmpty ? SizedBox() :Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                // PsychologistSlider(),
                                Padding(
                                  padding: EdgeInsets.only(left: 25,top: 20),
                                  child: SizedBox(
                                    height: 200.h,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      physics: ScrollPhysics(),
                                      itemCount: psychologists.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.3,
                                      ),
                                      itemBuilder: (context, _in) {
                                        return Row(
                                          children: [
                                            Container(
                                              height: 80.h,
                                              width: 81.w,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: psychologists[_in]
                                                    .profilePhoto
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: SpinKitThreeBounce(
                                                    color: k006D77,
                                                    size: 20,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  psychologists[_in]
                                                      .name
                                                      .toString(),
                                                  style: kManRope_400_16_001314,
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  "psychologist",
                                                  style: kManRope_400_14_626A6A,
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset('assets/images/Star 1.png',
                                                        width: 15.w, height: 15.w),
                                                    SizedBox(width: 4.w),
                                                    Text('4.0',
                                                        style: kManRope_400_12_001314),
                                                    SizedBox(width: 4.w),
                                                    Text('.', style: kManRope_700_16_001314),
                                                    SizedBox(width: 4.w),
                                                    Text(psychologists[_in]
                                                        .totalExprience
                                                        .toString(),
                                                        style: kManRope_400_12_001314),
                                                    Text(' Yrs. Exp',
                                                        style: kManRope_400_12_001314),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),

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
                                                    UAllPsychologistScreen()));
                                      },
                                      text: 'View All Psychologist'),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            )),
                        SizedBox(height: 20.h),
                        // RecommendedVideos(),
                        //---------------------------------------------------------------------------
                        SizedBox(
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

                              URecommendedVideosSlider(),

                              // SizedBox(
                              //   height: 160.h,
                              //   child: ListView.builder(
                              //     itemCount: recommendedVideos.length,
                              //     shrinkWrap: true,
                              //     scrollDirection: Axis.horizontal,
                              //     itemBuilder: (_, i) {
                              //       return Container(
                              //         width: 248.w,
                              //         clipBehavior: Clip.hardEdge,
                              //         margin: EdgeInsets.only(left: 24.w),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(20),
                              //         ),
                              //         child: CachedNetworkImage(
                              //           imageUrl: recommendedVideos[i]
                              //               .videoPoster
                              //               .toString(),fit: BoxFit.cover,
                              //           placeholder: (context, url) =>  Center(
                              //             child: SpinKitThreeBounce(
                              //               color: k006D77,
                              //               size: 20,
                              //             ),
                              //           ),
                              //           errorWidget: (context, url, error) =>  Icon(Icons.error),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
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
                                                  UAllVideosScreen()));
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

                        //----------------------------Recommended actiivities------------------------------------------------
                        Container(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          width: 1.sw,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Recommended activities',
                                            style: kManRope_700_16_001314,
                                          ),
                                          SizedBox(height: 8.h),
                                          Text(
                                            'Boost your energy',
                                            style: kManRope_400_16_626A64_07,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),
                              isLoading || userActivity.isEmpty ? SizedBox() :SizedBox(
                                height: 87.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, i) {
                                    return Container(
                                      height: 87.h,
                                      width: 248.w,
                                      margin: EdgeInsets.only(left: 24.w),
                                      decoration: BoxDecoration(
                                        color: k5A72ED,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/backimg.png',
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Center(
                                        child: Text(
                                          userActivity[i].name.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: kManRope_600_18_white,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 3,
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
                                                  UAddActivityScreen()));
                                    },
                                    text: 'View All Activities',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        UInfo(),
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
