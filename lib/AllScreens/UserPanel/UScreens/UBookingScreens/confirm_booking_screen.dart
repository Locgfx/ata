import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/booking_successful_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UDoctorprofile.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class ConfirmAppointmentBooking extends StatefulWidget {
  const ConfirmAppointmentBooking(
      {Key? key, required this.issue, required this.date})
      : super(key: key);
  final String issue;
  final String date;

  @override
  State<ConfirmAppointmentBooking> createState() =>
      _ConfirmAppointmentBookingState();
}

class _ConfirmAppointmentBookingState extends State<ConfirmAppointmentBooking> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  final TextEditingController _couponController = TextEditingController();

  bool couponEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
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
                Text('Selected Psychologists', style: kManRope_700_16_001314),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 133.h,
                          width: 133.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24)),
                          child: Image.asset(
                            'assets/images/userP.png',
                            height: 135.h,
                            width: 133.w,
                            fit: BoxFit.cover,
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
                              'Priya Singh',
                              style: kManRope_400_16_001314,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'psychologist',
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            StarWidget()
                            // Row(
                            //   children: [
                            //     SvgPicture.asset(
                            //       'assets/icons/star.svg',
                            //       width: 12.w,
                            //       height: 12.h,
                            //     ),
                            //     SizedBox(
                            //       width: 4,
                            //     ),
                            //     Text(
                            //       '4.0',
                            //       style: kManRope_400_12_001314,
                            //     ),
                            //     SizedBox(
                            //       width: 4,
                            //     ),
                            //     Text(
                            //       '.',
                            //       style: kManRope_400_12_001314,
                            //     ),
                            //     SizedBox(
                            //       width: 4,
                            //     ),
                            //     Text(
                            //       '12 Yrs. Exp',
                            //       style: kManRope_400_12_001314,
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UDoctorProfileScreen()));
                      },
                      child: Container(
                        // color: Colors.red,
                        child: SvgPicture.asset(
                          'assets/icons/Frame 8498.svg',
                          width: 48.w,
                          height: 48.h,
                        ),
                      ),
                    ),
                  ],
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
                  '1:00 PM',
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
                  height: 48.h,
                  // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFB5BABA))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 310.w,
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
                            contentPadding: EdgeInsets.only(left: 10),
                            isDense: true,
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
                      Container(
                        width: 55.w,
                        child: Center(
                          child: Text(
                            'Apply',
                            style: kManRope_500_16_006D77,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   width: 380.w,
                //   height: 48.h,
                //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(color: const Color(0xFFB5BABA))),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 200.w,
                //         child: Padding(
                //           padding: EdgeInsets.all(2.w),
                //           child: TextFormField(
                //             onChanged: (val) {
                //               if (val.isNotEmpty) {
                //                 setState(() {
                //                   couponEmpty = false;
                //                 });
                //               }
                //             },
                //             validator: (val) {
                //               if (_couponController.text.trim().isEmpty) {
                //                 return 'This coupon code is invalid or has expired.';
                //               } else {
                //                 return null;
                //               }
                //             },
                //             keyboardType: TextInputType.emailAddress,
                //             controller: _couponController,
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Coupon',
                //               hintStyle: kManRope_400_16_626A6A,
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 90.w,
                //       ),
                //       Container(
                //         width: 1.w,
                //         height: 58.h,
                //         color: const Color(0xFFB5BABA),
                //       ),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         'Apply',
                //         style: kManRope_500_16_006D77,
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 8),
                Text(
                  "“Coupon code applied successfully”",
                  style: kManRope_400_10_006D77,
                ),
                SizedBox(height: 47.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        // height:56.h,
                        child: Text(
                          '₹599',
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
                                        const BookingSuccessfulScreen(
                                          isCancellationAvailable: true,
                                        )));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ConfirmAppointmentBooking(
                            //           issue: widget.issue,
                            //           date: date,
                            //         ))
                            // );
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
      // bottomNavigationBar: Container(
      //   height: 83.h,
      //   child: Padding(
      //     padding: EdgeInsets.only(left: 24.w, right: 24.w),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text(
      //           '₹230',
      //           style: kManRope_500_20_006D77,
      //         ),
      //         SizedBox(
      //           height: 56.h,
      //           width: 200,
      //           child: MaterialButton(
      //             color: k006D77,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10), // <-- Radius
      //             ),
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           const BookingSuccessfulScreen()));
      //             },
      //             child: Text(
      //               'Proceed to payment',
      //               style: kManRope_400_16_white,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
