import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UprofileScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_change_mobile_no_enter_otp_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UChangeMobileEnterOtpScreen extends StatefulWidget {
  final String number;
  const UChangeMobileEnterOtpScreen({Key? key, required this.number})
      : super(key: key);

  @override
  State<UChangeMobileEnterOtpScreen> createState() =>
      _UChangeMobileEnterOtpScreenState();
}

class _UChangeMobileEnterOtpScreenState
    extends State<UChangeMobileEnterOtpScreen> {
  TextEditingController otpController = TextEditingController();

  bool otpEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 88.h),
                Text('Enter OTP', style: kManRope_700_20_001314),
                SizedBox(height: 8.h),
                Text('an OTP has been sent to ${widget.number}',
                    style: kManRope_400_14_626A6A),
                SizedBox(height: 42.h),
                PinCodeTextField(
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        otpEmpty = false;
                      });
                    }
                  },
                  // validator: (otpText) {
                  //   if (otpText == null || otpText.isEmpty) {
                  //     return "Enter pin";
                  //   }
                  //   return null;
                  // },
                  controller: otpController,
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
                  ),
                ),
                Spacer(),
                // SizedBox(height: 525.h),
                otpEmpty
                    ? CustomSmallDeactiveTextButton(
                        onPressed: () {}, text: 'Save')
                    : CustomSmallActiveTextButton(
                        onPressed: () {
                          final resp = ChangeMobileNoEnterOtpApi()
                              .get(otp: otpController.text);
                          resp.then((value) {
                            print(value);
                            if (value['status'] == true) {
                              Fluttertoast.showToast(msg: value['message']);
                              int count = 0;
                              Navigator.popUntil(context, (route) {
                                return count++ == 3;
                              });
                              /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UProfileScreen()));*/
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Please enter valid otp');
                            }
                          });
                        },
                        text: 'Save'),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
