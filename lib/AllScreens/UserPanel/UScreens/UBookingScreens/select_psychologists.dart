import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UDoctorprofile.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UInstantScreens/confirm_booking_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/primary_card_button.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/secondary_card_button.dart';

class SelectAvailablePsychologists extends StatelessWidget {
  const SelectAvailablePsychologists({Key? key, required this.issue})
      : super(key: key);
  final String issue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        imgPath: 'assets/images/iconbackappbar2.png',
        appBarText: 'Available Psychologists',
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   leadingWidth: 40.w,
      //   centerTitle: false,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Available Psychologists',
      //     style: kManRope_500_16_006D77,
      //   ),
      //   titleSpacing: 18.w,
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Padding(
      //       padding: EdgeInsets.all(20.0),
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //         size: 20,
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, top: 40.h, right: 24.h, bottom: 20.h),
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return Container(
                // height: 180,
                width: 1.sw,
                // padding: EdgeInsets.symmetric(),
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
                                    // Row(
                                    //   children: [
                                    //     Image.asset("assets/images/Star 1.png",height: 18.h,width: 18.w,),
                                    //     SizedBox(width: 4.w),
                                    //     Text('4.0',
                                    //         style: kManRope_400_12_626A6A),
                                    //     SizedBox(width: 4.w),
                                    //     // Text('.', style: kManRope_700_16_001314),
                                    //     // SizedBox(width: 4.w),
                                    //     Text('12 Yrs. Exp',
                                    //         style: kManRope_400_12_626A6A),
                                    //   ],
                                    // ),
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
                                          builder: (context) => ConfirmBooking(
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
