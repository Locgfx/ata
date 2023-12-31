import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PJoiningScreen.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/upcoming_booking_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/see_all_booking_model.dart';
import 'package:greymatter/model/PModels/home_models/upcoming_booking_model.dart';
import 'package:greymatter/widgets/BottomSheets/CalenderBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';

import '../../../../../Apis/DoctorApis/home_apis/see_all_booking_api.dart';
import '../../../../../widgets/BottomSheets/FilterBottomSheet.dart';

class UpcomingMeetings extends StatefulWidget {
  final String screenName;
  const UpcomingMeetings({Key? key, required this.screenName})
      : super(key: key);

  @override
  State<UpcomingMeetings> createState() => _UpcomingMeetingsState();
}

class _UpcomingMeetingsState extends State<UpcomingMeetings> {
  void _calenderbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => FilterBottomSheet(onPop: (val) {
              setState(() {
                _isLoading = true;
                filter = val;
              });
              getData();
            }));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  //UpcomingBookingModel model = UpcomingBookingModel();
  //List<UpcomingBookingModel> upcomingBooking = [];
  bool _isLoading = false;

  SeeAllBookingsModel model = SeeAllBookingsModel();
  String filter = "";
  int _scroll = 0;
  getData() {
    _isLoading = true;
    final resp = SeeAllApiBooking().get(
        filter: filter,
        val: widget.screenName == "Upcoming"
            ? "u"
            : widget.screenName == "Cancelled"
                ? "c"
                : "s");
    resp.then((value) {
      if (value['status'] == true) {
        setState(() {
          model = SeeAllBookingsModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        appBarText: widget.screenName,
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: _isLoading
          ? LoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.screenName}  (${model.totalBooking})',
                          style: kManRope_700_16_001314,
                        ),
                        GestureDetector(
                            onTap: () {
                              _calenderbottomsheet();
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/images/iconcalender.png",
                                height: 24.h,
                                width: 24.w,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    /*Text(
                      'Today (2)',
                      style: kManRope_500_16_001314,
                    ),*/
                    SizedBox(
                      // height: 1.sh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*SizedBox(
                            height: 24.h,
                          ),*/
                          ListView.separated(
                            itemCount: model.message!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PJoiningScreen(
                                          bookingId: model.message![index].id.toString(),
                                              userId: model
                                                  .message![index].userId
                                                  .toString(),
                                              status: widget.screenName ==
                                                      "Upcoming"
                                                  ? "u"
                                                  : widget.screenName ==
                                                          "Cancelled"
                                                      ? "c"
                                                      : "s",
                                            )),
                                  );
                                },
                                child: Container(
                                  height: 80.h,
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: kEDF6F9,
                                      border: Border.all(color: Colors.white)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 16.w),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 48.h,
                                              width: 48.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.grey,
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              child: CachedNetworkImage(
                                                imageUrl: model
                                                    .message![index].photo
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: SpinKitThreeBounce(
                                                    color: k006D77,
                                                    size: 10,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                            SizedBox(width: 16.w),
                                            SizedBox(
                                              width: 280.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      model.message![index].name
                                                          .toString(),
                                                      style:
                                                          kManRope_500_16_001314),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          model.message![index]
                                                              .issueName
                                                              .toString(),
                                                          style:
                                                              kManRope_400_14_626A6A),
                                                      // SizedBox(width: 24.w),
                                                      Text(
                                                        DateFormat.yMMMd()
                                                            .add_jm()
                                                            .format(DateTime.parse(
                                                                "${model.message![index].date.toString()} ${model.message![index].timeSlot.toString()}")),
                                                        style:
                                                            kManRope_400_14_626A6A,
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return SizedBox(height: 8.h);
                            },
                          ),
                          /*SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Tomorrow (3)',
                            style: kManRope_500_16_001314,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PJoiningScreen(
                                                userId: "",
                                                status: "",
                                              )),
                                    );
                                  },
                                  child: Container(
                                    height: 80.h,
                                    width: 1.sw,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: kEDF6F9,
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.w, right: 16.w),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 48.h,
                                                width: 48.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.grey,
                                                ),
                                                clipBehavior: Clip.hardEdge,
                                                child: Image.asset(
                                                  'assets/images/userP.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(width: 16.w),
                                              SizedBox(
                                                width: 280.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Priyanka singh',
                                                        style:
                                                            kManRope_500_16_001314),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Anxiety',
                                                            style:
                                                                kManRope_400_14_626A6A),
                                                        // SizedBox(width: 24.w),
                                                        Text(
                                                          '10 June 2022, 8:00AM',
                                                          style:
                                                              kManRope_400_14_626A6A,
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return SizedBox(height: 8.h);
                              },
                              itemCount: 3),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'This week (12)',
                            style: kManRope_500_16_001314,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              // height: 1.sh,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (ctx, index) {
                                    return Container(
                                      height: 80.h,
                                      width: 1.sw,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: kEDF6F9,
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.w, right: 16.w),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PJoiningScreen(
                                                                userId: "",
                                                                status: "",
                                                              )),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 48.h,
                                                    width: 48.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.grey,
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Image.asset(
                                                      'assets/images/userP.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                SizedBox(
                                                  width: 280.w,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Priyanka singh',
                                                          style:
                                                              kManRope_500_16_001314),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Anxiety',
                                                              style:
                                                                  kManRope_400_14_626A6A),
                                                          // SizedBox(width: 24.w),
                                                          Text(
                                                            '10 June 2022, 8:00AM',
                                                            style:
                                                                kManRope_400_14_626A6A,
                                                            textAlign:
                                                                TextAlign.end,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) {
                                    return SizedBox(height: 8.h);
                                  },
                                  itemCount: 12),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
