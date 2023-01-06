import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class ChangeMobileNoScreen extends StatefulWidget {
  const ChangeMobileNoScreen({Key? key}) : super(key: key);

  @override
  State<ChangeMobileNoScreen> createState() => _ChangeMobileNoScreenState();
}

class _ChangeMobileNoScreenState extends State<ChangeMobileNoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40.w,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Change mobile number',
          style: kManRope_500_16_006D77,
        ),
        titleSpacing: 18.w,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 43.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile Number',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '9810745330',
                style: kManRope_400_16_Black,
              ),
              SizedBox(
                height: 62.h,
              ),
              Text(
                'Enter new mobile number',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(width: 380.w, child: TextField()),
              SizedBox(
                height: 56.h,
              ),
              Text(
                'Confirm new mobile number',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(width: 380.w, child: TextField()),
              SizedBox(
                height: 192.h,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You will reacive an otp to your new Mobile Number',
                      style: kManRope_400_16_626A6A,
                    ),
                    Text(
                      'after clicking next',
                      style: kManRope_400_16_626A6A,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 134.h,
              ),
              Center(
                child: MaterialButton(
                  color: kB5BABA,
                  height: 60,
                  minWidth: 168,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                    side: const BorderSide(color: kB5BABA),
                  ),
                  onPressed: () {
                    /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetEmailOTPScreen()));*/
                  },
                  child: Text(
                    'Next',
                    style: kManRope_400_16_white,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
