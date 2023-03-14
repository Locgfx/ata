import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PBasicDetailsWIdget.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/doctor_profile_apis/edit_counselor_info.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/doctor_profile_apis/languages.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/counselor_profile_model/counselor_profile_model.dart';
import 'package:greymatter/widgets/BottomSheets/LanguageBottomSheet.dart';
import 'package:greymatter/widgets/BottomSheets/SpecializationBottomSheet.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import '../../../../Apis/UserAPis/user_home_apis/userspecialistapi.dart';

class PEditDoctorProfileScreen extends StatefulWidget {
  final CounselorProfileModel model;
  const PEditDoctorProfileScreen({Key? key, required this.model})
      : super(key: key);

  @override
  State<PEditDoctorProfileScreen> createState() =>
      _PEditDoctorProfileScreenState();
}

class _PEditDoctorProfileScreenState extends State<PEditDoctorProfileScreen> {
  void _SpecializationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => SpecializationBottomSheet(
              specialistModel: specialistModel,
              selectedSpecialistModel: selectedSpecialistModel,
              onPop: (selected) {
                setState(() {
                  selectedSpecialistModel = selected;
                });
              },
            ));
  }

  void _LanguageBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => LanguageBottomSheet(
              languageList: languageList,
              selectedLanguageList: selectedLanguageList,
              onPop: (val) {
                setState(() {
                  selectedLanguageList = val;
                });
              },
            ));
  }

  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  List<UserSpecialistModel> specialistModel = [];
  List<UserSpecialistModel> selectedSpecialistModel = [];
  bool isreadable = true;
  @override
  void initState() {
    _aboutController.text = widget.model.about.toString();
    _experienceController.text = widget.model.totalExprience.toString();
    _priceController.text = widget.model.pricing.toString();
    selectedSpecialistModel = widget.model.specialities!;
    selectedLanguageList = widget.model.language!;
    speciality =
        widget.model.specialities!.map((c) => c.name).toList().join(',');
    lang = widget.model.language!.map((c) => c.name).toList().join(',');
    getTopSpecialistData();
    _getLanguages();
    super.initState();
  }

  List<LanguageModel> languageList = [];
  List<LanguageModel> selectedLanguageList = [];
  bool languageLoading = false;
  _getLanguages() {
    languageLoading = true;
    final resp = Languages().get();
    resp.then((value) {
      setState(() {
        for (var v in value) {
          languageList.add(LanguageModel.fromJson(v));
        }
        languageLoading = false;
      });
    });
  }

  var speciality = '';
  var lang = '';
  bool specialitiesLoading = false;
  getTopSpecialistData() {
    specialitiesLoading = true;
    final resp = UserSpecialistApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          specialistModel.add(UserSpecialistModel.fromJson(v));
        }
        specialitiesLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isreadable
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36.h,
              ),
              Text(
                'About',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.about.toString(),
                    style: kManRope_400_16_001314,
                  ),
                  SizedBox(height: 20),
                  BlackUnderline(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Total experience',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.model.totalExprience.toString()} yrs",
                    style: kManRope_400_16_001314,
                  ),
                  SizedBox(height: 20),
                  BlackUnderline(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Specialization',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    speciality,
                    style: kManRope_400_16_001314,
                  ),
                  SizedBox(height: 20),
                  BlackUnderline(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Language',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang,
                    style: kManRope_400_16_001314,
                  ),
                  SizedBox(height: 20),
                  BlackUnderline(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Pricing',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 39.h,
                decoration: BoxDecoration(
                  color: kE2F2F4,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: TextField(
                    readOnly: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          left: 10,
                        ),
                        border: InputBorder.none,
                        hintStyle: kManRope_400_16_001314,
                        hintText: 'Rs ${widget.model.pricing.toString()}'),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Center(
                  child: SizedBox(
                    height: 56.h,
                    child: MainButton(
                        onPressed: () {
                          setState(() {
                            isreadable = false;
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 63.w, right: 63.w),
                            child: Text(
                              "Edit",
                              style: kManRope_500_18_FFFFF,
                            )),
                        color: k006D77,
                        shape: CustomDecoration().smallButtonDecoration()),
                  ),
                ),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('About', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 1.sw - 50.w,
                            child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: _aboutController,
                                // readOnly: true,
                                onTap: () {},
                                decoration:
                                    TextfieldDecoration(label: 'Type About')
                                        .textfieldProfileDecoration()),
                          ),
                        ],
                      ),
                      /* Image.asset(
                        "assets/images/iconedit.png",
                        height: 20,
                        width: 20,
                      )*/
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
                          Text('Total experience',
                              style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 335.w,
                            child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _experienceController,
                                style: kManRope_400_16_001314,
                                // readOnly: true,
                                onTap: () {
                                  // _SpecializationBottomSheet();
                                },
                                decoration:
                                    TextfieldDecoration(label: 'Type here yrs')
                                        .textfieldProfileDecoration()),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/iconedit.png",
                        height: 20,
                        width: 20,
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
              specialitiesLoading
                  ? SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Specialization',
                                style: kManRope_400_16_626A6A),
                            GestureDetector(
                              onTap: () {
                                _SpecializationBottomSheet();
                              },
                              child: SizedBox(
                                  height: 48,
                                  width: 48,
                                  child: Image.asset(
                                    "assets/images/icondropdownlargee.png",
                                    height: 20,
                                    width: 20,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        selectedSpecialistModel.isEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 320.w,
                                    child: TextField(
                                        style: kManRope_400_16_001314,
                                        readOnly: true,
                                        onTap: () {
                                          _SpecializationBottomSheet();
                                        },
                                        decoration: TextfieldDecoration(
                                                label: 'Add Specializations')
                                            .textfieldProfileDecoration()),
                                  ),
                                ],
                              )
                            : Wrap(
                                children: [
                                  for (int i = 0;
                                      i < selectedSpecialistModel.length;
                                      i++)
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Chip(
                                        label: Text(
                                          selectedSpecialistModel[i]
                                              .name
                                              .toString(),
                                          style: kManRope_400_16_1314,
                                        ),
                                        deleteIcon: Icon(
                                          Icons.clear,
                                          size: 18,
                                        ),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        deleteIconColor: Color(0xFF7D7878),
                                        onDeleted: () {
                                          setState(() {
                                            selectedSpecialistModel.removeAt(i);
                                          });
                                        },
                                      ),
                                    ),
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
              languageLoading
                  ? SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Language', style: kManRope_400_16_626A6A),
                            GestureDetector(
                              onTap: () {
                                _LanguageBottomSheet();
                              },
                              child: SizedBox(
                                  height: 48,
                                  width: 48,
                                  child: Image.asset(
                                      "assets/images/icondropdownlargee.png")),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        selectedLanguageList.isEmpty
                            ? SizedBox(
                                width: 320.w,
                                child: TextField(
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      _LanguageBottomSheet();
                                    },
                                    decoration: TextfieldDecoration(
                                            label: 'Add Languages')
                                        .textfieldProfileDecoration()),
                              )
                            : Wrap(
                                children: [
                                  for (int i = 0;
                                      i < selectedLanguageList.length;
                                      i++)
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Chip(
                                        label: Text(
                                          selectedLanguageList[i]
                                              .name
                                              .toString(),
                                          style: kManRope_400_16_1314,
                                        ),
                                        deleteIcon: Icon(
                                          Icons.clear,
                                          size: 18,
                                        ),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        deleteIconColor: Color(0xFF7D7878),
                                        onDeleted: () {
                                          setState(() {
                                            selectedLanguageList.removeAt(i);
                                          });
                                        },
                                      ),
                                    ),
                                ],
                              )
                      ],
                    ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pricing',
                    style: kManRope_400_16_626A6A,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 39.h,
                    decoration: BoxDecoration(
                      color: kE2F2F4,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: TextField(
                        style: kManRope_400_14_001314,
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        // cursorColor: Colors.white,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                            border: InputBorder.none,
                            hintStyle: kManRope_400_16_001314,
                            hintText: 'Enter Amount'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Center(
                  child: SizedBox(
                    height: 56.h,
                    child: _btnLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : MainButton(
                            onPressed: () {
                              setState(() {
                                _btnLoading = true;
                              });
                              final resp = EditCounselorInfo().get(
                                  about: _aboutController.text,
                                  exp: _experienceController.text,
                                  langList: selectedLanguageList,
                                  pricing: _priceController.text,
                                  specialityList: selectedSpecialistModel);
                              resp.then((value) {
                                if (value['status'] == true) {
                                  setState(() {
                                    _btnLoading = false;
                                  });
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(
                                      msg: "Profile updated.");
                                } else {
                                  setState(() {
                                    _btnLoading = false;
                                  });
                                  Fluttertoast.showToast(msg: value['msg']);
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 63.w, right: 63.w),
                              child: Text(
                                "Save",
                                style: kManRope_500_18_FFFFF,
                              ),
                            ),
                            color: k006D77,
                            shape: CustomDecoration().smallButtonDecoration()),
                  ),
                ),
              )
            ],
          );
  }

  bool _btnLoading = false;
}
