import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UBookingSuccessfulScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../UExploreScreens/UDoctorprofile.dart';

class UConfirmAppointmentBooking extends StatefulWidget {
  const UConfirmAppointmentBooking({
    Key? key,
    required this.issue,
    required this.date,
    required this.psychologist,
    required this.slot,
  }) : super(key: key);
  final UPsychologistModel psychologist;
  final String slot;
  final String issue;
  final String date;

  @override
  State<UConfirmAppointmentBooking> createState() =>
      _UConfirmAppointmentBookingState();
}

class _UConfirmAppointmentBookingState
    extends State<UConfirmAppointmentBooking> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  final TextEditingController _couponController = TextEditingController();

  bool couponEmpty = true;
  bool applied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Confirm your booking',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: Form(
        key: _fKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selected Counselors', style: kManRope_700_16_001314),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UDoctorProfileScreen(
                                  showBookSession: false,
                                  psychologistData: widget.psychologist,
                                  issue: widget.issue,
                                )));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 133.w,
                              width: 133.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.psychologist.profilePhoto.toString(),
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
                            SizedBox(
                              width: 18.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.psychologist.name!,
                                  style: kManRope_400_16_001314,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  widget.psychologist.designation!,
                                  style: kManRope_400_14_626A6A,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                StarWidget(
                                  rating: widget.psychologist.rating.toString(),
                                  experience: widget.psychologist.totalExprience
                                      .toString(),
                                )
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/icons/Frame 8498.svg',
                          width: 48.w,
                          height: 48.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text('Selected issue', style: kManRope_700_16_001314),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  widget.issue,
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
                  widget.date,
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
                  widget.slot,
                  style: kManRope_500_16_006D77,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Apply Coupon Code',
                  style: kManRope_700_16_001314,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 380.w,
                  // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFB5BABA))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                couponEmpty = false;
                              });
                            }
                          },
                          validator: (val) {
                            if (_couponController.text.trim().isEmpty) {
                              return 'This coupon code is invalid or has expired.';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _couponController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Coupon',
                            hintStyle: kManRope_500_16_626A6A,
                          ),
                        ),
                      ),
                      Container(
                        width: 1.w,
                        height: 58.h,
                        color: const Color(0xFFB5BABA),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Colors.transparent,
                          width: 55.w,
                          child: Center(
                            child: Text(
                              'Apply',
                              style: kManRope_500_16_006D77,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                if (applied)
                  Text(
                    "“Coupon code applied successfully”",
                    style: kManRope_400_14_006D77,
                  ),
                SizedBox(height: 47.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        // height:56.h,
                        child: Text(
                          '₹${widget.psychologist.price}',
                          style: kManRope_500_20_006D77,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 56.h,
                        // width: 200,
                        child: MainButton(
                          color: k006D77,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UBookingSuccessfulScreen(
                                          isCancellationAvailable: true,
                                        )));
                          },
                          child: Text(
                            'Book session',
                            style: kManRope_400_16_white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
