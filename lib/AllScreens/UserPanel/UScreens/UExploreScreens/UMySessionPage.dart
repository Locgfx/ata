import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UMainCardWidget.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_order_history_api.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_order_history.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_order_model/upcoming_orders.dart';
import 'UBookingConfirmationScreen.dart';
import 'USessionDetailsPage.dart';

class UMySessionPage extends StatefulWidget {
  const UMySessionPage({Key? key}) : super(key: key);

  @override
  State<UMySessionPage> createState() => _UMySessionPageState();
}

class _UMySessionPageState extends State<UMySessionPage> {
  int _selectedIndex = 0;

  /*_onSelected(int index) {
    setState(() => _selectedIndex = index);
  }*/

  List<ProfileOrderHistoryModel> allSessions = [];
  List<ProfileOrderHistoryModel> upcomingSessions = [];
  bool loading = false;

  @override
  void initState() {
    // _getData();
    // getAllSessions();
    getUpcomingAppointments();
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
                          //             // DateTime(
                          //             //     DateTime.now().year,
                          //             //     DateTime.now().month,
                          //             //     DateTime.now().day,
                          //             //     DateTime.now().hour,
                          //             //     60)
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

  // _getData() {
  //   loading = true;
  //   final resp = UserOrderHistoryApi().get(page: 0, filter: "u");
  //   resp.then((value) {
  //     setState(() {
  //       // upcomingSessions.clear();
  //       for (var v in value) {
  //         upcomingSessions.add(ProfileOrderHistoryModel.fromJson(v));
  //       }
  //       // loading = false;
  //       upcomingSessions.removeWhere((element) =>
  //           DateTime.parse("${element.date} ${element.timeSlot}")
  //               .isBefore(DateTime.now()));
  //     });
  //   });
  //   //     .then((value) {
  //   //   getAllSessions();
  //   //   // _getAllSessions();
  //   // });
  // }

  int _scroll = 0;
  int dataVal = 0;
  bool isLoading = false;
  // _getAllReloadedSessions() {
  //   _scroll++;
  //   final resp = UserOrderHistoryApi().get(page: _scroll, filter: "cs");
  //   resp.then((val) {
  //     setState(() {
  //       dataVal = val.length;
  //       for (var v in val) {
  //         previousSessions.add(ProfileOrderHistoryModel.fromJson(v));
  //       }
  //       isLoading = false;
  //     });
  //   });
  // }
  //
  // _getAllSessions() {
  //   final resp = UserOrderHistoryApi().get(page: 0, filter: "cs");
  //   resp.then((val) {
  //     log(val.toString());
  //     setState(() {
  //       previousSessions.clear();
  //       dataVal = val.length;
  //       for (var v in val) {
  //         previousSessions.add(ProfileOrderHistoryModel.fromJson(v));
  //       }
  //       loading = false;
  //     });
  //   });
  // }
  getAllReloadedSessions() {
    _scroll++;
    final resp = AllSessionApi().get(page: 0);
    resp.then((val) {
      setState(() {
        dataVal = val.length;
        for (var v in val) {
          allSessions.add(ProfileOrderHistoryModel.fromJson(v));
          print(allSessions.length);
        }
        allSessions.removeWhere(
            (element) => element.status.toString().toLowerCase() == 'u');
        loading = false;
      });
    });
  }

  getAllSessions() {
    final resp = AllSessionApi().get(page: 0);
    resp.then((val) {
      log(val.toString());
      setState(() {
        allSessions.clear();
        dataVal = val.length;
        for (var v in val) {
          allSessions.add(ProfileOrderHistoryModel.fromJson(v));
          print('aallsdjsan  ${allSessions.length}');
        }
        allSessions.removeWhere(
            (element) => element.status.toString().toLowerCase() == 'u');
        loading = false;
      });
    });
  }

  //-------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body:
          // loading
          //     ? LoadingWidget()
          //     :
          RefreshIndicator(
        onRefresh: () {
          setState(() {
            loading = true;
          });
          return getUpcomingAppointments();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 40.h, right: 24.h, bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming sessions',
                  style: kManRope_700_16_001314,
                ),
                SizedBox(height: 24.h),
                upcomingOrderData.data.isEmpty
                    ? Center(
                        child: Text(
                          'No Upcoming sessions.',
                          style: kManRope_500_16_001314,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => UBookingConfirmationScreen(
                                    isCancellationAvailable: true,
                                  ),
                                ),
                              );*/
                        },
                        child: UMainCardWidget(
                          decoration: CustomDecoration().card20Edf6Decoration(),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 24.h),
                              child: ListView.separated(
                                itemCount: upcomingOrderData.data.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UBookingConfirmationScreen(
                                            model: upcomingOrderData.data[i],
                                            //   (
                                            // (element) => DateTime.parse(
                                            //         "${element.date} ${element.timeSlot}")
                                            //     .isAfter(DateTime.now())),
                                            isCancellationAvailable: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 64.h,
                                          width: 64.w,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Image.network(
                                            upcomingOrderData.data[i].image
                                                .toString()
                                                .toString(),
                                            fit: BoxFit.cover,
                                            errorBuilder: (q, w, e) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        SizedBox(
                                          width: 250.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    upcomingOrderData
                                                        .data[i].name
                                                        .toString()
                                                        .toString(),
                                                    style:
                                                        kManRope_400_14_001314,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Text(
                                                    upcomingOrderData
                                                        .data[i].designation
                                                        .toString(),
                                                    // upcomingSessions[i]
                                                    //     .designation
                                                    //     .toString(),
                                                    style:
                                                        kManRope_400_12_626A6A,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    DateFormat(
                                                            "EEE, d MMM, yyyy  h:mm a")
                                                        .format(
                                                      DateTime.parse(
                                                          "${upcomingOrderData.data[0].date} ${upcomingOrderData.data[i].timeSlot}"),

                                                      // DateFormat(
                                                      //         'dd MMMM yyyy, hh:MM a')
                                                      //     .format(DateTime.parse(
                                                      //         "${upcomingOrderData.data[0].date} ${upcomingOrderData.data[i].timeSlot}"
                                                      //         // "${upcomingSessions[0].date} ${upcomingSessions[i].timeSlot}"
                                                      //         )
                                                    ),
                                                    style:
                                                        kManRope_400_12_626A6A,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                  height: 10,
                                ),
                              )),
                        ),
                      ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'All sessions',
                  style: kManRope_700_16_001314,
                ),
                SizedBox(
                  height: 24.h,
                ),
                allSessions.isEmpty
                    ? Center(
                        child: Text(
                          'No Sessions Taken.',
                          style: kManRope_500_16_001314,
                        ),
                      )
                    : LazyLoadScrollView(
                        onEndOfPage: () async {
                          setState(() {
                            isLoading = true;
                          });
                          return getAllReloadedSessions();
                        },
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: allSessions.length,
                          itemBuilder: (ctx, index) {
                            if (index < allSessions.length) {
                              return GestureDetector(
                                onTap:
                                    // allSessions[index].status.toString() == "c"
                                    //     ? () {}
                                    //     : ()
                                    () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          USessionDetailsScreen(
                                            model: allSessions[index],
                                          )));
                                },
                                child: UMainCardWidget(
                                  decoration:
                                      CustomDecoration().card20Edf6Decoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 19.w, vertical: 24.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    width: 64.w,
                                                    height: 64.h,
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Image.network(
                                                      allSessions[index]
                                                          .image
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (q, w, e) =>
                                                          Image.asset(
                                                        'assets/images/userP.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                SizedBox(width: 16.w),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 98,
                                                            child: Text(
                                                                allSessions[
                                                                        index]
                                                                    .name
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    kManRope_400_14_001314),
                                                          ),
                                                          Text(
                                                              DateFormat(
                                                                      "dd MMMM yyyy, hh:MM a")
                                                                  .format(DateTime.parse(allSessions[
                                                                          index]
                                                                      .bookingDate
                                                                      .toString()))
                                                                  .split(",")
                                                                  .first,
                                                              style:
                                                                  kManRope_400_14_626A6A),
                                                        ],
                                                      ),
                                                      //SizedBox(width: 10,),
                                                      SizedBox(height: 8.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              allSessions[index]
                                                                  .designation
                                                                  .toString(),
                                                              style:
                                                                  kManRope_400_12_626A6A),
                                                          Text(
                                                              DateFormat(
                                                                      "EEE, d MMM, yyyy  h:mm a")
                                                                  .format(
                                                                DateTime.parse(
                                                                    "${allSessions[index].date}"),
                                                              ),
                                                              // DateFormat(
                                                              //         "dd MMMM yyyy, hh:MM a")
                                                              //     .format(DateTime.parse(allSessions[
                                                              //             index]
                                                              //         .bookingDate
                                                              //         .toString()))
                                                              //     .split(",")
                                                              //     .last,
                                                              style:
                                                                  kManRope_400_14_626A6A),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 28.h,
                                                    width: 70.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    28)),
                                                        color: allSessions[
                                                                        index]
                                                                    .status
                                                                    .toString() ==
                                                                "c"
                                                            ? Color(0xFFFF5C5C)
                                                                .withOpacity(
                                                                    0.36)
                                                            : Color(0xFF006D77)
                                                                .withOpacity(
                                                                    0.36)),
                                                    child: Center(
                                                      child: allSessions[index]
                                                                  .status
                                                                  .toString() ==
                                                              "c"
                                                          ? Text(
                                                              'Canceled',
                                                              style:
                                                                  kManRope_400_12_001314,
                                                            )
                                                          : Text(
                                                              'Finished',
                                                              style:
                                                                  kManRope_400_12_001314,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    allSessions[index]
                                                                .status
                                                                .toString() ==
                                                            "c"
                                                        ? Text(
                                                            'Appointment cancelled by Psychologist',
                                                            style:
                                                                kManRope_400_10_F8474E,
                                                          )
                                                        : SizedBox.shrink(),
                                                    /*Text(
                                                                'Reschedule',
                                                                style:
                                                                    kManRope_600_14_006D77,
                                                              ),*/
                                                    SizedBox(width: 4.w),
                                                    allSessions[index]
                                                                .status
                                                                .toString() ==
                                                            "c"
                                                        ? SvgPicture.asset(
                                                            "assets/icons/iconred!.svg",
                                                            height: 18,
                                                            width: 18,
                                                          )
                                                        : SizedBox.shrink()
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (dataVal >= 10 && isLoading) {
                              return Center(
                                child: SpinKitThreeBounce(
                                  color: k006D77,
                                  size: 20,
                                ),
                              );
                            } else if (dataVal < 10) {
                              return SizedBox.shrink();
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 24.h);
                          },
                        ),
                      ),
                SizedBox(height: 180),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
