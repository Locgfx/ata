import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAccountscreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UOtpScreen extends StatefulWidget {
  final bool email;
  const UOtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<UOtpScreen> createState() => _UOtpScreenState();
}

class _UOtpScreenState extends State<UOtpScreen> {
  final otp = TextEditingController();
  Timer? _timer;
  int _start = 30;
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 40.h, left: 135.w, right: 135.w),
        child: SizedBox(
          height: 60.h,
          // width: 168.w,
          child: MaterialButton(
            color: otp.text.length == 4 ? k006D77 : kB5BABA,
            height: 60,
            minWidth: 168,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
              //side: const BorderSide(color: k006D77),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UAccountScreen()));
            },
            child: Text(
              'Verify',
              style: kManRope_400_16_white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 88.h),
                Text('Enter OTP', style: kManRope_700_20_001314),
                SizedBox(height: 8.h),
                Text(
                    'an OTP has been sent to ${widget.email ? 'email@gmail.com' : '0987654321'}',
                    style: kManRope_400_14_626A6A),
                SizedBox(height: 42.h),
                PinCodeTextField(
                  appContext: context,
                  controller: otp,
                  length: 4,
                  cursorColor: k006D77,
                  keyboardType: TextInputType.number,
                  textStyle: kManRope_400_20_Black,
                  onChanged: (val) {
                    setState(() {});
                  },
                  pinTheme: PinTheme(
                    inactiveColor: Colors.black,
                    fieldOuterPadding: const EdgeInsets.all(0),
                    selectedColor: k006D77,
                    borderWidth: 0,
                    fieldWidth: 55.w,
                    fieldHeight: 50.h,
                    activeColor: k006D77,
                    shape: PinCodeFieldShape.underline,
                  ),
                ),
                Center(
                  child: Text(
                    'Code should arrive in ${_start.toString()}s',
                    style: kManRope_400_14_626A6A,
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: InkWell(
                      onTap: _start == 0
                          ? () {
                              setState(() {
                                _start = 30;
                              });
                              _startTimer();
                            }
                          : () {},
                      child: Text('Resend',
                          style: _start == 0
                              ? kManRope_400_16_006D77
                              : kManRope_400_16_626A6A)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
