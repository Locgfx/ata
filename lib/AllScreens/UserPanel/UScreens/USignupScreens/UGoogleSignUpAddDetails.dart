import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:intl/intl.dart';

import '../../../../Apis/UserAPis/user_google_signin/user_gooogle_signin_details_api.dart';
import '../../UWidgets/DatePickerWidget.dart';
import 'UAddPersonalDetailsScreen.dart';
import 'UGoogleSingupOtpVerify.dart';

class UGoogleSignUpAddDetails extends StatefulWidget {
  UGoogleSignUpAddDetails({
    Key? key,
  }) : super(key: key);
  @override
  State<UGoogleSignUpAddDetails> createState() =>
      _UGoogleSignUpAddDetailsState();
}

class _UGoogleSignUpAddDetailsState extends State<UGoogleSignUpAddDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController dobController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final marriedController = TextEditingController();
  final occupationController = TextEditingController();
  String dateFormat = '';
  bool passwordVisible = true;
  bool passwordVisible2 = true;

  bool nameEmpty = true;
  bool dobEmpty = true;
  bool genderEmpty = true;
  bool marriedEmpty = true;
  bool occupationEmpty = true;
  bool phoneEmpty = true;

  bool hasNameFocus = false;
  bool hasDobFocus = false;
  bool hasGenderFocus = false;
  bool hasMStatusFocus = false;
  bool hasOccupationFocus = false;
  bool hasPhoneFocus = false;

  String verifyText = "Verify";

  Widget _showAlertDialog(number) {
    return Dialog(
      //height: 500,
      // padding: EdgeInsets.all(36),
      insetPadding: EdgeInsets.all(34),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter OTP",
              style: kManRope_700_20_001314,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Please enter the OPT sent to $number",
              style: kManRope_400_12_626A6A,
            ),
            SizedBox(
              height: 40,
            ),
            // PinCodeTextField(
            //   onChanged: (val) {
            //     if (val.isNotEmpty && otpController.text.length == 6) {
            //       final resp = OtpVerifyApi().get(otp: otpController.text);
            //       resp.then((value) async {
            //         print(value);
            //         if (value['status'] == true) {
            //           // var prefs = await SharedPreferences.getInstance();
            //           // prefs.setString(Keys().cookie, value['session_id']);
            //           // // log(value['session_id'].toString());
            //           // prefs.setBool(Keys().loginDone, tru
            //           Fluttertoast.showToast(msg: "number verified!");
            //           Navigator.of(context).pop();
            //           setState(() {
            //             verifyText = "Verified";
            //           });
            //         } else {
            //           Fluttertoast.showToast(msg: value['error']);
            //         }
            //       });
            //     }
            //   },
            //   validator: (val) {
            //     return null;
            //   },
            //   controller: otpController,
            //   keyboardType: TextInputType.number,
            //   appContext: context,
            //   length: 6,
            //   cursorColor: k006D77,
            //   textStyle: kManRope_400_20_Black,
            //   pinTheme: PinTheme(
            //     inactiveColor: Colors.black,
            //     //activeFillColor: kECF0F8,
            //     fieldOuterPadding: const EdgeInsets.all(0),
            //     //selectedFillColor: kECF0F8,
            //     selectedColor: k006D77,
            //     borderWidth: 0,
            //     // fieldWidth: 30.w,
            //     fieldHeight: 50.h,
            //     //borderRadius: BorderRadius.circular(8),
            //     //inactiveFillColor: kECF0F8,
            //     activeColor: k006D77,
            //     shape: PinCodeFieldShape.underline,
            //   ),
            // ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(
                  "Didn\'t received the code? ",
                  style: kManRope_400_12_626A6A,
                ),
                Text(
                  "Resend",
                  style: kManRope_400_12_006D77,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _datePickerBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => _picker());
  }

  Widget _picker() {
    return Container(
      height: 300.h,
      decoration: const BoxDecoration(
        // color: k006D77,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Pick Date',
                style: kManRope_700_20_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                // padding: EdgeInsets.all(10),
                height: 190.h,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumYear: 1950,
                    initialDateTime:
                        DateTime.now().subtract(Duration(days: 3650)),
                    maximumYear: DateTime.now().year - 10,
                    onDateTimeChanged: (val) {
                      setState(() {
                        dobController.text =
                            DateFormat("dd/MM/yyyy").format(val);
                        // updateDobController.text =
                        //     DateFormat("dd/MM/yyyy").format(val);
                        // formattedDate = DateFormat("yyyy-MM-dd").format(val);
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Text('Almost there', style: kManRope_700_20_001314),
                  SizedBox(height: 16.h),
                  Text('Please enter below details to complete your profile.',
                      style: kManRope_400_14_626A6A),
                  SizedBox(height: 50.h),
                  Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                nameEmpty = false;
                                hasNameFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                nameEmpty = true;
                                hasNameFocus = false;
                              });
                            }
                          },
                          // validator: (val) {
                          //   if (nameController.text.trim().isEmpty) {
                          //     return 'Please enter a valid email/mobile';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'name',
                            labelStyle: kManRope_400_16_626A6A,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onTap: () {
                            setState(() async {
                              DateTime? pickedDate = await showDialog(
                                context: context,
                                builder: (_) => DatePickerWidget(
                                  onPop: (date) {
                                    dobController.text =
                                        DateFormat.yMMMd().format(date);
                                    dateFormat =
                                        DateFormat('yyyy-MM-dd').format(date);
                                  },
                                  maximumDate: 2023,
                                ),
                              );
                            });
                          },
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                dobEmpty = false;
                                hasDobFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                dobEmpty = true;
                                hasDobFocus = false;
                              });
                            }
                            setState(() {
                              dobController.text = val;
                            });
                          },
                          readOnly: true,
                          controller: dobController,
                          decoration: InputDecoration(
                            labelText: 'Date of birth',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                            suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icondown.png',
                                  height: 30,
                                  width: 30,
                                )),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CheckBoxWidget(
                                    gender: genderController.text,
                                    onPop: (val) {
                                      setState(() {});
                                      setState(() {
                                        genderController.text = val;
                                      });
                                    },
                                  );
                                });
                          },
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                genderEmpty = false;
                                hasGenderFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                genderEmpty = true;
                                hasGenderFocus = false;
                              });
                            }
                            setState(() {
                              genderController.text = val;
                            });
                          },
                          readOnly: true,
                          controller: genderController,
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                            suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icondown.png',
                                  height: 30,
                                  width: 30,
                                )),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return MarriedCheckBoxWidget(
                                    married: marriedController.text,
                                    onPop: (val) {
                                      setState(() {
                                        marriedController.text = val;
                                      });
                                    },
                                  );
                                });
                          },
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                marriedEmpty = false;
                                hasMStatusFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                marriedEmpty = true;
                                hasMStatusFocus = false;
                              });
                            }
                            setState(() {
                              marriedController.text = val;
                            });
                          },
                          readOnly: true,
                          controller: marriedController,
                          decoration: InputDecoration(
                            labelText: 'Married Status',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                            suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icondown.png',
                                  height: 30,
                                  width: 30,
                                )),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                occupationEmpty = false;
                                hasOccupationFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                occupationEmpty = true;
                                hasOccupationFocus = false;
                              });
                            }
                          },
                          // validator: (val) {
                          //   if (nameController.text.trim().isEmpty) {
                          //     return 'Please enter a valid email/mobile';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          controller: occupationController,
                          decoration: InputDecoration(
                            labelText: 'Occupation',
                            labelStyle: kManRope_400_16_626A6A,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                phoneEmpty = false;
                                hasPhoneFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                phoneEmpty = true;
                                hasPhoneFocus = false;
                              });
                            }
                          },
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Phone number',
                            labelStyle: kManRope_400_16_626A6A,
                          ).copyWith(
                              // suffix: InkWell(
                              //   child: Text(
                              //     verifyText,
                              //     style: kManRope_400_14_006D77,
                              //   ),
                              //   onTap: verifyText == "verify"
                              //       ? () {
                              //           if (numberController.text.isNotEmpty) {
                              //             final resp = Generateotpapi().get(
                              //               sendTo: false,
                              //               mobileNo: numberController.text,
                              //             );
                              //             print(numberController.text);
                              //             resp.then((value) async {
                              //               print(value);
                              //               if (value['status'] == false) {
                              //                 Fluttertoast.showToast(
                              //                     msg: value['error']);
                              //               } else {
                              //                 showDialog(
                              //                     context: context,
                              //                     barrierDismissible: false,
                              //                     builder: (ctx) =>
                              //                         _showAlertDialog(
                              //                             numberController.text));
                              //                 // var prefs =
                              //                 // await SharedPreferences.getInstance();
                              //                 // prefs.setString(
                              //                 //     'cookies', value['session_id']);
                              //                 // //print(value['session_id']);
                              //                 // //print(prefs.getString(Keys().cookie));
                              //                 // Navigator.of(context).push(
                              //                 //     MaterialPageRoute(
                              //                 //         builder: (context) =>
                              //                 //             USignEnterOTPScreen(
                              //                 //               signUpField:
                              //                 //               _mobileController.text,
                              //                 //             )));
                              //                 //Fluttertoast.showToast(msg: 'Your OTP is ${value['otp']}');
                              //               }
                              //             });
                              //           } else {
                              //             Fluttertoast.showToast(
                              //                 msg: "Please enter your number");
                              //           }
                              //         }
                              //       : () {},
                              // ),
                              ),
                        ),
                        SizedBox(height: 30.h),
                        // TextFormField(
                        //   onChanged: (val) {
                        //     if (val.isNotEmpty) {
                        //       setState(() {
                        //         passwordEmpty = false;
                        //         hasPasswordFocus = true;
                        //       });
                        //     }
                        //     if (val.isEmpty) {
                        //       setState(() {
                        //         passwordEmpty = true;
                        //         hasPasswordFocus = false;
                        //       });
                        //     }
                        //   },
                        //   controller: passwordController,
                        //   obscureText: passwordVisible,
                        //   decoration: InputDecoration(
                        //     labelText: 'Password',
                        //     labelStyle: kManRope_400_16_626A6A,
                        //     suffixIconConstraints:
                        //         BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                        //     suffixIcon: GestureDetector(
                        //       onTap: () {
                        //         setState(() {
                        //           passwordVisible = !passwordVisible;
                        //         });
                        //       },
                        //       child: passwordVisible
                        //           ? SvgPicture.asset(
                        //               'assets/icons/eyeclose.svg',
                        //             )
                        //           : SvgPicture.asset(
                        //               'assets/icons/eyeopen.svg',
                        //             ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 30.h),
                        // TextFormField(
                        //   onChanged: (val) {
                        //     if (val.isNotEmpty) {
                        //       setState(() {
                        //         cPasswordEmpty = false;
                        //         hasCPasswordFocus = true;
                        //       });
                        //     }
                        //     if (val.isEmpty) {
                        //       setState(() {
                        //         cPasswordEmpty = true;
                        //         hasCPasswordFocus = false;
                        //       });
                        //     }
                        //   },
                        //   controller: confirmPasswordController,
                        //   obscureText: passwordVisible2,
                        //   decoration: InputDecoration(
                        //     labelText: 'Confirm Password',
                        //     labelStyle: kManRope_400_16_626A6A,
                        //     suffixIconConstraints:
                        //         BoxConstraints(minHeight: 20.w, minWidth: 20.h),
                        //     suffixIcon: GestureDetector(
                        //       behavior: HitTestBehavior.translucent,
                        //       onTap: () {
                        //         setState(() {
                        //           passwordVisible2 = !passwordVisible2;
                        //         });
                        //       },
                        //       child: SizedBox(
                        //         height: 48,
                        //         child: passwordVisible2
                        //             ? SvgPicture.asset(
                        //                 'assets/icons/eyeclose.svg',
                        //               )
                        //             : SvgPicture.asset(
                        //                 'assets/icons/eyeopen.svg',
                        //               ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  // nameEmpty
                  //     ? CustomDeactiveTextButton(
                  //         onPressed: () {}, text: 'Continue')
                  //     : dobEmpty
                  //         ? CustomDeactiveTextButton(
                  //             onPressed: () {}, text: 'Continue')
                  //         : genderEmpty
                  //             ? CustomDeactiveTextButton(
                  //                 onPressed: () {}, text: 'Continue')
                  //             : marriedEmpty
                  //                 ? CustomDeactiveTextButton(
                  //                     onPressed: () {}, text: 'Continue')
                  //                 : occupationEmpty
                  //                     ? CustomDeactiveTextButton(
                  //                         onPressed: () {}, text: 'Continue')
                  //                     : phoneEmpty
                  //                         ? CustomDeactiveTextButton(
                  //                             onPressed: () {},
                  //                             text: 'Continue')
                  //                         :
                  CustomActiveTextButton(
                      bColor: nameController.text.isNotEmpty &&
                              dateFormat.isNotEmpty &&
                              genderController.text.isNotEmpty &&
                              marriedController.text.isNotEmpty &&
                              occupationController.text.isNotEmpty &&
                              numberController.text.isNotEmpty
                          ? k006D77
                          : Colors.grey,
                      tColor: nameController.text.isNotEmpty &&
                              dateFormat.isNotEmpty &&
                              genderController.text.isNotEmpty &&
                              marriedController.text.isNotEmpty &&
                              occupationController.text.isNotEmpty &&
                              numberController.text.isNotEmpty
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                      onPressed: () {
                        if (nameController.text.isNotEmpty &&
                            dateFormat.isNotEmpty &&
                            genderController.text.isNotEmpty &&
                            marriedController.text.isNotEmpty &&
                            occupationController.text.isNotEmpty &&
                            numberController.text.isNotEmpty) {
                          if (_formKey.currentState!.validate()) {
                            googleSigningDetails(
                                    name: nameController.text,
                                    dob: dateFormat,
                                    gender: genderController.text == "Male"
                                        ? "M"
                                        : genderController.text == "Female"
                                            ? "F"
                                            : "O",
                                    relationStatus:
                                        marriedController.text == "Married"
                                            ? "M"
                                            : "S",
                                    occupation: occupationController.text,
                                    phone: numberController.text)
                                .then((value) {
                              if (value['status'] == true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        UGoogleSignupOTPScreen(
                                          signUpField: numberController.text,
                                        )));
                              } else {
                                Fluttertoast.showToast(msg: value['error']);
                              }
                            });
                            //         final resp = UserPersonalDetailsApi()
                            //             .get(
                            //                 name: dobController.text,
                            //                 email: numberController.text,
                            //                 password:
                            //                     passwordController.text,
                            //                 cPassword:
                            //                     confirmPasswordController
                            //                         .text);
                            //         resp.then((value) async {
                            //           print(value);
                            //           if (value['status'] == true) {
                            //             var prefs =
                            //                 await SharedPreferences
                            //                     .getInstance();
                            //             Fluttertoast.showToast(
                            //                 msg:
                            //                     'Profile Setup Successful');
                            //             prefs.setString(
                            //                 Keys().userType, "u");
                            //             Navigator.of(context).push(
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         UQuestions()));
                            //           } else {
                            //             Fluttertoast.showToast(
                            //                 msg: value['error']);
                            //             /* Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => PDashboard()),
                            // );*/
                            //           }
                            //         });
                          }
                        }
                      },
                      text: 'Continue'),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
