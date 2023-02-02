import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/basic_details_widget.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/reset_email_otp_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class PsychologistChangeEmailScreen extends StatefulWidget {
  const PsychologistChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistChangeEmailScreen> createState() =>
      _PsychologistChangeEmailScreenState();
}

class _PsychologistChangeEmailScreenState
    extends State<PsychologistChangeEmailScreen> {
  final e = TextEditingController();
  final eC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Change email',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 39.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current email',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'priyasingh344@gmail.com',
                style: kManRope_400_16_001314,
              ),
              SizedBox(
                height: 62.h,
              ),

              Text(
                'Enter New email ',
                style: kManRope_400_16_626A6A,
              ),
              // SizedBox(
              //   height: 8.h,
              // ),
              Container(
                height: 48.h,
                // color: Colors.red,
                child: TextField(
                  controller: e,
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
                'Confirm new email ',
                style: kManRope_400_16_626A6A,
              ),
              // SizedBox(
              //   height: 8.h,
              // ),
              Container(
                height: 48.h,
                // color: Colors.red,
                child: TextField(
                  controller: eC,
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
                'You will receive an otp to your new email after clicking next',
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
                        builder: (context) => ResetEmailOTPScreen()));
                  },
                  color: (e.text == eC.text && eC.text.contains('@'))
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
