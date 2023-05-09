import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PLogin/PRequestSentSuccessfulScreen.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_login_apis/formapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';

class PSignupFormScreen extends StatefulWidget {
  const PSignupFormScreen({Key? key}) : super(key: key);

  @override
  State<PSignupFormScreen> createState() => _PSignupFormScreenState();
}

class _PSignupFormScreenState extends State<PSignupFormScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController alternateNoController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  // TextEditingController timingController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timingController = TextEditingController();

  @override
  void initState() {
    // timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  String time = "";
  String date = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 78.h,
              ),
              Container(
                // height: 1.h,
                width: 1.sw,
                decoration: CustomDecoration().top50containerDecoration(),
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 44.h, right: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please fill the form',
                        style: kManRope_500_24_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Hey, you have to fill this form. Once you are done, our partner will approach you at the date and time you will select below.',
                        style: kManRope_400_14_626A6A,
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      Text(
                        'Full Name',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        // height: 48.h,
                        child: TextFormField(
                          controller: nameController,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Enter your name';
                            }
                          },
                          style: kManRope_500_16_626A6A,
                          decoration:
                              TextfieldDecoration(label: 'Type name here')
                                  .textFieldEDF6F9Decoration(),
                        ),
                      ),
                      // SizedBox(height: 20),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Email',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        //  height: 48.h,
                        child: TextFormField(
                          controller: emailController,
                          validator: (val) {
                            if (emailController.text.trim().isEmpty) {
                              return 'Please enter your email';
                            } else {
                              return null;
                            }
                          },
                          style: kManRope_500_16_626A6A,
                          decoration:
                              TextfieldDecoration(label: 'Type email here')
                                  .textFieldEDF6F9Decoration(),
                        ),
                      ),

                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Phone No',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        // height: 48.h,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          controller: phoneNoController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Enter your phone no';
                            }
                          },
                          style: kManRope_500_16_626A6A,
                          decoration:
                              TextfieldDecoration(label: 'Type Phone No here')
                                  .textFieldEDF6F9Decoration(),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Alternate No',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        //  height: 48.h,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          controller: phoneNoController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Enter your alternate phone no';
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: kManRope_500_16_626A6A,
                          decoration: TextfieldDecoration(
                                  label: 'Type Alternate Phone No here')
                              .textFieldEDF6F9Decoration(),
                        ),
                      ),

                      SizedBox(
                        height: 24.h,
                      ),

                      Text(
                        'Address',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        //  height: 48.h,
                        child: TextFormField(
                          controller: adressController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter your Address';
                            }
                          },
                          style: kManRope_500_16_626A6A,
                          decoration: TextfieldDecoration(label: 'Add Address')
                              .textFieldEDF6F9Decoration(),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Timing',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                        onTap: () async {
                          var v = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (v != null) {
                            setState(() {
                              timingController.text =
                                  DateFormat.jm().format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                v.hour,
                                v.minute,
                              ));
                              time = DateFormat("HH:mm").format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                v.hour,
                                v.minute,
                              ));
                              log(time);
                            });
                          }
                        },
                        // height: 48.h,
                        child: IgnorePointer(
                          child: TextFormField(
                            //readOnly: true,
                            controller: timingController,
                            validator: (timing) {
                              if (timing == null || timing.isEmpty) {
                                return 'Enter Time';
                              }
                            },
                            style: kManRope_500_16_626A6A,
                            decoration: TextfieldDecoration(
                                    label:
                                        'Pick a time when you are available for verification')
                                .textFieldEDF6F9Decoration(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Date',
                        style: kManRope_500_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                        //  height: 48.h,
                        onTap: () async {
                          var v = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 60)));
                          if (v != null) {
                            dateController.text = DateFormat.yMMMEd().format(v);
                            date = DateFormat("yyyy-MM-dd").format(v);
                            log(date);
                          }
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            readOnly: true,
                            controller: dateController,
                            validator: (date) {
                              if (date == null || date.isEmpty) {
                                return 'Enter date';
                              }
                            },
                            style: kManRope_500_16_626A6A,
                            decoration: TextfieldDecoration(
                                    label:
                                        'Pick a date when you are available for verification')
                                .textFieldEDF6F9Decoration(),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 38.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 21.h),
                        child: SizedBox(
                          height: 56.h,
                          child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final resp = FormSignupAPi().get(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phoneNo: phoneNoController.text,
                                  alternateNo: alternateNoController.text,
                                  adress: adressController.text,
                                  timing: time,
                                  date: date,
                                );
                                resp.then((value) async {
                                  log(value.toString());
                                  if (value['status'] == false) {
                                    Fluttertoast.showToast(msg: value['error']);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Details Fill Successful');
                                    var prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString(Keys().DocSignUpEmail,
                                        emailController.text.trim());
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PRequestSentSuccessfulScreen(
                                                  name: nameController.text,
                                                )));
                                    /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDashboard()),
                                  );*/
                                  }
                                });
                              }
                            },
                            child: Center(
                              child: Text(
                                'Submit',
                                style: kManRope_500_16_white,
                              ),
                            ),
                            color: k006D77,
                            shape: CustomDecoration().buttonDecoration(),
                          ),
                        ),
                      )
                    ],
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
