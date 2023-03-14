import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class LanguageBottomSheet extends StatefulWidget {
  List<LanguageModel> languageList;
  List<LanguageModel> selectedLanguageList;
  final Function(List<LanguageModel>) onPop;
  LanguageBottomSheet(
      {Key? key,
      required this.languageList,
      required this.onPop,
      required this.selectedLanguageList})
      : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  List<LanguageModel> languages = [];
  List<LanguageModel> selectedLanguages = [];

  List<bool> valList = [];

  @override
  void initState() {
    languages = widget.languageList;
    for (var v in languages) {
      if (widget.selectedLanguageList.contains(v)) {
        valList.add(true);
      } else {
        valList.add(false);
      }
      selectedLanguages = widget.selectedLanguageList;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 428.h,
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
                'Select Language',
                style: kManRope_700_20_white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 250.h,
            width: 200.h,
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: valList[index],
                  onChanged: (val) {
                    setState(() {
                      valList[index] = !valList[index];
                    });
                    if (valList[index] == true) {
                      selectedLanguages.add(languages[index]);
                    } else {
                      selectedLanguages.removeWhere(
                          (element) => element.id == languages[index].id);
                    }
                  },
                  title: Text(
                    languages[index].name.toString(),
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
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              // height: 56.h,
              // width: 168.w,
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
                    Navigator.of(context).pop();
                    widget.onPop(selectedLanguages);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
