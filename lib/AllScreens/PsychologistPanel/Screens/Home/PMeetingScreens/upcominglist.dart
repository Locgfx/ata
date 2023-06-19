import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PJoiningScreen.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/upcoming_booking_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/model/PModels/home_models/upcoming_booking_model.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/decorations.dart';
import '../../../../../constants/fonts.dart';
import '../../../../../widgets/buttons.dart';
import 'Upcomingmeetings.dart';

class UpcomingList extends StatefulWidget {
  const UpcomingList({Key? key}) : super(key: key);

  @override
  State<UpcomingList> createState() => _UpcomingListState();
}

class _UpcomingListState extends State<UpcomingList> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  UpcomingBookingModel model = UpcomingBookingModel();
  List<UpcomingBookingModel> upcomingBooking = [];
  bool _isLoading = false;

  int _scroll = 0;
  getData() {
    _isLoading = true;
    final resp = UpcomingBookingApi().get(scroll: "0");
    resp.then((value) {
      log(value.toString() + "hhh");
      if (mounted) {
        setState(() {
          for (var v in value) {
            upcomingBooking.add(UpcomingBookingModel.fromJson(v));
          }
          log(upcomingBooking.length.toString());
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: _isLoading
          ? Center(
              child: SpinKitThreeBounce(
                color: k006D77,
                size: 30,
              ),
            )
          : upcomingBooking.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Image.asset("assets/images/nobooking.png"),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "No completed appointment yet.",
                        style: kManRope_500_24_001314,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: upcomingBooking.length > 4
                            ? 5
                            : upcomingBooking.length,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PJoiningScreen(
                                              userId: upcomingBooking[index]
                                                  .userId
                                                  .toString(),
                                              bookingId: upcomingBooking[index]
                                                  .id
                                                  .toString(),
                                              status: "u",
                                            )),
                                  );
                                },
                                child: Container(
                                  height: 80,
                                  width: 1.sw,
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: kEDF6F9,
                                      border: Border.all(color: Colors.white)),
                                  child: Row(
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
                                          imageUrl: upcomingBooking[index]
                                              .photo
                                              .toString(),
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                            child: SpinKitThreeBounce(
                                              color: k006D77,
                                              size: 10,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                upcomingBooking[index]
                                                    .name
                                                    .toString(),
                                                style: kManRope_500_16_001314),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    upcomingBooking[index]
                                                        .issueName
                                                        .toString(),
                                                    style:
                                                        kManRope_400_14_626A6A),
                                                // SizedBox(width: 24.w),
                                                Row(
                                                  children: [
                                                    Text(
                                                      DateFormat.yMMMd()
                                                          .add_jm()
                                                          .format(DateTime.parse(
                                                              "${upcomingBooking[index].date.toString()} ${upcomingBooking[index].timeSlot.toString()}")),
                                                      style:
                                                          kManRope_400_14_626A6A,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (index == 4) SizedBox(height: 16),
                              if (index == 4)
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  width: 1.sw,
                                  height: 56.h,
                                  child: MainButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpcomingMeetings(
                                                      screenName: "Upcoming",
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 18.h, bottom: 18.h),
                                        child: Text(
                                          "See all",
                                          style: kManRope_500_16_white,
                                        ),
                                      ),
                                      color: k006D77,
                                      shape: CustomDecoration()
                                          .button16Decoration()),
                                )
                            ],
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return SizedBox(height: 12.h);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ),
    );
  }
}
