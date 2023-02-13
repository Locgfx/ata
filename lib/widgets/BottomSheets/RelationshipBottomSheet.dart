import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class RelationStatusBottomSheet extends StatefulWidget {
  const RelationStatusBottomSheet({Key? key}) : super(key: key);

  @override
  State<RelationStatusBottomSheet> createState() =>
      _RelationStatusBottomSheet();
}

class _RelationStatusBottomSheet extends State<RelationStatusBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                'Relationship Status',
                style: kManRope_700_20_white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  _gIndex = 0;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 0 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                        'Single',
                        style: _gIndex == 0
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _gIndex = 1;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                        'Married',
                        style: _gIndex == 1
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _gIndex = 2;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 123.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 2 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                        'Other',
                        style: _gIndex == 2
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
