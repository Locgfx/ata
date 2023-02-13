import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UDoctorprofile.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UInstantScreens/UConfirmBookingScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/primary_card_button.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/secondary_card_button.dart';

class USelectPsychologistsScreen extends StatelessWidget {
  const USelectPsychologistsScreen({Key? key, required this.issue}) : super(key: key);
  final String issue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: 'Available Psychologists',
      ),
      body: Padding(
        padding:
        EdgeInsets.only(left: 24.w, top: 40.h, right: 24.h, bottom: 20.h),
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return Container(
                width: 1.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Center(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 64.w,
                                  height: 64.h,
                                  // clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/userP.png",
                                          ),
                                          fit: BoxFit.cover),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // width: 190,
                                      child: Text(
                                        'Raghuram Singh',
                                        style: kManRope_600_16_Black,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text('MA in Counselling Psychology',
                                        style: kManRope_400_12_353535_07),
                                    SizedBox(height: 4),
                                    StarWidget()
                                  ],
                                ),
                              ],
                            ),
                            Text('₹270', style: kManRope_400_12_001314),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 24.h),
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UDoctorProfileScreen()));
                                    },
                                    child: SecondaryCardButton())),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UConfirmBookingScreen(
                                            issue: issue,
                                          )));
                                },
                                child: const PrimaryCardButton(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(height: 40.h);
            },
            itemCount: 10),
      ),
    );
  }
}
