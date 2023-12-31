import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/model/UModels/user_order_model/upcoming_orders.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:intl/intl.dart';

import '../../../../agora/meeting_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../widgets/BottomSheets/CancelBookingBottomSheet.dart';

class UBookingConfirmationScreen extends StatefulWidget {
  final bool isCancellationAvailable;
  //final UpcomingOrderData
  final UpcomingOrders model;
  const UBookingConfirmationScreen({
    Key? key,
    required this.isCancellationAvailable,
    required this.model,
  }) : super(key: key);

  @override
  State<UBookingConfirmationScreen> createState() =>
      _UBookingConfirmationScreenState();
}

class _UBookingConfirmationScreenState
    extends State<UBookingConfirmationScreen> {
  void _selectGender() {
    showModalBottomSheet(
        backgroundColor: kFFFFFF,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => CancelBottomSheet(
              name: widget.model.name,
              psyId: int.parse(widget.model.psyId),
              bookingId: int.parse(widget.model.id),
            ));
  }

  UPsychologistModel psyModel = UPsychologistModel();

  @override
  void initState() {
    psyModel = UPsychologistModel(
      psychologistId: widget.model.psyId,
      name: widget.model.name,
      profilePhoto: widget.model.image,
      designation: widget.model.designation,
      price: widget.model.price,
      rating: widget.model.rating,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: widget.isCancellationAvailable ? true : false,
        onThreeDotTap: () {
          _selectGender();
        },
        appBarText: 'Upcoming Appointment',
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w, bottom: 35.h),
        child: SizedBox(
          child: ListView(
            children: [
              Text('Selected Counsellor', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      widget.model.image,
                      height: 135.w,
                      width: 135.w,
                      fit: BoxFit.cover,
                      errorBuilder: (q, w, e) => Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 98,
                          child: Text(
                            widget.model.name.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: kManRope_500_16_001314,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          widget.model.designation.toString(),
                          style: kManRope_400_14_626A6A,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        //StarWidget()
                      ],
                    ),
                  ),
                  /*GestureDetector(
                    onTap: () {
                      */ /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UDoctorProfileScreen(
                                bookingType: widget.model.bookingType,
                                showBookSession: true,
                                issue: widget.model.issue,
                                issueId: widget.model.issueId,
                                psychologistData: widget.model,
                              )));*/ /*
                      */ /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UDoctorProfileScreen()));*/ /*
                    },
                    child: SvgPicture.asset(
                      'assets/icons/sarrow.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),*/
                ],
              ),
              SizedBox(
                height: 44.h,
              ),
              Text('Selected issue', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Text(
                widget.model.issueName.toString(),
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text('Selected Date', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Text(
                DateFormat.yMMMEd().format(DateTime.parse(
                    "${widget.model.date} ${widget.model.timeSlot}")),
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text('Selected Slot', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Text(
                DateFormat.jm().format(DateTime.parse(
                    "${widget.model.date} ${widget.model.timeSlot}")),
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 77.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 123.w, right: 123.w, bottom: 35.h),
        child: MainButton(
            onPressed:
                DateTime.parse("${widget.model.date} ${widget.model.timeSlot}")
                            .difference(DateTime.now())
                            .inMinutes >
                        1
                    ? () {
                        log(DateTime.parse(
                                "${widget.model.date} ${widget.model.timeSlot}")
                            .difference(DateTime.now())
                            .inMinutes
                            .toString());
                        Fluttertoast.showToast(
                            msg: "You cannot join before time slot");
                      }
                    : () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => MeetingScreen(
                                  date: DateFormat.yMMMEd().format(DateTime.parse(
                                      "${widget.model.date} ${widget.model.timeSlot}")),
                                  issue: widget.model.issueName.toString(),
                                  bookingId: widget.model.id,
                                  model: psyModel,
                                )));
                      },
            child: Padding(
              padding: EdgeInsets.only(
                top: 19.h,
                bottom: 19.h,
              ),
              child: Text(
                "Join meeting",
                style: kManRope_400_16_white,
              ),
            ),
            color:
                DateTime.parse("${widget.model.date} ${widget.model.timeSlot}")
                            .difference(DateTime.now())
                            .inMinutes >
                        1
                    ? k66898D
                    : k006D77,
            shape: CustomDecoration().button08Decoration()),
      ),
    );
  }
}
