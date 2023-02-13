import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PPerceptions/PEditPrecriptionScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';

class PPrescriptionScreen extends StatefulWidget {
  const PPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PPrescriptionScreen> createState() => _PPrescriptionScreenState();
}

class _PPrescriptionScreenState extends State<PPrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )
            : SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kFFFFFF,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: k5A72ED.withOpacity(0.25),
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: kManRope_500_16_626A6A,
                  decoration: TextfieldDecoration(
                      label: 'Search by Transaction No',
                      child: Image.asset("assets/images/searchicon.png"))
                      .searchFieldDecoration(),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              height: 46.h,
              width: 1.sw,
              color: k006D77,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        // height: 1.sh,
                        //width: 76.w,
                        child: Text(
                          'Date',
                          textAlign: TextAlign.center,
                          style: kManRope_400_14_white,
                        ),
                      ),
                      /*SizedBox(
                        width: 26.w,
                      ),*/
                      // SizedBox(width: 70.w,),
                      Spacer(),
                      Expanded(
                        flex: 3,
                        //width: 97.w,
                        // height: 14.h,
                        child: Text(
                          'Full Name',
                          textAlign: TextAlign.center,
                          style: kManRope_400_14_white,
                        ),
                      ),
                      Spacer(),
                      /*SizedBox(
                        width: 26.w,
                      ),*/
                      // SizedBox(width: 59.w,),
                      Expanded(
                        flex: 2,
                        //width: 120.w,
                        // height: 14.h,
                        child: Text(
                          'Transaction No.',
                          textAlign: TextAlign.center,
                          style: kManRope_400_14_white,
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 2,
                        //width: 120.w,
                        // height: 14.h,
                        child: Text(
                          'Prescription',
                          textAlign: TextAlign.center,
                          style: kManRope_400_14_white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            // height:44.h,
                            // width:358.w,
                            child: Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  //width: 76.w,
                                  // height:14.h,
                                  child: Text(
                                    '20, Mon, 22',
                                    textAlign: TextAlign.center,
                                    style: kManRope_500_14_626A6A,
                                  ),
                                ),
                                Spacer(),
                                //SizedBox(width: 26.w),
                                Expanded(
                                  flex: 3,
                                  //width: 97.w,
                                  // height: 14.h,
                                  child: Text(
                                    'Pankaj Sharma',
                                    textAlign: TextAlign.center,
                                    style: kManRope_500_14_626A6A,
                                  ),
                                ),
                                Spacer(),
                                //SizedBox(width: 26.w),
                                Expanded(
                                  flex: 2,
                                  //width: 65.w,
                                  // height: 14.h,
                                  child: Text(
                                    'AB654151',
                                    textAlign: TextAlign.center,
                                    style: kManRope_500_14_626A6A,
                                  ),
                                ),
                                Spacer(),
                                //SizedBox(width: 40.w),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PEditPrescriptionViewScreen()));
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: 44.h,
                                      width: 44.w,
                                      child: Image.asset(
                                        'assets/images/iconeyelarge.png',
                                        height: 44.h,
                                        width: 44.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          height: 1,
                          width: 1.sw,
                          color: k626A6A.withOpacity(0.2),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return SizedBox(height: 0.h);
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
