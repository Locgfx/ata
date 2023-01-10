import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/prescription_screen/edit_precription_view_screen.dart';

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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: kManRope_400_14_white,
                            ),
                            Text(
                              'Full Name',
                              style: kManRope_400_14_white,
                            ),
                            Text(
                              'Order id',
                              style: kManRope_400_14_white,
                            ),
                            Text(
                              'Prescription',
                              style: kManRope_400_14_white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 581.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.h),
                      child: ListView.separated(
                          // shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '20, Mon, 22',
                                      style: kManRope_400_14_626A6A,
                                    ),
                                    Text(
                                      'Pankaj Sharma',
                                      style: kManRope_400_14_626A6A,
                                    ),
                                    Text(
                                      'AB654151',
                                      style: kManRope_400_14_626A6A,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditPrescriptionViewScreen()));
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/eye.svg',
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Container(
                                  height: 1,
                                  width: 1.sw,
                                  color: k626A6A.withOpacity(0.2),
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 0.h);
                          },
                          itemCount: 10),
                    ),
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
