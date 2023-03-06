import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UBookingSuccessfulScreen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class UConfirmBookingScreen extends StatefulWidget {
  const UConfirmBookingScreen({Key? key, required this.issue})
      : super(key: key);
  final String issue;

  @override
  State<UConfirmBookingScreen> createState() => _UConfirmBookingScreenState();
}

class _UConfirmBookingScreenState extends State<UConfirmBookingScreen> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  final TextEditingController _couponController = TextEditingController();

  bool couponEmpty = true;

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
                Text('Selected Counselors', style: kManRope_700_16_001314),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 64.h,
                          width: 64.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            border: Border.all(color: kFFFFFF, width: 1),
                            borderRadius: BorderRadius.circular(16),
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/userP.png'),fit: BoxFit.cover
                            // )
                          ),
                          child: Image.asset(
                            "assets/images/userP.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Priya Singh',
                              overflow: TextOverflow.ellipsis,
                              style: kManRope_400_16_001314,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'MA in Counselling Psychology',
                              style: kManRope_400_14_626A6A,
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            //StarWidget()
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/rightarrowcircle.png",
                      height: 48.h,
                      width: 48.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 43.h,
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
                      SizedBox(
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
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "“Coupon code applied successfully”",
                  style: kManRope_400_10_006D77,
                ),
                SizedBox(
                  height: 239.h,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'You’ll be connected to the psychologist within 60',
                        style: kManRope_400_14_001314,
                      ),
                      Text(
                        'seconds after the payment',
                        style: kManRope_400_14_001314,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  height: 83.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          // height:56.h,
                          child: Text(
                            '₹230',
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
                              'Proceed to payment',
                              style: kManRope_400_16_white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
