import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/agreement_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/help_and_support_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/kyc_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/order_history_screen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/slots_availability_screens.dart';
import 'package:greymatter/constants/fonts.dart';


import '../../../../constants/colors.dart';
import 'my_account_screen.dart';
import 'personal_info_screen.dart';

class PsychologistProfileScreen extends StatefulWidget {
  const PsychologistProfileScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistProfileScreen> createState() =>
      _PsychologistProfileScreenState();
}

class _PsychologistProfileScreenState extends State<PsychologistProfileScreen> {
  bool _switchValue = true;

  void _profileLogoutBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => const ProfileLogoutBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40.h,
        elevation: 0,
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
                        builder: (context) =>
                            const PsychologistPersonalInfoScreen()));
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
                        Container(
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/images/iconrightblack.png',
                            height: 24.w,
                            width: 24.w,
                          ),
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
                        builder: (context) => PsychologistAccountScreen()));
                  },
                  child: Container(
                    height: 48.h,
                    width: 380.w,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PsychologistAccountScreen()));
                      },
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => KycScreen()));
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SlotsAvailabilityScreen()));
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
                        builder: (context) => const OrderHistoryScreen()));
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
                        builder: (context) => AgreementScreen()));
                  },
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  AgreementScreen())),
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
                        builder: (context) => const HelpAndSupportScreen()));
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
                      width: 60.w,
                      height: 28.h,
                      toggleSize: 20,
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
class ProfileLogoutBottomSheet extends StatefulWidget {
  const ProfileLogoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<ProfileLogoutBottomSheet> createState() => _ProfileLogoutBottomSheet();
}

class _ProfileLogoutBottomSheet extends State<ProfileLogoutBottomSheet> {
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
          color: kWhiteBGColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding:EdgeInsets.only(top: 20.h),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
                    }),
                    child: Text("Log out",style: kManRope_700_20_001314,)
                  ),
                  SizedBox(height: 16.h),
                  Text("You will be returned to the login screen.",style: kManRope_500_16_626A6A,),
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
                            child: Container(height: 52.h,
                                padding: EdgeInsets.only(top: 16),
                                child: Center(child: Text("Cancel",style:kManRope_500_20_006D77 ,))),
                          )),
                      Container(height:52.h,color: Colors.white,width: 1,),
                      Expanded(child: Container(
                          padding: EdgeInsets.only(top: 16),

                        height: 52.h,
                          child: Center(child: Text("Logout",style: kManRope_500_20_B64949,)))),
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
