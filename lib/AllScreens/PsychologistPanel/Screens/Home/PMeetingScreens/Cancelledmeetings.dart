import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/cancelled_booking_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/completed_booking_models.dart';
import 'package:greymatter/widgets/BottomSheets/CalenderBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

import '../../../../../model/PModels/home_models/cancelled_booking_model.dart';

class CancelledMeetings extends StatefulWidget {
  const CancelledMeetings({Key? key}) : super(key: key);

  @override
  State<CancelledMeetings> createState() => _CancelledMeetingsState();
}

class _CancelledMeetingsState extends State<CancelledMeetings> {
  void _calenderbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const CalenderBottomSheet());
  }

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
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            appBarText: 'Cancelled  ',
            imgPath: 'assets/images/iconbackappbarlarge.png',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cancelled   (100+)',
                        style: kManRope_700_16_001314,
                      ),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _calenderbottomsheet();
                          },
                          child: Image.asset(
                            "assets/images/iconcalender.png",
                            height: 24.h,
                            width: 24.w,
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        // height: 170.h,
                        child: ListView.separated(
                          itemCount: cancelledBooking.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return Container(
                              height: 80.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kEDF6F9,
                                  border: Border.all(color: Colors.white)),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
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
                                            imageUrl: cancelledBooking[index]
                                                .photo
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
                                                  cancelledBooking[index]
                                                      .name
                                                      .toString(),
                                                  style:
                                                      kManRope_500_16_001314),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      cancelledBooking[index]
                                                          .date
                                                          .toString(),
                                                      style:
                                                          kManRope_400_14_626A6A),
                                                  // SizedBox(width: 24.w),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        cancelledBooking[index]
                                                            .date
                                                            .toString(),
                                                        style:
                                                            kManRope_400_14_626A6A,
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                      Text(
                                                        cancelledBooking[index]
                                                            .timeSlot
                                                            .toString(),
                                                        style:
                                                            kManRope_400_14_626A6A,
                                                        textAlign:
                                                            TextAlign.end,
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
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 8.h);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading) LoadingWidget()
      ],
    );
  }
}
