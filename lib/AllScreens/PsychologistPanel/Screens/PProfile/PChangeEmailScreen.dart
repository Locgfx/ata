import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PBasicDetailsWIdget.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PChangeEmailOtpEnterScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/doctor_change_email_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';

class PChangeEmailScreen extends StatefulWidget {
  const PChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<PChangeEmailScreen> createState() => _PChangeEmailScreenState();
}

class _PChangeEmailScreenState extends State<PChangeEmailScreen> {
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();

  bool hasNEmailFocus = false;
  bool hasCEmailFocus = false;

  bool nEmailEmpty = true;
  bool cEmailEmpty = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Change email',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: Form(
        key: _formKey,
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
              SizedBox(
                // height: 48.h,
                // color: Colors.red,
                child: TextFormField(
                  controller: newEmailController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        nEmailEmpty = false;
                        hasNEmailFocus = true;
                      });
                    }
                    if (val.isEmpty) {
                      setState(() {
                        nEmailEmpty = true;
                        hasNEmailFocus = false;
                      });
                    }
                  },
                  validator: (val) {
                    if (newEmailController.text.isEmpty) {
                      return "Please enter an email";
                    }
                    if (!newEmailController.text.contains("@")) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => PsychologistChangeEmailScreen()));
                  },
                  // readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 15,
                    ),
                    //border: InputBorder.none,
                    // contentPadding: EdgeInsets.zero,
                    hintText: "",
                    hintStyle: kManRope_400_16_626A6A,
                  ),
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
              SizedBox(
                //height: 48.h,
                // color: Colors.red,
                child: TextFormField(
                  controller: confirmEmailController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        cEmailEmpty = false;
                        hasCEmailFocus = true;
                      });
                    }
                    if (val.isEmpty) {
                      setState(() {
                        cEmailEmpty = true;
                        hasCEmailFocus = false;
                      });
                    }
                  },
                  validator: (val) {
                    if (confirmEmailController.text.isEmpty) {
                      return "Please enter an email";
                    }
                    if (!confirmEmailController.text.contains("@")) {
                      return "Please enter a valid email";
                    }
                    if (confirmEmailController.text !=
                        newEmailController.text) {
                      return "Email did not match!";
                    }
                    return null;
                  },
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => PsychologistChangeEmailScreen()));
                  },
                  // readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 15,
                    ),
                    //border: InputBorder.none,
                    // contentPadding: EdgeInsets.zero,
                    hintText: "",
                    hintStyle: kManRope_400_16_626A6A,
                  ),
                ),
              ),
              BlackUnderline(),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "You will receive an otp to your new email after clicking next",
                  style: kManRope_400_16_626A6A,
                ),
              ),
              Spacer(),
              nEmailEmpty
                  ? CustomDeactiveTextButton(onPressed: () {}, text: 'Next')
                  : cEmailEmpty
                      ? CustomDeactiveTextButton(onPressed: () {}, text: 'Next')
                      : CustomActiveTextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final resp = DoctorChangeEmailApi().get(
                                  newEmail: newEmailController.text,
                                  confirmEmail: confirmEmailController.text);
                              resp.then((value) async {
                                print(resp);
                                // var prefs = await SharedPreferences.getInstance();
                                // print(prefs.getString(Keys().cookie));
                                if (value['status'] == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PEmailEnterOtpScreen()));
                                  // Fluttertoast.showToast(msg: 'Your OTP is ${value['otp']}');
                                } else {
                                  print(value.toString());
                                  Fluttertoast.showToast(msg: value['error']);
                                }
                              });
                            }
                          },
                          text: 'Next',
                        ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
