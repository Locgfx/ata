import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/BottomSheets/FilterBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import '../../../../constants/fonts.dart';

class PEarningHistoryScreen extends StatefulWidget {
  const PEarningHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PEarningHistoryScreen> createState() => _PEarningHistoryScreenState();
}

class _PEarningHistoryScreenState extends State<PEarningHistoryScreen> {
  void _filterbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => FilterBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomWhiteAppBar(
        appBarText: 'History',
        imgPath: 'assets/images/iconbackappbarlarge.png',
        hasThreeDots: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 56.h,
              width: 1.sw,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: k5A72ED.withOpacity(0.24)),
              ),
              child: TextField(
                style: kManRope_500_16_626A6A,
                decoration: TextfieldDecoration(
                    label: 'Search Transaction No',
                    child: Image.asset(
                      "assets/images/searchicon.png",
                      height: 16,
                      width: 16,
                    )).searchFieldDecoration(),
              ),
            ),
          ),
          SizedBox(
            height: 37.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: SizedBox(
              height: 32.h,
              width: 380.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: kManRope_500_18_001314,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _filterbottomsheet();
                    },
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/iconfilter.png',
                        height: 32.h,
                        width: 32.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Container(
            height: 40.h,
            width: 1.sw,
            color: kEDF6F9,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 69.w,
                    // height: 14.h,
                    child: Text(
                      'Date',
                      style: kManRope_500_14_263238,
                    ),
                  ),
                  SizedBox(
                    width: 78.w,
                  ),
                  SizedBox(
                    width: 104.w,
                    // height: 16.h,
                    child: Text(
                      'Transaction No',
                      style: kManRope_500_14_263238,
                    ),
                  ),
                  SizedBox(
                    width: 74.w,
                  ),
                  SizedBox(
                    width: 53.w,
                    // height: 16.h,
                    child: Text(
                      'Amount',
                      style: kManRope_500_14_263238,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: ListView.separated(
                // shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 69.w,
                              // height: 14.h,
                              child: Text(
                                '09.12.2022',
                                style: kManRope_400_14_626A6A,
                              ),
                            ),
                            SizedBox(
                              width: 78.w,
                            ),
                            SizedBox(
                              width: 100.w,
                              // height: 16.h,
                              child: Text(
                                '123456789',
                                style: kManRope_400_16_626A6A,
                              ),
                            ),
                            SizedBox(
                              width: 78.w,
                            ),
                            SizedBox(
                              width: 53.w,
                              // height: 16.h,
                              child: Text(
                                '500',
                                style: kManRope_400_16_626A6A,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return SizedBox(height: 29.h);
                  },
                  itemCount: 20),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
