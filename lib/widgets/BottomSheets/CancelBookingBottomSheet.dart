import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UScheduleAppointmentScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UCancelBookingScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/cancel_booking_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/buttons.dart';

class CancelBottomSheet extends StatefulWidget {
  final int bookingId;
  final int psyId;
  final String name;
  const CancelBottomSheet(
      {Key? key,
      required this.bookingId,
      required this.psyId,
      required this.name})
      : super(key: key);

  @override
  State<CancelBottomSheet> createState() => _CancelBottomSheetState();
}

class _CancelBottomSheetState extends State<CancelBottomSheet> {
  void _cancelBooking() {
    showModalBottomSheet(
        context: context,
        backgroundColor: kFFFFFF,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) =>
            CancelBooking(bookingId: widget.bookingId));
  }

  int _gIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Select One',
                style: kManRope_700_20_white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () => setState(() {
              // _gIndex = 0;
              Navigator.of(context).pop();
              _cancelBooking();
            }),
            child: Container(
              height: 44.h,
              //width: 123.w,
              margin: EdgeInsets.symmetric(horizontal: 135.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Colors.transparent,
              ),
              child: Center(
                  child: Text(
                'Cancel booking',
                style: kManRope_500_16_626A6A,
              )),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          GestureDetector(
            onTap: () => setState(() {
              //_gIndex = 1;
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => UScheduleAppointmentScreen(
                        issue: '',
                        psychologist: UPsychologistModel(
                            name: widget.name,
                            psychologistId: widget.psyId.toString()),
                        issueId: '',
                        bookingType: 'a',
                        reschedule: widget.bookingId.toString(),
                      )));
            }),
            child: Container(
              height: 44.h,
              margin: EdgeInsets.symmetric(horizontal: 135.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Colors.transparent,
              ),
              child: Center(
                  child: Text(
                'Reschedule',
                style: kManRope_500_16_626A6A,
              )),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}

class CancelBooking extends StatefulWidget {
  final int bookingId;
  const CancelBooking({Key? key, required this.bookingId}) : super(key: key);

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 212.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              final resp = CancelBookingApi()
                                  .get(bookingId: widget.bookingId);
                              resp.then((value) {
                                if (value == false) {
                                  Fluttertoast.showToast(
                                      msg: "Cancel booking failed.");
                                } else {
                                  if (value['status'] == true) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UCancelBookingScreen(
                                                  name: value['psychoogist'],
                                                )));
                                  } else {
                                    Fluttertoast.showToast(msg: value['error']);
                                  }
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Cancel booking",
                                style: kManRope_500_16_white,
                              ),
                            ),
                            color: k006D77,
                            shape: CustomDecoration().border16Decoration()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "By clicking the Cancel button your appointment will cancel",
                    style: kManRope_500_16_626A6A,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
