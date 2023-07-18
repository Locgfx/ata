import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/ULoginScreens/ULoginScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAccountscreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UAgreementscreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UHelpandsupport.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UMyActivity.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UOrderhistory.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UPersonalInfoScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_logout_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Apis/UserAPis/user_profile_apis/user_profile_api.dart';
import '../../../../model/UModels/user_profile_models/user_profile_model.dart';

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

  _getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    _switchValue = prefs.getBool(Keys().notificationValue) ?? true;
  }

  @override
  void initState() {
    _getData();
    _getPrefs();
    super.initState();
  }

  UserProfileModel model = UserProfileModel();
  bool _isLoading = false;
  _getData() {
    print("object");
    _isLoading = true;
    final resp = UserProfileApi().get();
    print(resp);
    resp.then((value) {
      print(value);
      setState(() {
        try {
          model = UserProfileModel.fromJson(value);
          _isLoading = false;
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
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
      body: _isLoading
          ? Center(
              child: Image.asset(
                'assets/images/loader.gif',
                width: 200.w,
                height: 200.h,
                //color: k006D77,
              ),
            )
          : SafeArea(
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
                              child: Image.network(
                                model.photo.toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (q, w, e) => Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.name.toString(),
                                  style: kManRope_500_16_001314,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  model.email.toString() == "null"
                                      ? model.phone.toString()
                                      : model.email.toString(),
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
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) =>
                                      const UserPersonalInfoScreen()))
                              .then((value) {
                            _getData();
                          });
                        },
                        child: SizedBox(
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
                              builder: (context) => UAccountScreen(
                                    model: model,
                                    onTap: () {
                                      _getData();
                                    },
                                  )));
                        },
                        child: Container(
                          height: 48.h,
                          width: 380.w,
                          color: Colors.transparent,
                          child: GestureDetector(
                            /*onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UAccountScreen(
                                        model: model,
                                        onTap: () {
                                          _getData();
                                        },
                                      )));
                            },*/
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
                            onToggle: (val) async {
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool(
                                  Keys().notificationValue, _switchValue);
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
                          child: Container(
                            height: 43.h,
                            width: 1.sw,
                            color: Colors.transparent,
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
  State<UProfileLogoutBottomSheet> createState() =>
      _UProfileLogoutBottomSheet();
}

class _UProfileLogoutBottomSheet extends State<UProfileLogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kEDF6F9,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(top: 20.h),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
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
                SizedBox(height: 20.h),
                Container(
                  height: 1,
                  width: 1.sw,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 56.h,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: kManRope_500_20_006D77,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 56.h,
                      color: Colors.white,
                      width: 1,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final resp = UserLogoutApi().get();
                          resp.then((value) async {
                            if (value['status'] == true) {
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool(Keys().loginDone, false);
                              prefs.clear();
                              prefs.setBool(Keys().firstRun, false);
                              // await GoogleSignInClass().logOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ULoginScreen(showBack: true),
                                    // builder: (_) => OnBoardingScreen()
                                    // ULoginScreen(showBack: false),
                                  ),
                                  (route) => false);
                            } else {
                              Navigator.of(context).pop();
                              Fluttertoast.showToast(
                                  msg: "Logout failed! Please try again.");
                            }
                          });
                        },
                        child: Container(
                          height: 56.h,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              "Logout",
                              style: kManRope_500_20_B64949,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
