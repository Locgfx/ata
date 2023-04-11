import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/DoctorApis/doctor_profile_apis/doctor_profile_apis/edit_basic_info_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/counselor_profile_model/counselor_profile_model.dart';
import 'package:greymatter/widgets/BottomSheets/DatePickerBottomSheet.dart';
import 'package:greymatter/widgets/BottomSheets/GenderBottomSheet.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/BottomSheets/DesignationBottomSheet.dart';

class PEditBasicDetailsScreen extends StatefulWidget {
  final CounselorProfileModel model;
  const PEditBasicDetailsScreen({Key? key, required this.model})
      : super(key: key);

  @override
  State<PEditBasicDetailsScreen> createState() =>
      _PEditBasicDetailsScreenState();
}

class _PEditBasicDetailsScreenState extends State<PEditBasicDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.model.name.toString();
    _dobController.text =
        "${widget.model.dob.toString().split("-").last}/${widget.model.dob.toString().split("-")[1]}/${widget.model.dob.toString().split("-").first}";
    _genderController.text = widget.model.gender.toString().toUpperCase() == "M"
        ? "Male"
        : widget.model.gender.toString().toUpperCase() == "F"
            ? "Female"
            : "Other";
    _designationController.text =
        widget.model.designation.toString().toUpperCase() == "C"
            ? "Counsellors"
            : "Psychologist";
    super.initState();
  }

  void _selectGenderBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => SelectGenderBottomSheet(
              gender: _genderController.text,
              onPop: (val) {
                setState(() {
                  _genderController.text = val;
                });
              },
            ));
  }

  void _selectDesignationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => SelectDesignationBottomSheet(
              designation: _designationController.text,
              onPop: (val) {
                setState(() {
                  _designationController.text = val;
                });
              },
            ));
  }

  void _datePickerBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => DatePickerBottomSheet(onPop: (date) {
              WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                    _dobController.text =
                        DateFormat("dd/MM/yyyy").format(DateTime.parse(date));
                  }));
            }));
  }

  bool isreadable = true;
  final ImagePicker _imgPicker = ImagePicker();
  File _pickedImage = File("");

  bool _btnLoading = false;
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
                    widget.model.name.toString(),
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
                'Date of birth',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.model.dob.toString().split("-").last}/${widget.model.dob.toString().split("-")[1]}/${widget.model.dob.toString().split("-").first}",
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
                    widget.model.gender.toString().toUpperCase() == "M"
                        ? "Male"
                        : widget.model.gender.toString().toUpperCase() == "F"
                            ? "Female"
                            : "Other",
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
                'Designation',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.designation.toString().toUpperCase() == "C"
                        ? "Counsellors"
                        : "Psychologist",
                    style: kManRope_400_16_001314,
                  ),
                  SizedBox(height: 20),
                  BlackUnderline(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'signature',
                    style: kManRope_400_16_626A6A,
                  ),
                  Image.network(widget.model.signature.toString(),
                      fit: BoxFit.cover,
                      height: 48.h,
                      width: 64.w,
                      errorBuilder: (q, w, e) => Image.asset(
                            "assets/images/iconplussmall.png",
                            height: 20,
                            width: 20,
                          )),
                ],
              ),
              // SizedBox(
              //   height: 34.h,
              // ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
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
                          Text('Name', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            // color: Colors.red,
                            width: 335.w,
                            child: TextField(
                                controller: _nameController,
                                style: kManRope_400_16_001314,
                                // readOnly: true,
                                onTap: () {},
                                decoration:
                                    TextfieldDecoration(label: 'Add name')
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
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date of birth', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            // color: Colors.red,
                            width: 320.w,
                            child: TextField(
                                controller: _dobController,
                                style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _datePickerBottomSheet();
                                },
                                decoration:
                                    TextfieldDecoration(label: 'Select date')
                                        .textfieldProfileDecoration()),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _datePickerBottomSheet();
                        },
                        child: SizedBox(
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
                          Text('Gender', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 320.w,
                            child: TextField(
                                controller: _genderController,
                                style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _selectGenderBottomSheet();
                                },
                                decoration:
                                    TextfieldDecoration(label: 'Select gender')
                                        .textfieldProfileDecoration()),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectGenderBottomSheet();
                        },
                        child: SizedBox(
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
                          Text('Designation', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 320.w,
                            child: TextField(
                                controller: _designationController,
                                style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _selectDesignationBottomSheet();
                                },
                                decoration: TextfieldDecoration(
                                        label: 'Select Designation')
                                    .textfieldProfileDecoration()),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDesignationBottomSheet();
                        },
                        child: SizedBox(
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
                      Expanded(
                        child: SizedBox(
                          // width: 335.w,
                          child: TextField(
                              readOnly: true,
                              style: kManRope_400_16_001314,
                              decoration:
                                  TextfieldDecoration(label: 'Add Signature')
                                      .textfieldProfileDecoration()),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          XFile? v = await _imgPicker.pickImage(
                              source: ImageSource.gallery);
                          if (v != null) {
                            setState(() {
                              _pickedImage = File(v.path);
                            });
                            /*final resp = UserUpdateProfilePic()
                                .get(pickedImg: _pickedImage);
                            resp.then((value) {
                              if (value['status'] == true) {
                                setState(() {
                                  profilePic = value['url'];
                                  Fluttertoast.showToast(
                                      msg: "Profile picture updated");
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Update failed. Please try again.");
                              }
                            });*/
                          }
                        },
                        child: _pickedImage.path.isEmpty
                            ? Image.asset(
                                "assets/images/iconplussmall.png",
                                height: 20,
                                width: 20,
                              )
                            : Image.file(
                                _pickedImage,
                                width: 64.w,
                                height: 48.h,
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Center(
                  child: SizedBox(
                    height: 56.h,
                    child: isreadable
                        ? MainButton(
                            onPressed: () {
                              setState(() {
                                isreadable = false;
                              });
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 63.w, right: 63.w),
                                child: Text(
                                  "Edit",
                                  style: kManRope_500_18_FFFFF,
                                )),
                            color: k006D77,
                            shape: CustomDecoration().smallButtonDecoration())
                        : _btnLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : MainButton(
                                onPressed: () {
                                  setState(() {
                                    _btnLoading = true;
                                  });
                                  final resp = EditBasicInfoApi().get(
                                      name: _nameController.text,
                                      dob:
                                          "${_dobController.text.split("/").last}-${_dobController.text.split("/")[1]}-${_dobController.text.split("/").first}",
                                      gender: _genderController.text[0],
                                      designation:
                                          _designationController.text[0],
                                      signature: _pickedImage);
                                  resp.then((value) {
                                    if (value['status'] == true) {
                                      setState(() {
                                        _btnLoading = false;
                                      });
                                      Navigator.of(context).pop();
                                      Fluttertoast.showToast(
                                          msg: "Updated successfully.");
                                    } else {
                                      setState(() {
                                        _btnLoading = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg:
                                              "Profile not updated. Please try again.");
                                    }
                                  });
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 63.w, right: 63.w),
                                  child: Text(
                                    "Save",
                                    style: kManRope_500_18_FFFFF,
                                  ),
                                ),
                                color: k006D77,
                                shape:
                                    CustomDecoration().smallButtonDecoration()),
                  ),
                ),
              )
            ],
          );
  }
}

class BlackUnderline extends StatelessWidget {
  const BlackUnderline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.4,
      width: 1.sw,
      color: kB5BABA,
    );
  }
}
