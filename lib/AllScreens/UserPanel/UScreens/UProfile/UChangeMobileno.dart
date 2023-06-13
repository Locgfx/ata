import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PBasicDetailsWIdget.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangeMobileEnterOtpScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_change_mobileno_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_profile_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:greymatter/widgets/shared/buttons/custom_deactive_text_button.dart';

class UChangeMobileNoScreen extends StatefulWidget {
  final UserProfileModel model;
  const UChangeMobileNoScreen({Key? key, required this.model})
      : super(key: key);

  @override
  State<UChangeMobileNoScreen> createState() => _UChangeMobileNoScreenState();
}

class _UChangeMobileNoScreenState extends State<UChangeMobileNoScreen> {
  TextEditingController mobileNOController = TextEditingController();
  TextEditingController cMobileNOController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool hasNMobileNoFocus = false;
  bool hasCMobileNOFocus = false;

  // bool nMobileNoEmpty = true;
  // bool cMobileNoEmpty = true;

  bool nMobileEmpty = true;
  bool cMobileEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kEDF6F9,
        appBar: CustomWhiteAppBar(
          hasThreeDots: false,
          appBarText: 'Change mobile number',
          imgPath: 'assets/images/iconbackappbarlarge.png',
        ),
        body: Padding(
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
                widget.model.phone.toString(),
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
              SizedBox(
                height: 48.h,
                child: TextFormField(
                  controller: mobileNOController,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        nMobileEmpty = false;
                      });
                    }
                    if (mobileNOController.text.trim().length == 10) {
                      FocusScope.of(context).unfocus();
                    }
                  },
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

              SizedBox(
                height: 48.h,
                // color: Colors.red,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cMobileNOController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        cMobileEmpty = false;
                      });
                    }
                    if (cMobileNOController.text.trim().length == 10) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                  // onChanged: (val) {
                  //   if (val.isNotEmpty) {
                  //     setState(() {
                  //       cMobileNoEmpty = false;
                  //       hasCMobileNOFocus = true;
                  //     });
                  //   }
                  //   if (val.isEmpty) {
                  //     setState(() {
                  //       cMobileNoEmpty = true;
                  //       hasCMobileNOFocus = false;
                  //     });
                  //   }
                  // },

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
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'You will receive an otp to your new number after clicking next',
                  style: kManRope_400_16_626A6A,
                ),
              ),
              SizedBox(
                height: 134.h,
              ),
              nMobileEmpty
                  ? CustomSmallDeactiveTextButton(
                      onPressed: () {}, text: 'Next')
                  : cMobileEmpty
                      ? CustomSmallDeactiveTextButton(
                          onPressed: () {}, text: 'Next')
                      : CustomSmallActiveTextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final resp = UserChangeMobileNoApi().get(
                                  mobileNo: mobileNOController.text,
                                  cMobileNo: cMobileNOController.text);
                              resp.then((value) {
                                //print(value);
                                if (value['status'] == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          UChangeMobileEnterOtpScreen(
                                            number:
                                                widget.model.phone.toString(),
                                          )));
                                  // Fluttertoast.showToast(msg: 'Your OTP is ${value['otp']}');
                                } else {
                                  Fluttertoast.showToast(msg: value['error']);
                                  /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDashboard()),
                                  );*/
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
