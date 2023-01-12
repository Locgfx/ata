import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/BankScreens/paymentdelay2.dart';

class PaymentDelay extends StatefulWidget {
  const PaymentDelay({Key? key}) : super(key: key);

  @override
  State<PaymentDelay> createState() => _PaymentDelayState();
}

class _PaymentDelayState extends State<PaymentDelay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kD9D9D9,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 156.h,
              width: 379.w,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/iconcross.png",
                          height: 24.h,
                          width: 24.w,
                          // height: 12.h,
                          // width: 12.w,
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "We apologize for the delay in payment processing please wait or contact our team.",
                    style: kManRope_400_16_626A6A,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 32.h,
                    width: 389.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentDelay2()));
                          },
                          child: Text(
                            "Connect",
                            style: kManRope_500_20_006D77,
                          ),
                        ),
                        Image.asset(
                          "assets/images/iconrightarrow.png",
                          height: 24.h,
                          width: 24.w,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
