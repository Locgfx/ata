import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class HistoryFilterBottomSheet extends StatefulWidget {
  const HistoryFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<HistoryFilterBottomSheet> createState() => _HistoryFilterBottomSheet();
}

class _HistoryFilterBottomSheet extends State<HistoryFilterBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 170.h,
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
                'Cancel Meeting',
                style: kManRope_700_16_white,
              ),
            ),
          ),
          Container(
            // height: 120.h,
            padding: EdgeInsets.only(top: 20.h),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = 0;
                    Navigator.of(context).pop();
                  }),
                  child: Container(
                    height: 44.h,
                    width: 215.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == 0 ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                          'Cancel Meeting',
                          style: _gIndex == 0
                              ? kManRope_500_16_white
                              : kManRope_500_16_626A6A,
                        )),
                  ),
                ),

                SizedBox(height: 20.h),

              ],
            ),
          ),
        ],
      ),
    );
  }
}