import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/Editbasicdetails.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/change_email_screen.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/my_account_screen.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetEmailOTPScreen extends StatefulWidget {
  const ResetEmailOTPScreen({Key? key}) : super(key: key);

  @override
  State<ResetEmailOTPScreen> createState() => _ResetPasswordOTPScreen();
}

class _ResetPasswordOTPScreen extends State<ResetEmailOTPScreen> {
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomSmallButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PsychologistAccountScreen()));
        },
        text: 'Save',
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(15),
                //     child: SvgPicture.asset('assets/icons/iosbackarrow.svg'),
                //   ),
                // ),
                SizedBox(height: 88.h),
                Text('Enter OTP', style: kManRope_700_20_001314),
                SizedBox(height: 8.h),
                Text('an OTP has been sent to XYZ@gmail.com',
                    style: kManRope_400_14_626A6A),
                SizedBox(height: 42.h),
                OTPTextField(
                  spaceBetween: 12,
                  length: 4,
                  width: 281.w,
                  fieldWidth: 41,
                  style: TextStyle(
                      fontSize: 17
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
                SizedBox(height: 506.h),

                // Center(
                //   child: SizedBox(
                //     height: 60.h,
                //     width: 168.w,
                //     child: MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => ResetEmailOTPScreen()));
                //       },
                //       color: k006D77,
                //       shape: CustomDecoration().smallButtonDecoration(),
                //       child: Center(
                //         child: Text(
                //           'Next',
                //           style: kManRope_500_16_white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Center(
                    child: SizedBox(
                      height: 60.h,
                      width: 168.w,
                      child: MaterialButton(
                        color: k006D77,
                        height: 60,
                        minWidth: 168,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                          side: const BorderSide(color: k006D77),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: kManRope_400_16_white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
