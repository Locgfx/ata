import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../Apis/UserAPis/user_home_apis/user_specialist_model.dart';

class SpecializationBottomSheet extends StatefulWidget {
  final List<UserSpecialistModel> specialistModel;
  final List<UserSpecialistModel> selectedSpecialistModel;
  final Function(List<UserSpecialistModel>) onPop;
  SpecializationBottomSheet(
      {Key? key,
      required this.specialistModel,
      required this.onPop,
      required this.selectedSpecialistModel})
      : super(key: key);

  @override
  State<SpecializationBottomSheet> createState() =>
      _SpecializationBottomSheetState();
}

class _SpecializationBottomSheetState extends State<SpecializationBottomSheet> {
  List<UserSpecialistModel> data = [];

  /*final List<String> languages = [
    'Hindi',
    'English',
    'Tamil',
    'Sanskrit',
    'Marathi',
    'Punjabi',
  ];*/
  List<UserSpecialistModel> selectedSpecialities = [];

  List<bool> valList = [];
  @override
  void initState() {
    data = widget.specialistModel;
    for (var v in data) {
      /*log("1");
      for (var u in widget.selectedSpecialistModel) {
        log("2");
        if (v.id == u.id) {
          log("3");
          valList.add(true);
          selectedSpecialities.add(u);
        } else {
          log("4");
          valList.add(false);
        }
      }*/
      if (widget.selectedSpecialistModel.contains(v)) {
        valList.add(true);
      } else {
        valList.add(false);
      }
    }
    selectedSpecialities = widget.selectedSpecialistModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                'Select Specialization',
                style: kManRope_700_20_white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 280.h,
            width: 200.h,
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: valList[index],
                  onChanged: (val) {
                    setState(() {
                      valList[index] = !valList[index];
                    });
                    if (valList[index] == true) {
                      selectedSpecialities.add(data[index]);
                    } else {
                      selectedSpecialities.removeWhere(
                          (element) => element.id == data[index].id);
                    }
                  },
                  title: Text(
                    data[index].name.toString(),
                    style: kManRope_400_16_626A6A,
                  ),
                  activeColor: k006D77,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 20),
            child: Center(
              child: MainButton(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 63.h, vertical: 15.h),
                  child: Text(
                    "Done",
                    style: kManRope_500_18_FFFFF,
                  ),
                ),
                color: k006D77,
                shape: CustomDecoration().smallButtonDecoration(),
                onPressed: () {
                  for (var v in selectedSpecialities) {
                    log(v.name.toString() + v.id.toString());
                  }
                  Navigator.of(context).pop();
                  widget.onPop(selectedSpecialities);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
