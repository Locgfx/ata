import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/prescription_screen/precription_view_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class EditPrescriptionViewScreen extends StatefulWidget {
  const EditPrescriptionViewScreen({Key? key}) : super(key: key);

  @override
  State<EditPrescriptionViewScreen> createState() =>
      _EditPrescriptionViewScreenState();
}

class _EditPrescriptionViewScreenState
    extends State<EditPrescriptionViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 130.w, right: 130.w, bottom: 52.h),
        child: MainButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PrescriptionViewScreen()),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 14),
              child: Text(
                "Edit",
                style: kManRope_500_16_white,
              ),
            ),
            color: k006D77,
            shape: CustomDecoration().smallButtonDecoration()),
      ),
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
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
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, bottom: 6.h),
                      child: SizedBox(
                        width: 200.w,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '12,Mon, 2022',
                            hintStyle: kManRope_400_14_001314,
                          ),
                        ),
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
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, bottom: 6.h),
                      child: SizedBox(
                        width: 200.w,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Pankaj sharma',
                            hintStyle: kManRope_400_14_001314,
                          ),
                        ),
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kE2F2F4,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, bottom: 6.h),
                      child: SizedBox(
                        width: 200.w,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '80 kg',
                            hintStyle: kManRope_400_14_001314,
                          ),
                        ),
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kE2F2F4,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, bottom: 6.h),
                      child: SizedBox(
                        width: 200.w,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '25 yrs',
                            hintStyle: kManRope_400_14_001314,
                          ),
                        ),
                      ),
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
              SizedBox(
                height: 189.h,
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
                height: 34.h,
              ),
              // Center(
              //   child: SizedBox(
              //     height: 56.h,
              //     width: 168.w,
              //     child:
              //         CustomActiveTextButton1(onPressed: () {}, text: 'Save'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
