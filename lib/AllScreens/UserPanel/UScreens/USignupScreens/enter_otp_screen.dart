import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/USignupScreens/add_personal_details_screen.dart';
import 'package:greymatter/Apis/UserAPis/usignupapi/otpverifyapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterOTPScreen extends StatefulWidget {
  final String signUpField;
  const EnterOTPScreen({Key? key, required this.signUpField}) : super(key: key);

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  final TextEditingController otpController = TextEditingController();

  bool otpEmpty = true;

  Timer? _timer;
  int _start = 30;
  String otp = '';
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
    // final number = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 24, right: 24),
                  child: SvgPicture.asset('assets/icons/iosbackarrow.svg'),
                ),
              ),
              SizedBox(height: 40.h),
              Text('Enter OTP', style: kManRope_700_20_001314),
              SizedBox(height: 16.h),
              Text('Please enter the OTP sent to',
                  // ' \n$number',
                  style: kManRope_400_14_626A6A),
              SizedBox(height: 40.h),
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
                  //activeFillColor: kECF0F8,
                  fieldOuterPadding: const EdgeInsets.all(0),
                  //selectedFillColor: kECF0F8,
                  selectedColor: k006D77,
                  borderWidth: 0,
                  // fieldWidth: 30.w,
                  fieldHeight: 50.h,
                  //borderRadius: BorderRadius.circular(8),
                  //inactiveFillColor: kECF0F8,
                  activeColor: k006D77,
                  shape: PinCodeFieldShape.underline,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Code should arrive in ${_start.toString()}s',
                        style: kManRope_400_14_626A6A,
                      ),
                      SizedBox(height: 5.h),
                      InkWell(
                          onTap: _start == 0
                              ? () {
                                  setState(() {
                                    _start = 30;
                                  });
                                  _startTimer();
                                }
                              : () {
                                  print(otp.length);
                                },
                          child: Text('Resend',
                              style: _start == 0
                                  ? kManRope_400_16_006D77
                                  : kManRope_400_16_626A6A)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              otpEmpty
                  ? CustomDeactiveTextButton(onPressed: () {} , text: 'Continue')
                  : CustomActiveTextButton(
                  onPressed: () {
                    final resp =
                    OtpVerifyApi().get(otp: otpController.text);
                    resp.then((value) {
                      print(value);
                      if (value['status'] == true) {
                        Fluttertoast.showToast(msg: value['message']);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                AddPersonalDetailsScreen()));
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Please enter valid otp');
                      }
                    });
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => AddPersonalDetailsScreen()));
                  },
                  text: 'Continue')
            ],
          ),
        ),
      ),
    );
  }
}
