import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/OnboardingScreen/onboarding_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PAgreementScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PHealthAndSupportScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PPersonalInfoScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PSlotsAvailablityScreen.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/global/Sharedprefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Apis/UserAPis/user_profile_apis/user_logout_api.dart';
import '../../../../Apis/UserAPis/user_profile_apis/user_profile_api.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../model/UModels/user_profile_models/user_profile_model.dart';
import '../../../UserPanel/UScreens/UProfile/UAccountscreen.dart';
import '../../../UserPanel/UScreens/UProfile/UMyActivity.dart';
import '../../../UserPanel/UScreens/UProfile/UOrderhistory.dart';

class PProfileScreen extends StatefulWidget {
  const PProfileScreen({Key? key}) : super(key: key);

  @override
  State<PProfileScreen> createState() => _PProfileScreenState();
}

class _PProfileScreenState extends State<PProfileScreen> {
  bool _switchValue = true;

  void _pprofileLogoutBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => const PProfileLogoutBottomSheet());
  }

  @override
  void initState() {
    _getData();
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
      log(value.toString());
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
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
                statusBarColor: Colors.white,
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
                                      const PPersonalInfoScreen()))
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
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My account',
                                style: kManRope_500_16_001314,
                              ),
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
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
                              builder: (context) => UMyActivityScreen()));
                        },
                        child: SizedBox(
                          height: 48.h,
                          width: 380.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Activity',
                                style: kManRope_500_16_001314,
                              ),
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      /*SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PKycScreen()));
                        },
                        child: SizedBox(
                          height: 48.h,
                          width: 380.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'E-KYC',
                                style: kManRope_500_16_001314,
                              ),
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PSlotsAvailabilityScreen()));
                        },
                        child: SizedBox(
                          height: 48.h,
                          width: 380.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Slots availability',
                                style: kManRope_500_16_001314,
                              ),
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
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
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
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
                              builder: (context) => PAgreementScreen()));
                        },
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => PAgreementScreen())),
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
                                Image.asset(
                                  'assets/images/iconrightblack.png',
                                  height: 24.w,
                                  width: 24.w,
                                ),
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
                              builder: (context) =>
                                  const PHelpAndSupportScreen()));
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
                              Image.asset(
                                'assets/images/iconrightblack.png',
                                height: 24.w,
                                width: 24.w,
                              ),
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
                            _pprofileLogoutBottomSheet();
                            // _logOutBottomSheet();
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

class PProfileLogoutBottomSheet extends StatefulWidget {
  const PProfileLogoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<PProfileLogoutBottomSheet> createState() =>
      _PProfileLogoutBottomSheet();
}

class _PProfileLogoutBottomSheet extends State<PProfileLogoutBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                        onTap: () async {
                          final resp = UserLogoutApi().get();
                          resp.then((value) async {
                            if (value['status'] == true) {
                              UserPrefs().setLoginFalse();
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool(Keys().loginDone, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OnBoardingScreen(),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Logout failed! Please try again.");
                            }
                          });
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogOutBottomSheet extends StatefulWidget {
  const LogOutBottomSheet({Key? key}) : super(key: key);

  @override
  State<LogOutBottomSheet> createState() => _LogOutBottomSheetState();
}

class _LogOutBottomSheetState extends State<LogOutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: k006D77,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: k006D77,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        height: 220.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              '',
              style: kManRope_700_20_001314,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'You will be returned to the login screen.',
              style: kManRope_500_16_626A6A,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text(
                    'Cancel',
                    style: kManRope_500_20_006D77,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                MaterialButton(
                  child: Text(
                    'Log out',
                    style: kManRope_500_20_B64949,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
