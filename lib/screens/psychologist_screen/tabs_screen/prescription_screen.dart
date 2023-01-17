import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/prescription_screen/edit_precription_view_screen.dart';
import 'package:greymatter/screens/psychologist_screen/prescription_screen/precription_view_screen.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20,
        backgroundColor: kWhiteBGColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: k5A72ED.withOpacity(0.25),
                            width: 1,
                          )),
                      child: TextField(
                        decoration: TextfieldDecoration(
                                label: 'Search by Transaction No',
                                child:
                                    Image.asset("assets/images/searchicon.png"))
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
                            SizedBox(
                              // height: 1.sh,
                              width: 76.w,
                              child: Text(
                                'Date',
                                style: kManRope_400_14_white,
                              ),
                            ),
                            SizedBox(width: 26.w,),
                            // SizedBox(width: 70.w,),
                            SizedBox(
                              width: 97.w,
                              // height: 14.h,
                              child: Text(
                                'Full Name',
                                style: kManRope_400_14_white,
                              ),
                            ),
                            SizedBox(width: 26.w,),
                            // SizedBox(width: 59.w,),
                            SizedBox(
                              width: 120.w,
                              // height: 14.h,
                              child: Text(
                                'Transaction NO',
                                style: kManRope_400_14_white,
                              ),
                            ),
                            // SizedBox(width:26.w,),
                            //
                            // // SizedBox(width: 22.w,),
                            // Text(
                            //   'Prescription',
                            //   style: kManRope_400_14_white,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    // height: 581.h,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Padding(
                                padding:EdgeInsets.only(left: 24.w,right:40.w ),
                                child: SizedBox(
                                  height:44.h,
                                  width:358.w,
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 76.w,
                                        // height:14.h,
                                        child: Text(
                                          '20, Mon, 22',
                                          style: kManRope_500_14_626A6A,
                                        ),
                                      ),
                                      SizedBox(width: 26.w,),
                                      SizedBox(
                                        width: 97.w,
                                        // height: 14.h,
                                        child: Text(
                                          'Pankaj Sharma',
                                          style: kManRope_500_14_626A6A,
                                        ),
                                      ),
                                      SizedBox(width: 26.w,),
                                      SizedBox(
                                        width: 65.w,
                                        // height: 14.h,
                                        child: Text(
                                          'AB654151',
                                          style: kManRope_500_14_626A6A,
                                        ),
                                      ),
                                      SizedBox(width: 26.w,),
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditPrescriptionViewScreen()));
                                        },
                                        child: Container(
                                          // color: Colors.red,
                                          height:40.h,
                                          width:40.w,
                                          child: Image.asset(
                                            'assets/images/iconeyelarge.png',
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                height: 1,
                                width: 1.sw,
                                color: k626A6A.withOpacity(0.2),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return SizedBox(height: 0.h);
                        },
                        itemCount: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
