import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PHomeScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PMyEarning.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PPerceptions/PPercriptionScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PPosts/PPostScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PProfileScreen.dart';
import 'package:greymatter/constants/colors.dart';

class PTabsScreen extends StatefulWidget {
  const PTabsScreen({Key? key}) : super(key: key);

  @override
  State<PTabsScreen> createState() => _PTabsScreenState();
}

class _PTabsScreenState extends State<PTabsScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,
        body: [
          PHomeScreen(),
          PMyEarningsScreen(),
          PPostScreen(index: 1),
          PPrescriptionScreen(),
          PProfileScreen(),
        ].elementAt(_index),
        bottomNavigationBar: Container(
          //padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _index = 0;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(_index == 0 ? 13 : 14),
                          margin:
                          EdgeInsets.only(left: 18, bottom: 12, top: 12),
                          height: 62.w,
                          decoration: BoxDecoration(
                            color: _index == 0
                                ? k006D77.withOpacity(0.08)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: _index == 0
                              ? Image.asset('assets/images/logoT.png')
                              : Image.asset(
                            'assets/images/logoF.png',
                            color: k626A6A,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _index = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                          height: 62.w,
                          decoration: BoxDecoration(
                              color: _index == 1
                                  ? k006D77.withOpacity(0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16)),
                          child: SvgPicture.asset(
                            _index == 1
                                ? 'assets/icons/Union.svg'
                                : 'assets/icons/calenderunselected.svg',
                            color: _index == 1 ? k006D77 : k626A6A,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _index = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                          height: 62.w,
                          decoration: BoxDecoration(
                              color: _index == 2
                                  ? k006D77.withOpacity(0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16)),
                          child: SvgPicture.asset(
                            _index == 2
                                ? 'assets/icons/dotsSelected.svg'
                                : 'assets/icons/dotsunselected.svg',
                            color: _index == 2 ? k006D77 : k626A6A,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _index = 3;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                          height: 62.w,
                          decoration: BoxDecoration(
                              color: _index == 3
                                  ? k006D77.withOpacity(0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16)),
                          child: SvgPicture.asset(
                            _index == 3
                                ? 'assets/images/pF.svg'
                                : 'assets/images/p.svg',
                            color: _index == 3 ? k006D77 : k626A6A,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _index = 4;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          margin:
                          EdgeInsets.only(right: 18, bottom: 12, top: 12),
                          height: 62.w,
                          decoration: BoxDecoration(
                              color: _index == 4
                                  ? k006D77.withOpacity(0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16)),
                          child: SvgPicture.asset(
                            _index == 4
                                ? 'assets/icons/profileSelected.svg'
                                : 'assets/icons/profileunselected.svg',
                            color: _index == 4 ? k006D77 : k626A6A,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
