import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UprofileScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UBottomsheet.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_profile_api.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_profile_update_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_profile_model.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

class UserPersonalInfoScreen extends StatefulWidget {
  const UserPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserPersonalInfoScreen> createState() => _UserPersonalInfoScreenState();
}

class _UserPersonalInfoScreenState extends State<UserPersonalInfoScreen> {
  void _selectGenderBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const SelectGenderBottomSheet());
  }

  void _relationStatusBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => RelationStatusBottomSheet());
  }

  void _occupationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => OccupationBottomSheet());
  }

  void _datePickerBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => DatePickerBottomSheet());
  }
  bool isreadable = true;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  UserProfileModel model = UserProfileModel();
  bool _isLoading = false;
  _getData() {

    _isLoading = true;
    final resp = UserProfileApi().get();
    print(resp);
    resp.then((value) {
      print(value);
      setState(() {
        try {
          model = UserProfileModel.fromJson(value);
          print(model);
          _isLoading = false;
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

//---------------------------------------------
//   Update Api
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateDobController = TextEditingController();
  TextEditingController updateGenderController = TextEditingController();
  TextEditingController relationshipStatusController = TextEditingController();
  TextEditingController updateOccupationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Scaffold(
        backgroundColor: kEDF6F9,
        appBar: CuswhiteAppBar(
            hasThreeDots: false,
            appBarText: "Account",
            imgPath: "assets/images/iconbackappbar2.png"),
        body: Form(key:_formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: isreadable
                  ? Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 43),
                      Center(
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          color: k006D77,
                          strokeWidth: 0.5,
                          dashPattern: [
                            2,
                            2,
                          ],
                          child: Container(
                            height: 102.h,
                            width: 102.w,
                            decoration: const BoxDecoration(
                                color: Color(0xFF006D77), shape: BoxShape.circle),
                            child: Image.network(
                              model.photo.toString(),
                              errorBuilder: (q, w, e) => Container(
                                height: 102.h,
                                width: 102.w,
                                decoration:  BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/person-pngrepo-com.png"),
                                        fit: BoxFit.cover),
                                    color: kEDF6F9, shape: BoxShape.circle),
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Name',
                            style: kManRope_400_16_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.name.toString(),
                                style: kManRope_400_16_001314,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            "Date of birth",
                            style: kManRope_400_16_001314,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                          // groupName == null ? '' : groupName

                                model.dob.toString() ,
                                style: kManRope_400_16_001314,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Gender',
                            style: kManRope_400_16_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.gender.toString(),
                                style: kManRope_400_16_001314,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Relationship status',
                            style: kManRope_400_16_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.relationshipStatus.toString(),
                                style: kManRope_400_16_001314,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Occuption',
                            style: kManRope_400_16_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.occupation.toString(),
                                style: kManRope_400_16_001314,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 104.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: Center(
                              child: MainButton(
                                  onPressed: () {
                                    setState(() {
                                      isreadable = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.h,
                                        bottom: 15.h,
                                        left: 50.w,
                                        right: 50.w),
                                    child: isreadable
                                        ? Text(
                                      "Edit",
                                      style: kManRope_500_18_FFFFF,
                                    )
                                        : Text(
                                      "Save",
                                      style: kManRope_500_18_FFFFF,
                                    ),
                                  ),
                                  color: k006D77,
                                  shape:
                                  CustomDecoration().smallButtonDecoration()),
                            ),
                          )
                          // Center(1
                          //   child: MainButton(
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 15),
                          //       child: Text(
                          //         "Done",
                          //         style: kManRope_500_18_FFFFF,
                          //       ),
                          //     ),
                          //     color: k006D77,
                          //     shape: CustomDecoration().smallButtonDecoration(),
                          //     onPressed: () {},
                          //   ),
                          // ),
                          // Center(
                          //   child: SizedBox(
                          //     height: 56.h,
                          //     width: 168.w,
                          //     child: MaterialButton(
                          //       color: k006D77,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(48), // <-- Radius
                          //       ),
                          //       onPressed: () {
                          //         Navigator.of(context).push(MaterialPageRoute(
                          //             builder: (context) => PsychologistEditPersonalInfo()));
                          //       },
                          //       child: Text(
                          //         'Edit',
                          //         style: kManRope_400_16_white,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 43.h,
                  ),
                  Column(
                    children: [
                      Center(
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          color: k006D77,
                          strokeWidth: 0.5,
                          dashPattern: [
                            2,
                            2,
                          ],
                          child: Container(
                            height: 102.h,
                            width: 102.w,
                            decoration: const BoxDecoration(
                                color: Color(0xFF006D77),
                                shape: BoxShape.circle),
                            child: Image.asset('assets/images/userP.png'),
                            clipBehavior: Clip.hardEdge,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Change Photo",
                        style: kManRope_500_16_404040,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name', style: kManRope_400_16_626A6A),
                              SizedBox(height: 8.h),
                              SizedBox(
                                // color: Colors.red,
                                width: 335.w,
                                child: TextFormField(
                                  controller: updateNameController ,
                                    style: kManRope_400_16_001314,
                                    // readOnly: true,
                                    onTap: () {},
                                    decoration: TextfieldDecoration(
                                        label: 'Priya singh')
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                          // Image.asset(
                          //   "assets/images/iconedit.png",
                          //   height: 20,
                          //   width: 20,
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date of birth',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextField(
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      _datePickerBottomSheet();
                                    },
                                    decoration: TextfieldDecoration(
                                        label: '25/02/1993')
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              _datePickerBottomSheet();
                            },
                            child: Container(
                                height: 48,
                                width: 48,
                                // color: Colors.red,
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Gender', style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextField(
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      _selectGenderBottomSheet();
                                    },
                                    decoration:
                                    TextfieldDecoration(label: 'Female')
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectGenderBottomSheet();
                            },
                            child: Container(
                              // color: Colors.red,
                                height: 48,
                                width: 48,
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Relationship status',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextField(
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      _relationStatusBottomSheet();
                                    },
                                    decoration:
                                    TextfieldDecoration(label: 'SIngle')
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              _relationStatusBottomSheet();
                            },
                            child: Container(
                                height: 48,
                                width: 48,
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Occuption',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextField(
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      _occupationBottomSheet();
                                    },
                                    decoration:
                                    TextfieldDecoration(label: 'Student')
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              _occupationBottomSheet();
                            },
                            child: Container(
                                height: 48,
                                width: 48,
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Center(
                      child: MainButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final resp = UserProfileUpdateApi().get(
                                  name: '',
                                  dob: '',
                                  gender: '',
                                  relationshipStatus: '',
                                  occupation: ''

                              );
                              resp.then((value) {
                                print(value);
                                if (value['status'] == true) {
                                  Fluttertoast.showToast(
                                      msg: 'Profile Setup Successful');
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UProfileScreen()));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: value['error']);

                                }
                              });
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UProfileScreen()));

                            setState(() {
                              // isreadable = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.h,
                                bottom: 15.h,
                                left: 50.w,
                                right: 50.w),
                            child: Text(
                              "Save",
                              style: kManRope_500_18_FFFFF,
                            ),
                          ),
                          color: k006D77,
                          shape: CustomDecoration().smallButtonDecoration()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
        if (_isLoading) LoadingWidget(),
      ],
    );
  }
}