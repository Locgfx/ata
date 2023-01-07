import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class PaymentDelay2 extends StatefulWidget {
  const PaymentDelay2({Key? key}) : super(key: key);

  @override
  State<PaymentDelay2> createState() => _PaymentDelay2State();
}

class _PaymentDelay2State extends State<PaymentDelay2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "We apologize for the delay in payment processing please wait or contact our team.",
              style: kManRope_400_16_626A6A,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 172.h),
            Row(
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
                  "assets/images/rightarrow.png",
                  height: 10.h,
                  width: 10.w,
                )
              ],
            ),
            SizedBox(height: 40.h),
            Row(
              children: [
                Expanded(
                  child: MainButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PaymentDelay()),
                      // );
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
    );
  }
}
