import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/my_account_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 130.w, right: 130.w, bottom: 40),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomSmallButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PsychologistAccountScreen()));
            },
            text: 'Save',
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 56,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 88.h),
                Text('Enter OTP', style: kManRope_700_20_001314),
                SizedBox(height: 8.h),
                Text('an OTP has been sent to XYZ@gmail.com',
                    style: kManRope_400_14_626A6A),
                SizedBox(height: 42.h),
                PinCodeTextField(
                  // onChanged: (val) {
                  //   if (val.isNotEmpty) {
                  //     setState(() {
                  //       otpEmpty = false;
                  //     });
                  //   }
                  // },
                  // validator: (otpText) {
                  //   if (otpText == null || otpText.isEmpty) {
                  //     return "Enter pin";
                  //   }
                  //   return null;
                  // },
                  // controller: otpController,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 6,
                  cursorColor: k006D77,
                  textStyle: kManRope_400_20_Black,
                  pinTheme: PinTheme(
                    inactiveColor: Colors.black,
                    fieldOuterPadding: const EdgeInsets.all(0),
                    selectedColor: k006D77,
                    borderWidth: 0,
                    fieldHeight: 50.h,
                    activeColor: k006D77,
                    shape: PinCodeFieldShape.underline,
                  ), onChanged: (String value) { },
                ),
                SizedBox(height: 506.h),
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
