import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/basic_details_widget.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../profile_screens/reset_email_otp_screen.dart';

class PsychologistChangeEmailScreen extends StatefulWidget {
  const PsychologistChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistChangeEmailScreen> createState() =>
      _PsychologistChangeEmailScreenState();
}

class _PsychologistChangeEmailScreenState
    extends State<PsychologistChangeEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        appBarText: 'Change email',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
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
                height: 60.h,
              ),
              TextField(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PsychologistChangeEmailScreen()));
                },
                readOnly: true,
                decoration: TextfieldDecoration(
                  hintstyle: kManRope_400_16_626A6A,
                  label: 'Change email',
                ).underlinefieldDecoration(),
              ),
              SizedBox(
                height: 50.h,
              ),

              BlackUnderline(),
              TextField(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PsychologistChangeEmailScreen()));
                },
                readOnly: true,
                decoration: TextfieldDecoration(
                  hintstyle: kManRope_400_16_626A6A,
                  label: 'Change password',
                ).underlinefieldDecoration(),
              ),
              SizedBox(
                height: 50.h,
              ),
              BlackUnderline(),
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
              SizedBox(
                height: 191.h,
              ),
              Center(
                child: Text(
                  'You will receive an otp to your new email after clicking next',
                  style: kManRope_400_16_626A6A,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 134.h,
              ),
              Center(
                child: SizedBox(
                  height: 60.h,
                  width: 168.w,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResetEmailOTPScreen()));
                    },
                    color: k006D77,
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
            ],
          ),
        ),
      ),
    );
  }
}
