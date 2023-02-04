import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/pofile_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/ULoginScreens/login_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAccountscreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAgreementscreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UHelpandsupport.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UMyActivity.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UOrderhistory.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UPersonalInfoScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/global/Sharedprefs.dart';

class UProfileScreen extends StatefulWidget {
  const UProfileScreen({Key? key}) : super(key: key);

  @override
  State<UProfileScreen> createState() => _UProfileScreenState();
}

class _UProfileScreenState extends State<UProfileScreen> {
  bool _switchValue = true;
  void _uprofileLogoutBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => UProfileLogoutBottomSheet());
  }

  Widget arrow() {
    return Image.asset(
      'assets/images/iconrightblack.png',
      height: 24.w,
      width: 24.w,
      color: k626A6A,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: kEDF6F9,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
                statusBarColor: kEDF6F9,
                statusBarIconBrightness: Brightness.dark,
              )
            : SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.h,
                  width: 380.w,
                  child: Row(
                    children: [
                      Container(
                        height: 55.h,
                        width: 55.w,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset('assets/images/userP.png'),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Priya singh',
                            style: kManRope_500_16_001314,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'priyasingh344@gmail.com',
                            style: kManRope_400_14_626A6A,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Text(
                  'Account',
                  style: kManRope_500_12_626A6A,
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserPersonalInfoScreen()));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) =>
                    // const PsychologistPersonalInfoScreen()));
                  },
                  child: Container(
                    height: 48.h,
                    width: 380.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Info',
                          style: kManRope_500_16_001314,
                        ),
                        arrow(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UAccountScreen()));
                  },
                  child: Container(
                    height: 48.h,
                    width: 380.w,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UAccountScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My account',
                            style: kManRope_500_16_001314,
                          ),
                          arrow(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UMyActivityScreen()));
                  },
                  child: SizedBox(
                    height: 48.h,
                    width: 380.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My activity',
                          style: kManRope_500_16_001314,
                        ),
                        arrow(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UOrderHistory()));
                  },
                  child: SizedBox(
                    height: 48.h,
                    width: 380.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order history',
                          style: kManRope_500_16_001314,
                        ),
                        arrow(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Help and support',
                  style: kManRope_500_12_626A6A,
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UAgreementScreen()));
                  },
                  child: SizedBox(
                    height: 48.h,
                    width: 380.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Agreements',
                          style: kManRope_500_16_001314,
                        ),
                        arrow(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UHelpandSupport()));
                  },
                  child: SizedBox(
                    height: 48.h,
                    width: 380.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Help and support',
                          style: kManRope_500_16_001314,
                        ),
                        arrow(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Settings',
                  style: kManRope_500_12_626A6A,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: kManRope_500_16_001314,
                    ),
                    FlutterSwitch(
                      width: 40,
                      height: 18,
                      padding: 3,
                      toggleSize: 14,
                      activeColor: k006D77,
                      value: _switchValue,
                      onToggle: (val) {
                        setState(() {
                          _switchValue = val;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 52.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _uprofileLogoutBottomSheet();
                    },
                    child: SizedBox(
                      height: 43.h,
                      width: 79.w,
                      child: Text(
                        'Log Out',
                        style: kManRope_500_16_B64949,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class UProfileLogoutBottomSheet extends StatefulWidget {
  const UProfileLogoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<UProfileLogoutBottomSheet> createState() => _UProfileLogoutBottomSheet();
}

class _UProfileLogoutBottomSheet extends State<UProfileLogoutBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // decoration: const BoxDecoration(
      //   // color: k006D77,
      //   borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      // ),
      //
      // height: 251.h,
      child: Column(
        children: [
          // Container(
          //   height: 71.h,
          //   decoration: const BoxDecoration(
          //     color: k006D77,
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          //   ),
          //   child: Center(
          //     child: Text(
          //       '',
          //       style: kManRope_700_16_white,
          //     ),
          //   ),
          // ),
          Container(
            height: 180.h,
            decoration: const BoxDecoration(
              color: kEDF6F9,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(top: 20.h),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Text(
                    "Log out",
                    style: kManRope_700_20_001314,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "You will be returned to the login screen.",
                    style: kManRope_500_16_626A6A,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 1,
                      width: 1.sw,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 52.h,
                                padding: EdgeInsets.only(top: 16),
                                child: Center(
                                    child: Text(
                                      "Cancel",
                                      style: kManRope_500_20_006D77,
                                    ))),
                          )),
                      Container(
                        height: 52.h,
                        color: Colors.white,
                        width: 1,
                      ),
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs().setLoginFalse();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen(),
                                ),
                              );
                            },
                            child: Container(
                                padding: EdgeInsets.only(top: 16),
                                height: 52.h,
                                child: Center(
                                    child: Text(
                                      "Logout",
                                      style: kManRope_500_20_B64949,
                                    ))),
                          )),
                    ],
                  ),
                  // GestureDetector(
                  //   onTap: () => setState(() {
                  //     _gIndex = 1;
                  //     Navigator.of(context).pop();
                  //   }),
                  //   child: Container(
                  //     height: 50.h,
                  //     width: 215.w,
                  //     decoration: BoxDecoration(
                  //       borderRadius:
                  //       const BorderRadius.all(Radius.circular(5)),
                  //       color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  //     ),
                  //     child: Center(
                  //         child: Text(
                  //           'This Week',
                  //           style: _gIndex == 1
                  //               ? kManRope_500_16_white
                  //               : kManRope_500_16_626A6A,
                  //         )),
                  //   ),
                  // ),
                  // SizedBox(height: 8.h),
                  // GestureDetector(
                  //   onTap: () => setState(() {
                  //     _gIndex = 1;
                  //     Navigator.of(context).pop();
                  //   }),
                  //   child: Container(
                  //     height: 44.h,
                  //     width: 215.w,
                  //     decoration: BoxDecoration(
                  //       borderRadius:
                  //       const BorderRadius.all(Radius.circular(5)),
                  //       color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  //     ),
                  //     child: Center(
                  //         child: Text(
                  //           'This Year',
                  //           style: _gIndex == 1
                  //               ? kManRope_500_16_white
                  //               : kManRope_500_16_626A6A,
                  //         )),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}