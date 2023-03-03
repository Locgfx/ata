import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets/ReportBottomSheet.dart';

class PostBottomSheet extends StatefulWidget {
  const PostBottomSheet({Key? key}) : super(key: key);

  @override
  State<PostBottomSheet> createState() => _PostBottomSheet();
}

class _PostBottomSheet extends State<PostBottomSheet> {
  void _reportbottomsheet() {
    /*showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => ReportBottomSheet());*/
  }

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
          Column(
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
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 0 ? k006D77 : Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    'Share',
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
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Save',
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
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 2 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Hide',
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
                  _reportbottomsheet();
                }),
                child: Container(
                  height: 44.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 3 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                    'Report',
                    style: _gIndex == 3
                        ? kManRope_500_16_white
                        : kManRope_500_16_626A6A,
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
