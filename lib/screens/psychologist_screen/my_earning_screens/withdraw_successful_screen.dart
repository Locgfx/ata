import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/BankScreens/paymentdelay.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class WithdrawSuccessful extends StatefulWidget {
  const WithdrawSuccessful({Key? key}) : super(key: key);

  @override
  State<WithdrawSuccessful> createState() => _WithdrawSuccessfulState();
}

class _WithdrawSuccessfulState extends State<WithdrawSuccessful> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setPage();
    });
    //setPage();
  }

  setPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PaymentDelay()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusAppBar(
        appBarText: 'Withdrawal  Success',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Balance',
                    style: kManRope_500_16_001314,
                  ),
                  Text(
                    '\$391',
                    style: kManRope_400_36_001314,
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Image.asset(
                'assets/images/success.gif',
                height: 216.h,
                width: 216.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Congratulations!',
                style: kManRope_500_40_4CB15C,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Your withdrawal of \$4000 is successful. It may take 2-3 business day to reflect in your bank account.',
                style: kManRope_400_16_626A6A,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 107.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentDelay()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Text(
                          "Go to Home",
                          style: kManRope_500_16_006D77,
                        ),
                      ),
                      color: Colors.white,
                      shape: CustomDecoration().border10Decoration(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
