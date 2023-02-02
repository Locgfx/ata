import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/pofile_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAccountscreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAgreementscreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UHelpandsupport.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UMyActivity.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UOrderhistory.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UPersonalInfoScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class UProfileScreen extends StatefulWidget {
  const UProfileScreen({Key? key}) : super(key: key);

  @override
  State<UProfileScreen> createState() => _UProfileScreenState();
}

class _UProfileScreenState extends State<UProfileScreen> {
  bool _switchValue = true;
  void _profileLogoutBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => ProfileLogoutBottomSheet());
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
                      _profileLogoutBottomSheet();
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
