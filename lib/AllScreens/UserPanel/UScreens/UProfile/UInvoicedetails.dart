import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/order_history/invoice_details.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/invoice_details_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';

class UInvoiceDetails extends StatefulWidget {
  final String bookingId;
  const UInvoiceDetails({Key? key, required this.bookingId}) : super(key: key);

  @override
  State<UInvoiceDetails> createState() => _UInvoiceDetailsState();
}

class _UInvoiceDetailsState extends State<UInvoiceDetails> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  InvoiceDetailsModel model = InvoiceDetailsModel();
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = InvoiceDetails().get(bookingId: widget.bookingId);
    resp.then((value) {
      log(value.toString());

      setState(() {
        model = InvoiceDetailsModel.fromJson(value);
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: 'Invoice details',
      ),
      body: _isLoading
          ? LoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 26.h, bottom: 26.h),
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
                          model.orderId.toString(),
                          style: kManRope_400_14_5A898B,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      '₹${model.totalPayment.toString()}',
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
                          "DateFormat.yMMMMd().format(DateTime.parse(model.dateTime.toString()))",
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
                          'Counsellors',
                          style: kManRope_500_14_001314,
                        ),
                        Text(
                          model.name.toString(),
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
                          model.issue.toString(),
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
                          'INR ${model.amount}',
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
                          'INR ${model.tax}',
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
                          'INR ${model.discount}',
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
                          '₹${model.totalPayment}',
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
                          model.transactionId.toString(),
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
