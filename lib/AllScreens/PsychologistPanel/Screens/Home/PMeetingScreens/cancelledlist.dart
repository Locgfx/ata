import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PMeetingScreens/Cancelledmeetings.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/cancelled_booking_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/cancelled_booking_model.dart';
import 'package:intl/intl.dart';
import '../../../../../constants/decorations.dart';
import '../../../../../widgets/buttons.dart';
import 'Upcomingmeetings.dart';

class CancelledList extends StatefulWidget {
  const CancelledList({Key? key}) : super(key: key);

  @override
  State<CancelledList> createState() => _CancelledListState();
}

class _CancelledListState extends State<CancelledList> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  CancelledBookingModel model = CancelledBookingModel();
  List<CancelledBookingModel> cancelledBooking = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = CancelledBookingApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          cancelledBooking.add(CancelledBookingModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: _isLoading || cancelledBooking.isEmpty
          ? Center(
              child: SpinKitThreeBounce(
                color: k006D77,
                size: 30,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cancelledBooking.length > 4
                        ? 5
                        : cancelledBooking.length,
                    scrollDirection: Axis.vertical,
                    //physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          Container(
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
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: CachedNetworkImage(
                                    imageUrl: cancelledBooking[index]
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          cancelledBooking[index]
                                              .name
                                              .toString(),
                                          style: kManRope_500_16_001314),
                                      Row(
                                        children: [
                                          Text(
                                              cancelledBooking[index]
                                                  .issueName
                                                  .toString(),
                                              style: kManRope_400_14_626A6A),
                                          // SizedBox(width: 24.w),
                                          Expanded(
                                            child: Text(
                                              DateFormat.yMMMd()
                                                  .add_jm()
                                                  .format(DateTime.parse(
                                                      "${cancelledBooking[index].date.toString()} ${cancelledBooking[index].timeSlot.toString()}")),
                                              style: kManRope_400_14_626A6A,
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (index == 4) SizedBox(height: 16),
                          if (index == 4)
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              width: 1.sw,
                              child: MainButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpcomingMeetings(
                                                  screenName: "Cancelled",
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
                                  shape:
                                      CustomDecoration().button16Decoration()),
                            ),
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
