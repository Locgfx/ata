import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PPaymentDelayScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class PWithdrawSuccessfulScreen extends StatefulWidget {
  final String currentBalance;
  const PWithdrawSuccessfulScreen({Key? key, required this.currentBalance})
      : super(key: key);

  @override
  State<PWithdrawSuccessfulScreen> createState() =>
      _PWithdrawSuccessfulScreenState();
}

class _PWithdrawSuccessfulScreenState extends State<PWithdrawSuccessfulScreen> {
  @override
  void initState() {
    super.initState();
  }

  setPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PPaymentDelayScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        appBarText: 'Withdrawal Success',
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // height: 36.h,
                width: 380.w,
                child: Row(
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
              ),
              SizedBox(
                height: 100.h,
              ),
              Image.asset(
                'assets/images/sd3.gif',
                width: 216.w,
                height: 216.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 146.h,
                width: 380.w,
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              SizedBox(
                height: 107.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 173.h),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PTabsScreen()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 20.h,
                          ),
                          child: Text(
                            "Go to Home",
                            style: kManRope_500_16_white,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().border16Decoration(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
