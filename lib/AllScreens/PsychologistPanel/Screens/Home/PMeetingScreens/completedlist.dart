import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PMeetingScreens/Upcomingmeetings.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/completed_booking_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/completed_booking_models.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/decorations.dart';
import '../../../../../widgets/buttons.dart';

class CompletedList extends StatefulWidget {
  const CompletedList({Key? key}) : super(key: key);

  @override
  State<CompletedList> createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {
  bool _isLoading = false;

  List<CompletedBookingModel> modelList = [];
  _getData() {
    _isLoading = true;
    final resp = CompletedBookingApi().get();
    resp.then((value) {
      log(value.toString());
      setState(() {
        for (var v in value) {
          modelList.add(CompletedBookingModel.fromJson(v));
          _isLoading = false;
        }
      });
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
          : modelList.isEmpty
              ? Center(
                  child: Text("No Bookings yet."),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          //physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PJoiningScreen(
                                        bookingId: modelList[index].id.toString(),
                                            userId: modelList[index]
                                                .userId
                                                .toString(),
                                            status: "s",
                                          )),
                                );*/
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 1.sw,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: kEDF6F9,
                                        border:
                                            Border.all(color: Colors.white)),
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
                                          child: Image.network(
                                            modelList[index].photo.toString(),
                                            errorBuilder: (q, w, e) =>
                                                Image.asset(
                                              'assets/images/userP.png',
                                            ),
                                            fit: BoxFit.cover,
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
                                                  modelList[index]
                                                      .name
                                                      .toString(),
                                                  style:
                                                      kManRope_500_16_001314),
                                              Row(
                                                children: [
                                                  Text(
                                                      modelList[index]
                                                          .issueName
                                                          .toString(),
                                                      style:
                                                          kManRope_400_14_626A6A),
                                                  // SizedBox(width: 24.w),
                                                  Expanded(
                                                    child: Text(
                                                      DateFormat.yMMMd()
                                                          .add_jm()
                                                          .format(DateTime.parse(
                                                              "${modelList[index].date} ${modelList[index].timeSlot}")),
                                                      //'10 June 2022, 8:00AM',
                                                      style:
                                                          kManRope_400_14_626A6A,
                                                      textAlign: TextAlign.end,
                                                    ),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    width: 1.sw,
                                    child: MainButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpcomingMeetings(
                                                        screenName: "Completed",
                                                      )));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.h, bottom: 20.h),
                                          child: Text(
                                            "See all",
                                            style: kManRope_500_16_white,
                                          ),
                                        ),
                                        color: k006D77,
                                        shape: CustomDecoration()
                                            .button16Decoration()),
                                  ),
                              ],
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 12.h);
                          },
                          itemCount:
                              modelList.length > 4 ? 5 : modelList.length),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ),
    );
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }
}
