import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PSuccessfulSessionScreen.dart';
import 'package:greymatter/Apis/DoctorApis/home_apis/appointment_details_api/appointment_details_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/appointment_details_model/appointment_details_model.dart';
import 'package:greymatter/widgets/BottomSheets/HistoryFilterBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:intl/intl.dart';

import '../../../../agora/meeting_screen.dart';
import '../../../../widgets/loadingWidget.dart';

class PJoiningScreen extends StatefulWidget {
  final String userId;
  final String bookingId;
  final String status;
  const PJoiningScreen({Key? key, required this.userId, required this.status, required this.bookingId})
      : super(key: key);

  @override
  State<PJoiningScreen> createState() => _PJoiningScreenState();
}

class _PJoiningScreenState extends State<PJoiningScreen> {
  var title = [
    "Issue",
    "Date of birth",
    "Gender",
    "Relationship status",
    "Occuption",
    "Date",
    "Slot",
  ];
  var desc = [
    "Loneliness",
    "25/ 02/1993",
    "Female",
    "Single",
    "Student",
    "Wed, 12/07/2022",
    "1:00 PM",
  ];
  AppointmentDetailsModel model = AppointmentDetailsModel();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    log(widget.bookingId);
    log(widget.status);
    final resp = AppointmentDetailsApi()
        .get(bookingId: widget.bookingId, status: widget.status);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        setState(() {
          model = AppointmentDetailsModel.fromJson(value['message']);
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
        appBarText: '',
        imgPath: "assets/images/iconbackappbarlarge.png",
        hasThreeDots: true,
        onThreeDotTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              context: context,
              builder: (context) => HistoryFilterBottomSheet());
        },
      ),
      body: _isLoading
          ? LoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Center(
                      child: Container(
                        height: 133.h,
                        width: 135.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(
                          model.photo.toString(),
                            fit: BoxFit.fill,
                          errorBuilder: (q, w, e) => Image.asset(
                              "assets/images/Rectangle 26.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      model.name.toString(),
                      style: kManRope_400_16_1314,
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[0],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          model.issue.toString(),
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[1],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          "${model.dob.toString().split("-").last}/${model.dob.toString().split("-")[1]}/${model.dob.toString().split("-").first}",
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[2],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          model.gender.toString().toLowerCase() == "m"
                              ? "Male"
                              : model.gender.toString().toLowerCase() == "f"
                                  ? "Female"
                                  : "Other",
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[3],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          model.relationshipStatus.toString().toLowerCase() ==
                                  "s"
                              ? "Single"
                              : model.relationshipStatus
                                          .toString()
                                          .toLowerCase() ==
                                      "m"
                                  ? "Married"
                                  : "Other",
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[4],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          model.occupation.toString(),
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[5],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          "${DateFormat("EEE").format(DateFormat("yyyy-MM-dd").parse(model.date.toString()))}, ${model.date.toString().split("-").last}/${model.date.toString().split("-")[1]}/${model.date.toString().split("-").first}",
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[6],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          DateFormat.jm().format(DateFormat("hh:mm:ss")
                              .parse(model.timeSlot.toString())),
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    /*SizedBox(
                      // height: 408.h,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        separatorBuilder: (ctx, index) {
                          return SizedBox(height: 40.h);
                        },
                        itemCount: title.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title[index],
                                style: kManRope_400_16_626A6A,
                              ),
                              Text(
                                desc[index],
                                style: kManRope_400_16_001314,
                              ),
                            ],
                          );
                        },
                      ),
                    ),*/
                    SizedBox(height: 75.h),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: MainButton(
                        shape: CustomDecoration().smallButton10Decoration(),
                        color: k66898D,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => MeetingScreen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 42.w, right: 46.w, top: 19.h, bottom: 19.h),
                          child: Text(
                            "Join meeting ",
                            style: kManRope_400_16_white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
