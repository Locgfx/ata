import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/add_bank.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import '../../../../constants/fonts.dart';

class WithDrawEarningsScreen extends StatefulWidget {
  const WithDrawEarningsScreen({Key? key}) : super(key: key);

  @override
  State<WithDrawEarningsScreen> createState() => _WithDrawEarningsScreenState();
}

class _WithDrawEarningsScreenState extends State<WithDrawEarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        appBarText: 'Withdraw',
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
                    '\$4391',
                    style: kManRope_400_36_001314,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/manage-bank-account.png',
                height: 252.h,
                width: 378.w,
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              'You don’t have add any bank account to withdraw money.',
              style: kManRope_400_16_626A6A,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 48.h,
              width: 379.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add an Account',
                    style: kManRope_500_16_006D77,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddBankScreen()));
                    },
                    child: Image.asset(
                      'assets/images/iconaddlarge.png',
                      height: 48.h,
                      width: 70.w,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
