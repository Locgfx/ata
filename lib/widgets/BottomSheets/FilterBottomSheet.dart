import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function(String) onPop;
  const FilterBottomSheet({Key? key, required this.onPop}) : super(key: key);

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
                      widget.onPop("w");
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                        'One Week',
                        style: kManRope_500_16_626A6A,
                      )),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => setState(() {
                      widget.onPop("m");
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 50.h,
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                        'One Month',
                        style: kManRope_500_16_626A6A,
                      )),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => setState(() {
                      widget.onPop("y");
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                        'One Year',
                        style: kManRope_500_16_626A6A,
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
