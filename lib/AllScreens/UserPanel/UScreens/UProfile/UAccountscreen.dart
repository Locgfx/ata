import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangeMobileno.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangemail.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UChangepassword.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UDeleteAccount.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UAccountScreen extends StatefulWidget {
  const UAccountScreen({Key? key}) : super(key: key);

  @override
  State<UAccountScreen> createState() => _UAccountScreenState();
}

class _UAccountScreenState extends State<UAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        appBarText: 'Account',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 51.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UChangeMobileNoScreen()));
                },
                child: Container(
                  // color: Colors.red,
                  height: 48.h,
                  width: 1.sw,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Change mobile number",style: kManRope_500_16_001314,),
                      GestureDetector(

                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UChangeMobileNoScreen()));

                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            // color: Colors.red,
                            child: Image.asset("assets/images/icondropdown.png",
                              height: 48.h,width: 48.h,),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),

              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UChangeEmailScreen()));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) =>
                  //         PsychologistChangeEmailScreen()));
                },
                child: Container(
                  // color: Colors.red,
                  height: 48.h,
                  width: 1.sw,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Change email",style: kManRope_500_16_001314,),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         PsychologistChangeEmailScreen()));

                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            // color: Colors.red,
                            child: Image.asset("assets/images/icondropdown.png",
                              height: 48.h,width: 48.h,),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UChangePasswordScreen()));
                },
                child: Container(
                  // color: Colors.yellow,
                  height: 48.h,
                  width: 1.sw,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Change password",style: kManRope_500_16_001314,),
                      Container(
                        height: 48,
                        width: 48,
                        // color: Colors.red,
                        child: Image.asset("assets/images/icondropdown.png",
                          height: 48.h,width: 48.h,),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UDeleteAccountScreen()));

                },
                child: SizedBox(
                  height: 48.h,
                  width: 1.sw,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delete Account",style: kManRope_500_16_BD4D4D,),
                      // Image.asset("assets/images/icondropdown.png",height: 48.h,width: 48.h,)
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => PsychologistChangeEmailScreen()));
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Change email',
              //         style: kManRope_500_16_001314,
              //       ),
              //       SvgPicture.asset(
              //         'assets/icons/downArrow.svg',
              //         width: 24.w,
              //         height: 24.h,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // SizedBox(
              //   height: 48.h,
              //   width: 1.sw,
              //   child: TextField(
              //     onTap: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) =>
              //               PsychologistChangePasswordScreen()));
              //     },
              //     readOnly: true,
              //     decoration: TextfieldDecoration(
              //         hintstyle: kManRope_500_16_001314,
              //         label: 'Change Password',
              //         child: Image.asset(
              //           "assets/images/downarrowblack.png",
              //           height: 5,
              //         )).underlinefieldDecoration(),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) =>
              //             PsychologistChangePasswordScreen()));
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Change password',
              //         style: kManRope_500_16_001314,
              //       ),
              //       SvgPicture.asset(
              //         'assets/icons/downArrow.svg',
              //         width: 24.w,
              //         height: 24.h,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => DeleteAccount()));
              //   },
              //   child: SizedBox(
              //     height: 48.h,
              //     width: 1.sw,
              //     child: Text(
              //       'Delete Account',
              //       style: kManRope_500_16_B64949,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
