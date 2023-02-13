import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PKycConfirmNameScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class PKycScreen extends StatefulWidget {
  const PKycScreen({Key? key}) : super(key: key);

  @override
  State<PKycScreen> createState() => _PKycScreenState();
}

class _PKycScreenState extends State<PKycScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kEDF6F9,
        toolbarHeight: 0,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
          statusBarColor: kEDF6F9,
          statusBarIconBrightness: Brightness.dark,
        )
            : SystemUiOverlayStyle.dark,
      ),
      backgroundColor: kEDF6F9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(36),
                    topLeft: Radius.circular(36)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 102.h),
                child: Column(
                  children: [
                    Text(
                      'Enter your PAN number to Complete KYC',
                      style: kManRope_500_20_001314,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text(
                      'As per Privacy Policy is mandatory for investments in stocks & mutual funds',
                      style: kManRope_400_14_626A6A,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    SizedBox(
                      height: 62.h,
                      width: 1.sw,
                      child: TextField(
                        decoration: TextfieldDecoration(label: 'Enter your PAN')
                            .textfieldDecoration(),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    SizedBox(
                      height: 24,
                      width: 1.sw,
                      child: Row(
                        children: [
                          // Checkbox(
                          //   checkColor: Colors.white,
                          //   value: isChecked,
                          //   onChanged: (bool? value) {
                          //     setState(() {
                          //       isChecked = value!;
                          //     });
                          //   },
                          // ),
                          SvgPicture.asset(
                            'assets/icons/check mark-rectangle.svg',
                            height: 21.5.h,
                            width: 21.5.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'I authorise Ataraxis to fetch my KYC details for completing KYC.',
                            style: kManRope_400_12_626A6A,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      height: 104.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: kECF0F8),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your data is protected by \nAtaraxis',
                                style: kManRope_500_16_001314,
                              ),
                              SizedBox(
                                height: 64,
                                width: 46,
                                // color: Colors.red,
                                child: Image.asset(
                                  'assets/images/security-unlock 1.png',
                                  height: 64,
                                  width: 46,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 223.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 80.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 56.h,
                              child: MainButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PKycConfirmNameScreen()));
                                  },
                                  child: Text(
                                    "Next",
                                    style: kManRope_500_16_white,
                                  ),
                                  color: k006D77,
                                  shape:
                                  CustomDecoration().button16Decoration()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
