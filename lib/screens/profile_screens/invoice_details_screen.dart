import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 24.w),
      //   child: MainButton(
      //       onPressed: () {},
      //       child: Padding(
      //         padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SvgPicture.asset(
      //               'assets/icons/download.svg',
      //               width: 18.w,
      //               height: 18.h,
      //               color: Colors.white,
      //             ),
      //             SizedBox(
      //               width: 8.w,
      //             ),
      //             Text(
      //               'Download Invoice',
      //               style: kManRope_400_16_white,
      //             ),
      //           ],
      //         ),
      //       ),
      //       color: k006D77,
      //       shape: CustomDecoration().smallButton10Decoration()),
      // ),
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        imgPath: "assets/images/iconbackappbarlarge.png",
        appBarText: "Order History",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 25.h, bottom: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Order ID',
                    style: kManRope_500_14_001314,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    '09810745330001',
                    style: kManRope_400_14_5A898B,
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                '₹400',
                style: kManRope_500_28_001314,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 22.h,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Successful',
                      style: kManRope_400_14_001314,
                    ),
                    Text(
                      '10, June, 2022',
                      style: kManRope_400_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                width: 380.w,
                color: kD9D9D9,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Session Details',
                style: kManRope_500_14_626A6A,
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Psychologist',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'Priya Singh',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Issue',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'Stress',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                height: 1.h,
                width: 380.w,
                color: kD9D9D9,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Payment Details',
                style: kManRope_500_14_626A6A,
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Base Price',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'INR 399',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'INR 100',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'INR 99',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                width: 380.w,
                color: kD9D9D9,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'INR 499',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 145.h,
              ),
              SizedBox(
                height:22.h,width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction ID',
                      style: kManRope_500_14_001314,
                    ),
                    Text(
                      'txn_1I1F740flI0g7f',
                      style: kManRope_500_14_001314,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 82.h,
              ),
              SizedBox(
                height: 56.h,
                width: 380.w,
                child: MaterialButton(
                  color: k006D77,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: k006D77),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/download.svg',
                        width: 18.w,
                        height: 18.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Download Invoice',
                        style: kManRope_400_16_white,
                      ),
                    ],
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
