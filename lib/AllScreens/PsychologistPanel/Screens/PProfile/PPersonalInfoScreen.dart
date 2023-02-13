import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PEditBasicScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PEditDoctorDetailsScreen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class PPersonalInfoScreen extends StatefulWidget {
  const PPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PPersonalInfoScreen> createState() =>
      _PPersonalInfoScreenState();
}

class _PPersonalInfoScreenState
    extends State<PPersonalInfoScreen> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Account',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: Color(0xFF006D77), shape: BoxShape.circle),
                    child: Image.asset('assets/images/userP.png'),
                    clipBehavior: Clip.hardEdge,
                  ),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Center(
                child: Text(
                  'Change Photo',
                  style: kManRope_500_16_404040,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Basic Details',
                          style: flag
                              ? kManRope_700_16_001314
                              : kManRope_400_16_626A6A,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 1.5.h,
                          width: 100.w,
                          color: flag ? k006D77 : kEDF6F9,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 36.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Psychologist Profile',
                          style: flag
                              ? kManRope_400_16_626A6A
                              : kManRope_700_16_001314,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 1.5.h,
                          width: 154.w,
                          color: flag ? kEDF6F9 : k006D77,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              flag ? PEditBasicDetailsScreen() : PEditDoctorProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
