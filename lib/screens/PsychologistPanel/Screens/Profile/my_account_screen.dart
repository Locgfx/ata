import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/deleteaccount.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/change_email_screen.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/change_password_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../constants/decorations.dart';

class PsychologistAccountScreen extends StatefulWidget {
  const PsychologistAccountScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistAccountScreen> createState() =>
      _PsychologistAccountScreenState();
}

class _PsychologistAccountScreenState extends State<PsychologistAccountScreen> {
  void _deleteAccountBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (BuildContext context) => const DeleteAccountBottomSheet());
  }

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
                          PsychologistChangeEmailScreen()));
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PsychologistChangeEmailScreen()));

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
                                    PsychologistChangePasswordScreen()));
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
                            DeleteAccount()));

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

class DeleteAccountBottomSheet extends StatefulWidget {
  const DeleteAccountBottomSheet({Key? key}) : super(key: key);

  @override
  State<DeleteAccountBottomSheet> createState() =>
      _DeleteAccountBottomSheetState();
}

class _DeleteAccountBottomSheetState extends State<DeleteAccountBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Text(
              '"When you delete your account, all the user generated content is normally erased (although there are small exceptions), while all the log data is preserved – forever." The preserved log data won\'t have your name attached to it',
              style: kManRope_500_16_626A6A,
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MainButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 33.5, bottom: 16, right: 33.5),
                    child: Text(
                      "Cancel",
                      style: kManRope_500_16_white,
                    ),
                  ),
                  color: kB64C4C,
                  shape: CustomDecoration().button16Decoration()),
              MainButton(
                  onPressed: () {

                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 33.5, bottom: 16, right: 33.5),
                    child: Text(
                      "Delete",
                      style: kManRope_500_16_white,
                    ),
                  ),
                  color: kB64C4C,
                  shape: CustomDecoration().button16Decoration()),
              // SizedBox(
              //   height: 60.h,
              //   width: 182.w,
              //   child: CupertinoButton(
              //     child: Text(
              //       'Cancel',
              //       style: kManRope_500_16_001314,
              //     ),
              //     onPressed: () => Navigator.of(context).pop(),
              //   ),
              // ),
              // SizedBox(
              //   height: 60.h,
              //   width: 182.w,
              //   child: CupertinoButton(
              //     borderRadius: BorderRadius.all(Radius.circular(16)),
              //     color: kB64949,
              //     child: Text(
              //       'Delete Account',
              //       style: kManRope_500_16_white,
              //     ),
              //     onPressed: () => Navigator.of(context).pop(),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
