import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UOnboardingquestions/UQuestionScreen.dart';
import 'package:greymatter/Apis/UserAPis/usignupapi/upersonaldetailsapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';
import '../../../../widgets/shared/buttons/custom_deactive_text_button.dart';
import '../../UWidgets/DatePickerWidget.dart';

class UAddPersonalDetailsScreen extends StatefulWidget {
  UAddPersonalDetailsScreen({Key? key}) : super(key: key);
  @override
  State<UAddPersonalDetailsScreen> createState() =>
      _UAddPersonalDetailsScreenState();
}

class _UAddPersonalDetailsScreenState extends State<UAddPersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final genderController = TextEditingController();
  final marriedController = TextEditingController();
  final occupationController = TextEditingController();

  bool passwordVisible = true;
  bool passwordVisible2 = true;

  bool nameEmpty = true;
  bool emailEmpty = true;
  bool passwordEmpty = true;
  bool cPasswordEmpty = true;

  bool hasNameFocus = false;
  bool hasEmailFocus = false;
  bool hasPasswordFocus = false;
  bool hasCPasswordFocus = false;

  final dateController = TextEditingController();
  String dateFormat = '';

  @override
  void initState() {
    // marriedController.text = marriedController.toString().toUpperCase() == "M"
    //     ? "Male"
    //     : marriedController.toString().toUpperCase() == "F"
    //         ? "Female"
    //         : "Other";
    super.initState();
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
                  Text('Please enter below detailes to complete your profile.',
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
                            labelText: 'Full name',
                            labelStyle: kManRope_400_16_626A6A,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                emailEmpty = false;
                                hasEmailFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                emailEmpty = true;
                                hasEmailFocus = false;
                              });
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: kManRope_400_16_626A6A,
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
                        SizedBox(
                          height: 30.h,
                        ),
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
                        SizedBox(height: 30),
                        TextFormField(
                          onTap: () {
                            setState(() async {
                              DateTime? pickedDate = await showDialog(
                                context: context,
                                builder: (_) => DatePickerWidget(
                                  onPop: (date) {
                                    dateController.text =
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
                            setState(() {
                              marriedController.text = val;
                            });
                          },
                          readOnly: true,
                          controller: dateController,
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
                        SizedBox(
                          height: 30,
                        ),
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
                          controller: occupationController,
                          decoration: InputDecoration(
                            labelText: 'Occupation',
                            labelStyle: kManRope_400_16_626A6A,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                passwordEmpty = false;
                                hasPasswordFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                passwordEmpty = true;
                                hasPasswordFocus = false;
                              });
                            }
                          },
                          controller: passwordController,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 24.w, minWidth: 24.h),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: passwordVisible
                                  ? SvgPicture.asset(
                                      'assets/icons/eyeclose.svg',
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/eyeopen.svg',
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                cPasswordEmpty = false;
                                hasCPasswordFocus = true;
                              });
                            }
                            if (val.isEmpty) {
                              setState(() {
                                cPasswordEmpty = true;
                                hasCPasswordFocus = false;
                              });
                            }
                          },
                          controller: confirmPasswordController,
                          obscureText: passwordVisible2,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: kManRope_400_16_626A6A,
                            suffixIconConstraints:
                                BoxConstraints(minHeight: 20.w, minWidth: 20.h),
                            suffixIcon: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  passwordVisible2 = !passwordVisible2;
                                });
                              },
                              child: SizedBox(
                                height: 48,
                                child: passwordVisible2
                                    ? SvgPicture.asset(
                                        'assets/icons/eyeclose.svg',
                                      )
                                    : SvgPicture.asset(
                                        'assets/icons/eyeopen.svg',
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  nameEmpty
                      ? CustomDeactiveTextButton(
                          onPressed: () {}, text: 'SIGNUP')
                      : emailEmpty
                          ? CustomDeactiveTextButton(
                              onPressed: () {}, text: 'SIGNUP')
                          : passwordEmpty
                              ? CustomDeactiveTextButton(
                                  onPressed: () {}, text: 'SIGNUP')
                              : cPasswordEmpty
                                  ? CustomDeactiveTextButton(
                                      onPressed: () {}, text: 'SIGNUP')
                                  : CustomActiveTextButton(
                                      onPressed: () {
                                        print(genderController);
                                        print(dateFormat);
                                        print(marriedController.text);
                                        if (_formKey.currentState!.validate()) {
                                          final resp = UserPersonalDetailsApi()
                                              .get(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  cPassword:
                                                      confirmPasswordController
                                                          .text,
                                                  dob: dateFormat,
                                                  gender: genderController
                                                              .text ==
                                                          "Male"
                                                      ? "M"
                                                      : genderController.text ==
                                                              "Female"
                                                          ? "F"
                                                          : "O",
                                                  relationStatus:
                                                      marriedController.text ==
                                                              "Married"
                                                          ? "M"
                                                          : "S",
                                                  occupation:
                                                      occupationController
                                                          .text);
                                          resp.then((value) async {
                                            print(value);
                                            if (value['status'] == true) {
                                              var prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString(Keys().userName,
                                                  nameController.text);
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Profile Setup Successful');
                                              prefs.setString(
                                                  Keys().userType, "u");
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UQuestions()));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: value['error']);
                                              /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                   k                     builder: (context) => PDashboard()),
                                  );*/
                                            }
                                          });
                                        }
                                      },
                                      text: 'SIGNUP')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final String gender;
  final Function(String) onPop;
  const CheckBoxWidget({Key? key, required this.gender, required this.onPop})
      : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        content: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          width: 1.sw,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Gender',
                  // style: AppTextStyle()
                  //     .textColor29292914w500,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
                      widget.onPop("Male");
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'male',
                        // style: AppTextStyle()
                        //     .textColor29292914w500
                      ),
                      Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _gIndex = 0;
                            Navigator.of(context).pop();
                            widget.onPop("Male");
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  _gIndex == 0 ? k006D77 : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _gIndex = 1;
                      Navigator.of(context).pop();
                      widget.onPop("Female");
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'female',
                        // style: AppTextStyle()
                        //     .textColor29292914w500
                      ),
                      Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _gIndex = 1;
                            Navigator.of(context).pop();
                            widget.onPop("Female");
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  _gIndex == 1 ? k006D77 : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _gIndex = 2;
                      Navigator.of(context).pop();
                      widget.onPop("Other");
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'other',
                        // style:AppTextStyle()
                        //     .textColor29292914w500
                      ),
                      Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _gIndex = 2;
                            Navigator.of(context).pop();
                            widget.onPop("Other");
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  _gIndex == 2 ? k006D77 : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    if (widget.gender == "Male") {
      _gIndex = 0;
    } else if (widget.gender == "Female") {
      _gIndex = 1;
    } else {
      _gIndex = 2;
    }
    super.initState();
  }
}

class MarriedCheckBoxWidget extends StatefulWidget {
  final String married;
  final Function(String) onPop;
  const MarriedCheckBoxWidget(
      {Key? key, required this.married, required this.onPop})
      : super(key: key);

  @override
  State<MarriedCheckBoxWidget> createState() => _MarriedCheckBoxWidgetState();
}

class _MarriedCheckBoxWidgetState extends State<MarriedCheckBoxWidget> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        content: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          width: 1.sw,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Married Status',
                  // style: AppTextStyle()
                  //     .textColor29292914w500,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
                      widget.onPop("Married");
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Married',
                        // style: AppTextStyle()
                        //     .textColor29292914w500
                      ),
                      Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _gIndex = 0;
                            Navigator.of(context).pop();
                            widget.onPop("Married");
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  _gIndex == 0 ? k006D77 : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _gIndex = 1;
                      Navigator.of(context).pop();
                      widget.onPop("Single");
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Single',
                        // style: AppTextStyle()
                        //     .textColor29292914w500
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _gIndex = 1;
                            Navigator.of(context).pop();
                            widget.onPop("Single");
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  _gIndex == 1 ? k006D77 : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    if (widget.married == "Married") {
      _gIndex = 0;
    } else {
      _gIndex = 1;
    }
    super.initState();
  }
}
