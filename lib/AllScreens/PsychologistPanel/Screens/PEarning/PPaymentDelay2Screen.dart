import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class PPaymentDelay2Screen extends StatefulWidget {
  const PPaymentDelay2Screen({Key? key}) : super(key: key);

  @override
  State<PPaymentDelay2Screen> createState() => _PPaymentDelay2ScreenState();
}

class _PPaymentDelay2ScreenState extends State<PPaymentDelay2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top:337.h),
              child: SizedBox(
                height: 84.h,
                width: 379.w,
                child: Text(
                  "We apologize for the delay in payment processing please wait or contact our team.",
                  style: kManRope_400_16_626A6A,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 148.h),
            SizedBox(
              height: 48.h,
              width: 359.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PPaymentDelay2Screen()));
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
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: MainButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PTabsScreen()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        bottom: 20.h,
                      ),
                      child: Text(
                        "Go to Home",
                        style: kManRope_500_16_006D77,
                      ),
                    ),
                    color: Colors.white,
                    shape: CustomDecoration().border16Decoration(),
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
