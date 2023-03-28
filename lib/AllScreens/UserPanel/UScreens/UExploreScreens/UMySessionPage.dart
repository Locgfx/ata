import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/USessionDetailsPage.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UMainCardWidget.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_order_history_api.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_order_history.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import 'UBookingConfirmationScreen.dart';

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

  List<ProfileOrderHistoryModel> previousSessions = [];
  List<ProfileOrderHistoryModel> upcomingSessions = [];
  bool loading = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    loading = true;
    final resp = UserOrderHistoryApi().get(page: 0, filter: "u");
    resp.then((value) {
      setState(() {
        for (var v in value) {
          upcomingSessions.add(ProfileOrderHistoryModel.fromJson(v));
        }
        upcomingSessions.removeWhere((element) =>
            DateTime.parse("${element.date} ${element.timeSlot}")
                .isBefore(DateTime.now()));
      });
    }).then((value) {
      final resp = UserOrderHistoryApi().get(page: 0, filter: "cs");
      resp.then((val) {
        setState(() {
          for (var v in val) {
            previousSessions.add(ProfileOrderHistoryModel.fromJson(v));
          }
          loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: loading
          ? LoadingWidget()
          : SingleChildScrollView(
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
                    upcomingSessions.isEmpty
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
                              decoration:
                                  CustomDecoration().card20Edf6Decoration(),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 24.h),
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
                                          upcomingSessions[0].image.toString(),
                                          fit: BoxFit.cover,
                                          errorBuilder: (q, w, e) =>
                                              Image.asset(
                                            'assets/images/userP.png',
                                            fit: BoxFit.cover,
                                          ),
                                        )),
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
                                                upcomingSessions[0]
                                                    .name
                                                    .toString(),
                                                style: kManRope_400_14_001314,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Text(
                                                upcomingSessions[0]
                                                    .designation
                                                    .toString(),
                                                style: kManRope_400_12_626A6A,
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
                                                        'dd MMMM yyyy, hh:MM a')
                                                    .format(DateTime.parse(
                                                        "${upcomingSessions[0].date} ${upcomingSessions[0].timeSlot}")),
                                                style: kManRope_400_12_626A6A,
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
                    previousSessions.isEmpty
                        ? Center(
                            child: Text(
                              'No Sessions Taken.',
                              style: kManRope_500_16_001314,
                            ),
                          )
                        : ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: previousSessions[index]
                                            .status
                                            .toString() ==
                                        "c"
                                    ? () {}
                                    : () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    USessionDetailsScreen(
                                                      model: previousSessions[
                                                          index],
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
                                                      previousSessions[index]
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
                                                                previousSessions[
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
                                                                  .format(DateTime.parse(previousSessions[
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
                                                              previousSessions[
                                                                      index]
                                                                  .designation
                                                                  .toString(),
                                                              style:
                                                                  kManRope_400_12_626A6A),
                                                          Text(
                                                              DateFormat(
                                                                      "dd MMMM yyyy, hh:MM a")
                                                                  .format(DateTime.parse(previousSessions[
                                                                          index]
                                                                      .bookingDate
                                                                      .toString()))
                                                                  .split(",")
                                                                  .last,
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
                                                        color: previousSessions[
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
                                                      child: previousSessions[
                                                                      index]
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
                                                    previousSessions[index]
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
                                                    previousSessions[index]
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
                            },
                            separatorBuilder: (ctx, index) {
                              return SizedBox(height: 24.h);
                            },
                            itemCount: previousSessions.length,
                          ),
                    SizedBox(height: 180),
                  ],
                ),
              ),
            ),
    );
  }
}
