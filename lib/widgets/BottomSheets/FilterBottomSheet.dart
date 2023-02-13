import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheet();
}

class _FilterBottomSheet extends State<FilterBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 271.h,
      child: Column(
        children: [
          Container(
            height: 71.h,
            decoration: const BoxDecoration(
              color: k006D77,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Center(
              child: Text(
                'Select Below',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            // height: 200.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 0 ? k006D77 : Colors.white,
                      ),
                      child: Center(
                          child: Text(
                            'One Week',
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
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 1 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'One Month',
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
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 2 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'One Year',
                            style: _gIndex == 2
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(height: 8.h),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
