import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/Editbasicdetails.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import 'UOtpScreen.dart';

class UChangeMobileNoScreen extends StatefulWidget {
  const UChangeMobileNoScreen({Key? key}) : super(key: key);

  @override
  State<UChangeMobileNoScreen> createState() => _UChangeMobileNoScreenState();
}

class _UChangeMobileNoScreenState extends State<UChangeMobileNoScreen> {
  final mNo = TextEditingController();
  final mCNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Change mobile number',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 39.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Phone Number',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '9810745330',
                style: kManRope_400_16_001314,
              ),
              SizedBox(
                height: 62.h,
              ),

              Text(
                'Enter new mobile number ',
                style: kManRope_400_16_626A6A,
              ),
              // SizedBox(
              //   height: 8.h,
              // ),
              Container(
                height: 48.h,
                // color: Colors.red,
                child: TextField(
                  controller: mNo,
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => PsychologistChangeEmailScreen()));
                  },
                  // readOnly: true,
                  decoration: TextfieldDecoration(
                    hintstyle: kManRope_400_16_626A6A,
                    label: '',
                  ).underlinefieldDecoration(),
                ),
              ),

              BlackUnderline(),
              SizedBox(
                height: 50.h,
              ),
              Text(
                'Confirm new mobile number ',
                style: kManRope_400_16_626A6A,
              ),
              // SizedBox(
              //   height: 8.h,
              // ),
              Container(
                height: 48.h,
                // color: Colors.red,
                child: TextField(
                  controller: mCNo,
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => PsychologistChangeEmailScreen()));
                  },
                  // readOnly: true,
                  decoration: TextfieldDecoration(
                    hintstyle: kManRope_400_16_626A6A,
                    label: '',
                  ).underlinefieldDecoration(),
                ),
              ),

              BlackUnderline(),

              // SizedBox(
              //   height: 50.h,
              // ),

              // SizedBox(
              //   height: 50.h,
              // ),
              // BlackUnderline(),
              // Text(
              //   'Enter new email ',
              //   style: kManRope_400_16_626A6A,
              // ),
              // SizedBox(
              //   width: 1.sw,
              //   child: TextField(),
              // ),
              // SizedBox(
              //   height: 50.h,
              // ),
              // Text(
              //   'Confirm new email',
              //   style: kManRope_400_16_626A6A,
              // ),
              // SizedBox(
              //   width: 1.sw,
              //   child: TextField(),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'You will receive an otp to your new number after clicking next',
                style: kManRope_400_16_626A6A,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 60.h,
                width: 168.w,
                child: MaterialButton(
                  onPressed: () {
                    /*if (mNo.text == mCNo.text && mCNo.text.length == 10) {

                    }*/
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UOtpScreen(email: false)));
                  },
                  color: (mNo.text == mCNo.text && mCNo.text.length == 10)
                      ? k006D77
                      : kB5BABA,
                  shape: CustomDecoration().smallButtonDecoration(),
                  child: Center(
                    child: Text(
                      'Next',
                      style: kManRope_500_16_white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
