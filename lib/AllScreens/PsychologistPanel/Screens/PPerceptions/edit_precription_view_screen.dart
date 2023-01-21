import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/tabs_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
// import 'package:greymatter/screens/PsychologistPanel/Screens/Home/tabs_screen.dart';
// import 'package:greymatter/screens/PsychologistPanel/Screens/PPerceptions/precription_view_screen.dart';
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
  bool isreadable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        appBarText: "Prescription View",
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: isreadable ? Padding(
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
                      readOnly: true,
                      decoration: TextfieldDecoration(label: '12,Mon,2022').textfielde2f2f4Decoration(),
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
                    child:  Container(
                      height: 45.h,
                      width: 281.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kE2F2F4,
                      ),
                      child: TextField(readOnly: true,
                        decoration: TextfieldDecoration(label: 'Pankaj sharma').textfielde2f2f4Decoration(),
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
                    child:  Container(
                      height: 45.h,
                      width: 281.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kE2F2F4,
                      ),
                      child: TextField(readOnly: true,
                        decoration: TextfieldDecoration(label: '80 kg').textfielde2f2f4Decoration(),
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
                    child: TextField(readOnly: true,
                      decoration: TextfieldDecoration(label: '25 yrs').textfielde2f2f4Decoration(),
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
              SizedBox(height: 16.h,),
              Padding(
                padding:EdgeInsets.only(left: 36.w),
                child: Container(
                  height: 220.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: kE2F2F4,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 32.w,right: 16.h,top: 16.h,bottom: 16.h),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                      style: kManRope_400_14_001314,
                      textAlign: TextAlign.start,),
                  )
                ),
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
                          padding: EdgeInsets.only(top: 15, bottom: 15,left:63.w,right: 71.w),
                          child:  isreadable ? Text(
                            "Edit",
                            style: kManRope_500_18_FFFFF,
                          ):
                          Text(
                            "Save",
                            style: kManRope_500_18_FFFFF,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().smallButtonDecoration()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ):
      Padding(
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
                    child: TextField(style:kManRope_500_16_626A6A ,
                      // readOnly: true,
                      decoration: TextfieldDecoration(label: 'Type here').textfielde2f2f4Decoration(),
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
                    child:  Container(
                      height: 45.h,
                      width: 281.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kE2F2F4,
                      ),
                      child: TextField(style:kManRope_500_16_626A6A ,
                        decoration: TextfieldDecoration(label: 'Type here').textfielde2f2f4Decoration(),
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
                    child:  Container(
                      height: 45.h,
                      width: 281.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kE2F2F4,
                      ),
                      child: TextField(style:kManRope_500_16_626A6A ,
                        // readOnly: true,
                        decoration: TextfieldDecoration(label: 'Type here').textfielde2f2f4Decoration(),
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
                    child: TextField(style:kManRope_500_16_626A6A ,
                      // readOnly: true,
                      decoration: TextfieldDecoration(label: 'Type here').textfielde2f2f4Decoration(),
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
              SizedBox(height: 16.h,),
              Padding(
                padding:EdgeInsets.only(left: 36.w),
                child: Container(
                    height: 220.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kE2F2F4,
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 16.h,right: 16.h,top: 16.h,bottom: 16.h),
                      child: TextField(style:kManRope_500_16_626A6A ,
                        maxLines: 8,
                        decoration: TextfieldDecoration(
                            label: 'write notes',hintstyle: kManRope_400_14_001314).blankfieldDecoration(),
                      )
                    )
                ),
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
                  isreadable ? Center(
                    child: MainButton(
                        onPressed: () {

                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15,left:63.w,right: 71.w),
                          child:   Text(
                            "Edit",
                            style: kManRope_500_18_FFFFF,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().smallButtonDecoration()),
                  )
                  :Center(
                    child: MainButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PTabsScreen(),
                            ),
                          );

                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15,left:63.w,right: 71.w),
                          child:
                          Text(
                            "Save",
                            style: kManRope_500_18_FFFFF,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().smallButtonDecoration()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
