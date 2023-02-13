
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 310.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 0;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.white,
                    ),
                    child: Center(
                        child: Text(
                          'Spam',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 1;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 50.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 1 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'False information',
                          style: _gIndex == 1
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 2;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 2 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Harassment or hateful speech',
                          style: _gIndex == 2
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 3;
                    Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 3 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Adult content',
                          style: _gIndex == 3
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 4;
                    Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 4 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Volence or physical harm',
                          style: _gIndex == 4
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 5;
                    Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 5 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Block user',
                          style: _gIndex == 5
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 6;
                    Navigator.of(context).pop();
                    // _reportuserbottomsheet();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 251.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 6 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Block user',
                          style: _gIndex == 6
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}