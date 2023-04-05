import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UMainCardWidget.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_order_history.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../UBookingScreens/UScheduleAppointmentScreen.dart';

class USessionDetailsScreen extends StatelessWidget {
  final ProfileOrderHistoryModel model;
  const USessionDetailsScreen({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: '',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 42.h, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 64.h,
                    width: 64.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image.network(
                      model.image.toString(),
                      fit: BoxFit.cover,
                      errorBuilder: (q, w, e) => Image.asset(
                        'assets/images/personss.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name.toString(),
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        model.designation.toString(),
                        style: kManRope_400_12_626A6A,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      //StarWidget()
                    ],
                  ),
                  SizedBox(
                    width: 72.w,
                  ),
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: MainButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icondownload18.png",
                              height: 16,
                              color: k006D77,
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              "Prescription",
                              style: kManRope_500_14_006D77,
                            ),
                          ],
                        ),
                        color: kE2F2F4,
                        shape: CustomDecoration().button10outlineDecoration(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                      child: SizedBox(
                    height: 56.h,
                    child: MainButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icondownload18.png",
                            height: 16,
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            "Download Invoice",
                            style: kManRope_500_14_white,
                          ),
                        ],
                      ),
                      color: k006D77,
                      shape: CustomDecoration().border10Decoration(),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Session details ',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              UMainCardWidget(
                decoration: CustomDecoration().card20Edf6Decoration(),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 24.h, bottom: 24.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: kManRope_400_16_626A6A,
                          ),
                          Text(
                            DateFormat("dd/MM/yyyy, hh:mm a")
                                .format(DateTime.parse(
                                    model.bookingDate.toString()))
                                .split(",")
                                .first,
                            style: kManRope_400_16_626A6A,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat("dd/MM/yyyy, hh:mm a")
                                .format(DateTime.parse(
                                    model.bookingDate.toString()))
                                .split(",")
                                .last,
                            style: kManRope_400_12_626A6A,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'session Type',
                            style: kManRope_400_16_626A6A,
                          ),
                          Text(
                            'Video',
                            style: kManRope_400_16_626A6A,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Issue',
                            style: kManRope_400_16_626A6A,
                          ),
                          Text(
                            model.issueName.toString(),
                            style: kManRope_400_16_626A6A,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: kManRope_400_16_626A6A,
                          ),
                          Text(
                            'INR ${model.pricing}',
                            style: kManRope_400_16_626A6A,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Text(
                'Rate your experience',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              StarRatingWidget(
                rating: model.rating.toString(),
                bookingId: model.id.toString(),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                          onPressed: () {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UScheduleAppointmentScreen(
                                          psychologist: UPsychologistModel.fromJson(json),
                                          issue: model.issueName.toString(), bookingType: model.bookingType.toString(), issueId: model.issue.toString(),
                                        )));*/
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text(
                              'Save',
                              style: kManRope_500_16_white,
                            ),
                          ),
                          color: k006D77,
                          shape: CustomDecoration().smallButton10Decoration()),
                    ),
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
