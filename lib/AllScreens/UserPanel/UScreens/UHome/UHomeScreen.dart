import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UNotificationScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/search_psycologist_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UClipClass.dart';
import 'package:greymatter/Apis/UserAPis/user_explore_apis/user_explore_api.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_activity_api.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_order_history_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/model/UModels/user_home_models/user_activity_model.dart';
import 'package:greymatter/model/UModels/user_order_model/upcoming_orders.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Apis/Notifications_apis/notification_repo.dart';
import '../../../../Apis/UserAPis/user_profile_apis/user_profile_api.dart';
import '../../../../constants/decorations.dart';
import '../../../../model/UModels/user_profile_models/user_profile_model.dart';
import '../../../../widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';
import '../../UWidgets/UHomeWidgets/UBookings.dart';
import '../../UWidgets/UHomeWidgets/UInfo.dart';
import '../../UWidgets/UHomeWidgets/UOfferBanner.dart';
import '../../UWidgets/UHomeWidgets/URecommendedVideos.dart';
import '../../UWidgets/UHomeWidgets/UTopSpecialistGridview.dart';
import '../../UWidgets/UHomeWidgets/UUpcomingAppointmentCard.dart';
import '../UExploreScreens/UBookingConfirmationScreen.dart';
import '../UExploreScreens/UDoctorprofile.dart';
import '../UGoalScreens/UAddactivity.dart';
import 'UAllPsychologistScreen.dart';
import 'UAllVideosScreen.dart';

class UHomeScreen extends StatefulWidget {
  const UHomeScreen({Key? key}) : super(key: key);

  @override
  State<UHomeScreen> createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    getData();
    getPsychologistData();
    getActivityData();
    getUpcomingAppointments();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      _newNotification = await _repo.newNotification();
      setState(() {});
      log(_newNotification.toString());
    });

    getName();

    super.initState();
  }

  UpcomingOrderData upcomingOrderData = UpcomingOrderData(data: []);

  getUpcomingAppointments() {
    setState(() {
      isLoading = true;
    });
    UserOrderHistoryApi()
        .getUpcoming(page: 0)
        .then((value) => setState(() {
              log(value.data.toString() + "g uguyvf ");
              upcomingOrderData = value;
              upcomingOrderData.data.removeWhere((element) =>
                  DateTime.parse("${element.date} ${element.timeSlot}")
                      .isBefore(DateTime.now().add(Duration(minutes: 60))
                          // DateTime(
                          //     DateTime.now().year,
                          //     DateTime.now().month,
                          //     DateTime.now().day,
                          //     DateTime.now().hour,
                          //     60)
                          ));
              upcomingOrderData.data
                  .removeWhere((element) => element.payment != "p");
              log(upcomingOrderData.data.length.toString());
              log(value.data.length.toString());
            }))
        .then((value) => setState(() {
              isLoading = false;
            }));
  }

  String userName = '';
  getData() async {
    var prefs = await SharedPreferences.getInstance();
    String a = prefs.getString(Keys().userName)!;
    setState(() {
      userName = a;
    });
  }

  bool isLoading = false;

  UserActivityModel modelUserActivity = UserActivityModel();
  List<UserActivityModel> userActivity = [];

  getActivityData() {
    isLoading = true;
    final resp = UserActivityApi().get(scroll: '0');
    resp.then((value) {
      //print(value);
      if (mounted) {
        setState(() {
          for (var v in value) {
            userActivity.add(UserActivityModel.fromJson(v));
          }
          isLoading = false;
        });
      }
    });
  }

  //---------------psychologist slider---------------

  UPsychologistModel model = UPsychologistModel();
  List<UPsychologistModel> psychologists = [];

  getPsychologistData() {
    isLoading = true;
    final resp = UserExploreApi().get(scroll: '0', search: "");
    resp.then((value) {
      log("hhhh" + value.toString());
      if (mounted) {
        setState(() {
          for (var v in value) {
            psychologists.add(UPsychologistModel.fromJson(v));
          }
          isLoading = false;
        });
      }
    });
  }

  bool _isLoading = false;

  final NotificationRepo _repo = NotificationRepo();

  Timer? _timer;
  bool _newNotification = false;
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  UserProfileModel modell = UserProfileModel();
  // bool _isLoading = false;
  getName() {
    print("object");
    _isLoading = true;
    final resp = UserProfileApi().get();
    print(resp);
    resp.then((value) {
      print(value);
      setState(() {
        try {
          modell = UserProfileModel.fromJson(value);
          _isLoading = false;
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
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
                "Good ${DateTime.now().hour < 12 ? 'Morning' : DateTime.now().hour > 12 && DateTime.now().hour < 15 ? 'Afternoon' : 'Evening'} ${modell.name.toString() == "null" ? "Ataraxis User" : modell.name.toString()}",
                // "Good ${DateTime.now().hour < 12 ? 'Morning' :
                // DateTime.now().hour > 12 && DateTime.now().hour < 15 ?
                // 'Afternoon' : 'Evening'},"
                // " ${userName == '' ? userName : 'User'}",
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
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: _newNotification
                          ? SvgPicture.asset(
                              "assets/icons/bell_off.svg",
                              width: 30,
                              height: 30,
                            )
                          : SvgPicture.asset(
                              "assets/icons/bell_on.svg",
                              width: 30,
                              height: 30,
                            ),
                    )
                    // Image.asset(
                    //   "assets/images/iconwhitenotification.png",
                    //   height: 48.w,
                    //   width: 48.w,
                    // ),
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
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          SearchPsychologistScreen(
                                            bookingType: 'a',
                                            issueId: psychologists[0]
                                                .specialities![0]
                                                .specialitiesId
                                                .toString(),
                                            issue: psychologists[0]
                                                .specialities![0]
                                                .name
                                                .toString(),
                                            price: '',
                                          )));
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: 60.h,
                                  width: 1.sw,
                                  child: IgnorePointer(
                                    child: TextField(
                                        decoration: TextfieldDecoration(
                                                label: 'Search for Counsellors')
                                            .whiteColorSearchField(() {})),
                                  ),
                                ),
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
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (upcomingOrderData.data.isNotEmpty)
                                SizedBox(height: 40.h),
                              if (upcomingOrderData.data.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UBookingConfirmationScreen(
                                          model: upcomingOrderData.data.lastWhere(
                                              (element) => DateTime.parse(
                                                      "${element.date} ${element.timeSlot}")
                                                  .isAfter(DateTime.now())),
                                          isCancellationAvailable: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: UUpcomingAppointmentCard(
                                    data: upcomingOrderData.data.firstWhere(
                                        (element) => DateTime.parse(
                                                "${element.date} ${element.timeSlot}")
                                            .isAfter(DateTime.now())),
                                    loading: isLoading,
                                  ),
                                ),
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
                              isLoading
                                  ? SizedBox()
                                  : TopSpecialistGridview(
                                      bookingType: 'a',
                                    ),
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
                        // --------------------------------psychologistslider-------------------
                        isLoading || psychologists.isEmpty
                            ? Opacity(
                                opacity: 0.9,
                                child: Shimmer.fromColors(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 1.sw,
                                        height: 80,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        width: 1.sw,
                                        height: 80,
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16, bottom: 24),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                    ],
                                  ),
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white,
                                ),
                              )
                            : Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    // PsychologistSlider(),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, top: 20),
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
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UDoctorProfileScreen(
                                                              bookingType: 'a',
                                                              showBookSession:
                                                                  true,
                                                              issue: psychologists[
                                                                      i]
                                                                  .specialities![
                                                                      0]
                                                                  .name
                                                                  .toString(),
                                                              issueId: psychologists[
                                                                      i]
                                                                  .specialities![
                                                                      0]
                                                                  .specialitiesId
                                                                  .toString(),
                                                              psychologistData:
                                                                  psychologists[
                                                                      i],
                                                            )));
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 80.h,
                                                        width: 81.w,
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              psychologists[i]
                                                                  .profilePhoto
                                                                  .toString(),
                                                          fit: BoxFit.cover,
                                                          placeholder:
                                                              (context, url) =>
                                                                  Center(
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: k006D77,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 9.w),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            psychologists[i]
                                                                .name
                                                                .toString(),
                                                            style:
                                                                kManRope_400_16_001314,
                                                          ),
                                                          SizedBox(height: 8.h),
                                                          Text(
                                                            psychologists[i]
                                                                .specialities!
                                                                .first
                                                                .name
                                                                .toString(),
                                                            style:
                                                                kManRope_400_14_626A6A,
                                                          ),
                                                          SizedBox(height: 8.h),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/Star 1.png',
                                                                width: 15.w,
                                                                height: 15.w,
                                                              ),
                                                              SizedBox(
                                                                  width: 4.w),
                                                              Text(
                                                                  psychologists[
                                                                          i]
                                                                      .rating
                                                                      .toString(),
                                                                  style:
                                                                      kManRope_400_12_001314),
                                                              SizedBox(
                                                                  width: 4.w),
                                                              Text('.',
                                                                  style:
                                                                      kManRope_700_16_001314),
                                                              SizedBox(
                                                                  width: 4.w),
                                                              Text(
                                                                  psychologists[
                                                                          i]
                                                                      .totalExprience
                                                                      .toString(),
                                                                  style:
                                                                      kManRope_400_12_001314),
                                                              Text(' Yrs. Exp',
                                                                  style:
                                                                      kManRope_400_12_001314),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      child: CustomSecondaryButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        UAllPsychologistScreen(
                                                          bookingType: 'a',
                                                          issueId: psychologists[
                                                                  0]
                                                              .specialities![0]
                                                              .specialitiesId
                                                              .toString(),
                                                          issue: psychologists[
                                                                  0]
                                                              .specialities![0]
                                                              .name
                                                              .toString(),
                                                          price: '',
                                                        )));
                                          },
                                          text: 'View All Psychologist'),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    )
                                  ],
                                )),
                        SizedBox(height: 20.h),
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
                              isLoading || userActivity.isEmpty
                                  ? SizedBox()
                                  : SizedBox(
                                      height: 87.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, i) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UAddActivityScreen()));
                                            },
                                            child: Container(
                                              height: 87.h,
                                              width: 248.w,
                                              margin: EdgeInsets.only(
                                                  right: 24.w,
                                                  left: i == 0 ? 24.w : 0),
                                              decoration: BoxDecoration(
                                                color: k5A72ED,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/backimg.png',
                                                    ),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  userActivity[i]
                                                      .name
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: kManRope_600_18_white,
                                                ),
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
        // UAppleSignUpAddDetails()
        /*if (isLoading) LoadingWidget(),*/
      ],
    );
  }
}
