import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UInvoiceDetails extends StatefulWidget {
  const UInvoiceDetails({Key? key}) : super(key: key);

  @override
  State<UInvoiceDetails> createState() => _UInvoiceDetailsState();
}

class _UInvoiceDetailsState extends State<UInvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(imgPath: 'assets/images/iconbackappbar2.png', appBarText: 'Invoice details',),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(left: 24.w, right: 24.w, top: 26.h, bottom: 26.h),
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
                height: 20.h,
              ),
              Text(
                '₹400',
                style: kManRope_500_28_001314,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
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
                style: kManRope_500_14_929292,
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Psychologist',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    'Priya Singh',
                    style: kManRope_500_14_001314,
                    //overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Issue',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    'Stress',
                    style: kManRope_400_14_001314,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                width: 1.sw,
                color: kD9D9D9,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Payment Details',
                style: kManRope_500_14_929292,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Base Price',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    'INR 399',
                    style: kManRope_400_14_001314,
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    'INR 100',
                    style: kManRope_400_14_001314,
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    'INR 99',
                    style: kManRope_400_14_001314,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                width: 1.sw,
                color: kD9D9D9,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    '₹499',
                    style: kManRope_500_14_001314,
                  )
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction ID',
                    style: kManRope_500_14_001314,
                  ),
                  Text(
                    'txn_1I1F740flI0g7f',
                    style: kManRope_400_14_001314,
                  )
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              SizedBox(
                height: 56.h,
                width: 380.w,
                child: MaterialButton(
                  color: k006D77,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: k006D77),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/download.svg',
                        width: 24.w,
                        height: 24.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Download Invoice',
                        style: kManRope_500_16_white,
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
