import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PBasicDetailsWIdget.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/counselor_profile_model/counselor_profile_model.dart';
import 'package:greymatter/widgets/BottomSheets/LanguageBottomSheet.dart';
import 'package:greymatter/widgets/BottomSheets/SpecializationBottomSheet.dart';
import 'package:greymatter/widgets/buttons.dart';

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
        builder: (context) => const SpecializationBottomSheet());
  }

  void _LanguageBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => LanguageBottomSheet());
  }

  bool isreadable = true;
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
                    widget.model.specialities.toString(),
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
                    "English",
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
                          Text('About', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                              width: 335.w,
                              child: TextField(
                                  // readOnly: true,
                                  onTap: () {},
                                  decoration:
                                      TextfieldDecoration(label: 'Type About')
                                          .textfieldProfileDecoration())),
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
                          Text('Total experience',
                              style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 335.w,
                            child: TextField(
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
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Specialization', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 320.w,
                            child: TextField(
                                style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _SpecializationBottomSheet();
                                },
                                decoration:
                                    TextfieldDecoration(label: 'Specialization')
                                        .textfieldProfileDecoration()),
                          )
                        ],
                      ),
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
                          Text('Language', style: kManRope_400_16_626A6A),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 320.w,
                            child: TextField(
                                style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _LanguageBottomSheet();
                                },
                                decoration:
                                    TextfieldDecoration(label: 'English')
                                        .textfieldProfileDecoration()),
                          )
                        ],
                      ),
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
          );
  }
}
