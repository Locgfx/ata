import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/fonts.dart';

class PAccountBankVerifyScreen extends StatefulWidget {
  final String currentBalance;
  const PAccountBankVerifyScreen({Key? key, required this.currentBalance})
      : super(key: key);

  @override
  State<PAccountBankVerifyScreen> createState() =>
      _PAccountBankVerifyScreenState();
}

class _PAccountBankVerifyScreenState extends State<PAccountBankVerifyScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      setPage();
    });
    //setPage();
  }

  setPage() {
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomWhiteAppBar(
        appBarText: '',
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // height: 40.h,
              width: 380.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Balance',
                    style: kManRope_500_16_001314,
                  ),
                  Text(
                    '₹${widget.currentBalance}',
                    style: kManRope_400_36_001314,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 106.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/account-login-verification 1.png',
                height: 267.h,
                width: 380.w,
              ),
            ),
            SizedBox(
              height: 56.h,
            ),
            Text(
              'Your bank account is verifying by our team.It may take 2-3 business day.',
              style: kManRope_400_16_001314,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
