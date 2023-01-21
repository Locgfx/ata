import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAccountscreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class UOtpScreen extends StatefulWidget {
  const UOtpScreen({Key? key}) : super(key: key);

  @override
  State<UOtpScreen> createState() => _UOtpScreenState();
}

class _UOtpScreenState extends State<UOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 40.h,left: 135.w,right: 135.w),
        child: SizedBox(
          height: 60.h,
          // width: 168.w,
          child: MaterialButton(
            color: k006D77,
            height: 60,
            minWidth: 168,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
              side: const BorderSide(color: k006D77),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UAccountScreen()));

            },
            child: Text(
              'Save',
              style: kManRope_400_16_white,
            ),
          ),
        ),
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
          physics: NeverScrollableScrollPhysics(),
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
                SizedBox(height: 525.h),

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
                // Padding(
                //   padding: EdgeInsets.only(bottom: 40.h),
                //   child: Center(
                //     child: SizedBox(
                //       height: 60.h,
                //       width: 168.w,
                //       child: MaterialButton(
                //         color: k006D77,
                //         height: 60,
                //         minWidth: 168,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(48),
                //           side: const BorderSide(color: k006D77),
                //         ),
                //         onPressed: () {},
                //         child: Text(
                //           'Save',
                //           style: kManRope_400_16_white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
