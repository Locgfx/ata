import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/Apis/DoctorApis/all_prescription_apis/edit_perscription_api.dart';
import 'package:greymatter/Apis/DoctorApis/all_prescription_apis/get_prescription_details.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

import '../../../../model/PModels/all_prescription_models/prescription_model.dart';

class PEditPrescriptionViewScreen extends StatefulWidget {
  final String prescriptionId;
  const PEditPrescriptionViewScreen({Key? key, required this.prescriptionId})
      : super(key: key);

  @override
  State<PEditPrescriptionViewScreen> createState() =>
      _PEditPrescriptionViewScreenState();
}

class _PEditPrescriptionViewScreenState
    extends State<PEditPrescriptionViewScreen> {
  PrescriptionDetailsModel model = PrescriptionDetailsModel();
  bool _isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _rpController = TextEditingController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    _isLoading = true;
    final resp =
        GetPrescriptionDetails().get(prescriptionId: widget.prescriptionId);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        setState(() {
          model = PrescriptionDetailsModel.fromJson(value);
          _nameController.text = model.pName.toString();
          _weightController.text = model.weight.toString();
          _ageController.text = model.age.toString();
          _rpController.text = model.rp.toString();
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  bool isreadable = true;
  bool _editLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: "Prescription View",
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: isreadable
          ? _isLoading
              ? Center(
                  child: LoadingWidget(),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 27.h,
                        ),
                        /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: kManRope_500_16_001314,
                        ),
                        Container(
                          height: 45.h,
                          width: 281.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: kE2F2F4,
                          ),
                          child: TextField(
                            readOnly: true,
                            decoration:
                                TextfieldDecoration(label: '12,Mon,2022')
                                    .textfielde2f2f4Decoration(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: Container(
                                height: 45.h,
                                width: 281.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: kE2F2F4,
                                ),
                                child: TextField(
                                  readOnly: true,
                                  decoration: TextfieldDecoration(
                                          label: model.pName.toString())
                                      .textfielde2f2f4Decoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Weight',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: Container(
                                height: 45.h,
                                width: 281.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: kE2F2F4,
                                ),
                                child: TextField(
                                  readOnly: true,
                                  decoration: TextfieldDecoration(
                                          label:
                                              '${model.weight.toString()} kg')
                                      .textfielde2f2f4Decoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Age',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: TextField(
                                readOnly: true,
                                decoration: TextfieldDecoration(
                                        label: '${model.age.toString()} yrs')
                                    .textfielde2f2f4Decoration(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'RP',
                          style: kManRope_500_20_001314,
                        ), // padding: EdgeInsets.only(bottom: 16.h),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 36.w),
                          child: Container(
                              width: 1.sw,
                              constraints: BoxConstraints(
                                minHeight: 220.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 32.w,
                                    right: 16.h,
                                    top: 16.h,
                                    bottom: 16.h),
                                child: Text(
                                  model.rp.toString(),
                                  style: kManRope_400_14_001314,
                                  textAlign: TextAlign.start,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/signature.png',
                                      height: 48.h,
                                      width: 68.w,
                                    ),
                                    Text(
                                      'Signature',
                                      style: kManRope_500_16_001314,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 39.h,
                            ),
                            Center(
                              child: MainButton(
                                  onPressed: () {
                                    setState(() {
                                      isreadable = false;
                                    });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => PrescriptionViewScreen()),
                                    // );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 63.w,
                                        right: 71.w),
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
                                  shape: CustomDecoration()
                                      .smallButtonDecoration()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
          : Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 27.h,
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: TextField(
                                style: kManRope_500_16_626A6A,
                                // readOnly: true,
                                decoration: TextfieldDecoration(label: 'Type here')
                                    .textfielde2f2f4Decoration(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: Container(
                                height: 45.h,
                                width: 281.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: kE2F2F4,
                                ),
                                child: TextField(
                                  controller: _nameController,
                                  style: kManRope_500_16_626A6A,
                                  decoration:
                                      TextfieldDecoration(label: 'Type here')
                                          .textfielde2f2f4Decoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Weight',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: Container(
                                height: 45.h,
                                width: 281.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: kE2F2F4,
                                ),
                                child: TextField(
                                  controller: _weightController,
                                  style: kManRope_500_16_626A6A,
                                  // readOnly: true,
                                  decoration:
                                      TextfieldDecoration(label: 'Type here')
                                          .textfielde2f2f4Decoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Age',
                              style: kManRope_500_16_001314,
                            ),
                            Container(
                              height: 45.h,
                              width: 281.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: TextField(
                                controller: _ageController,
                                style: kManRope_500_16_626A6A,
                                // readOnly: true,
                                decoration:
                                    TextfieldDecoration(label: 'Type here')
                                        .textfielde2f2f4Decoration(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'RP',
                          style: kManRope_500_20_001314,
                        ), // padding: EdgeInsets.only(bottom: 16.h),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 36.w),
                          child: Container(
                              width: 1.sw,
                              constraints: BoxConstraints(
                                minHeight: 220.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: kE2F2F4,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.h,
                                      right: 16.h,
                                      top: 16.h,
                                      bottom: 16.h),
                                  child: TextField(
                                    controller: _rpController,
                                    style: kManRope_500_16_626A6A,
                                    maxLines: 8,
                                    decoration: TextfieldDecoration(
                                            label: 'write notes',
                                            hintstyle: kManRope_400_14_001314)
                                        .blankfieldDecoration(),
                                  ))),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/signature.png',
                                      height: 48.h,
                                      width: 68.w,
                                    ),
                                    Text(
                                      'Signature',
                                      style: kManRope_500_16_001314,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 39.h,
                            ),
                            isreadable
                                ? Center(
                                    child: MainButton(
                                        onPressed: () {},
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 63.w,
                                              right: 71.w),
                                          child: Text(
                                            "Edit",
                                            style: kManRope_500_18_FFFFF,
                                          ),
                                        ),
                                        color: k006D77,
                                        shape: CustomDecoration()
                                            .smallButtonDecoration()),
                                  )
                                : Center(
                                    child: MainButton(
                                        onPressed: () {
                                          /*Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PTabsScreen(),
                                            ),
                                          );*/
                                          setState(() {
                                            _editLoading = true;
                                          });
                                          final resp = EditPrescriptionApi()
                                              .get(
                                                  prescriptionId:
                                                      widget.prescriptionId,
                                                  name: _nameController.text,
                                                  weight: int.parse(
                                                      _weightController.text),
                                                  age: int.parse(
                                                      _ageController.text),
                                                  rp: _rpController.text);
                                          resp.then((value) {
                                            if (value['status'] == true) {
                                              setState(() {
                                                _editLoading = false;
                                                ;
                                              });
                                              Navigator.of(context).pop();
                                              Fluttertoast.showToast(
                                                  msg: "Prescription Updated.");
                                            } else {
                                              setState(() {
                                                _editLoading = false;
                                              });
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Update failed. Please try again.");
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 63.w,
                                              right: 71.w),
                                          child: Text(
                                            "Save",
                                            style: kManRope_500_18_FFFFF,
                                          ),
                                        ),
                                        color: k006D77,
                                        shape: CustomDecoration()
                                            .smallButtonDecoration()),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_editLoading) LoadingWidget(),
              ],
            ),
    );
  }
}
