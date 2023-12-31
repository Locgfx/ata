import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class PPrescriptionViewScreen extends StatefulWidget {
  const PPrescriptionViewScreen({Key? key}) : super(key: key);

  @override
  State<PPrescriptionViewScreen> createState() => _PPrescriptionViewScreenState();
}

class _PPrescriptionViewScreenState extends State<PPrescriptionViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: "Prescription View",
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 27.h,
              ),
              Row(
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
                      decoration: TextfieldDecoration(label: 'Type Here')
                          .textfielde2f2f4Decoration(),
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
                    'Name',
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
                      decoration: TextfieldDecoration(label: 'Type Here')
                          .textfielde2f2f4Decoration(),
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kE2F2F4,
                    ),
                    child: TextField(
                      decoration: TextfieldDecoration(label: 'Type Here')
                          .textfielde2f2f4Decoration(),
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kE2F2F4,
                    ),
                    child: TextField(
                      decoration: TextfieldDecoration(label: 'Type Here')
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 36.w),
                child: Container(
                  height: 220.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: kE2F2F4,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextField(
                      maxLines: 8,
                      decoration: TextfieldDecoration(
                          label: 'write notes',
                          hintstyle: kManRope_400_14_001314)
                          .blankfieldDecoration(),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 16.h,
              ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PTabsScreen()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 63.w, right: 71.w),
                      child: Text(
                        "Save",
                        style: kManRope_500_16_white,
                      ),
                    ),
                    color: k006D77,
                    shape: CustomDecoration().smallButtonDecoration()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
