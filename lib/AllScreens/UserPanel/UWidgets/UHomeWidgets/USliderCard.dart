import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/fonts.dart';

class USliderCard extends StatefulWidget {
  final int index;

  USliderCard({Key? key, required this.index}) : super(key: key);

  @override
  State<USliderCard> createState() => _USliderCardState();
}

class _USliderCardState extends State<USliderCard> {
  List<String> _bgImageList = [
    'assets/images/sliderbg1.png',
    'assets/images/sliderbg2.png',
    'assets/images/sliderbg3.png',
  ];

  List<String> _charImageList = [
    'assets/images/sliderchar1.png',
    'assets/images/sliderchar2.png',
    'assets/images/sliderchar3.png',
  ];

  @override
  Widget build(BuildContext context) {
    //print(index);
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_bgImageList[widget.index]),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Upto',
                    style:
                    widget.index == 1 ? kManRope_400_14_white : kManRope_400_14_626A6A,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '40% OFF',
                    style:
                    widget.index == 1 ? kManRope_700_24_white : kManRope_700_24_001314,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'on your first instant booking',
                    style:
                    widget.index == 1 ? kManRope_400_14_white : kManRope_400_14_626A6A,
                  ),
                  SizedBox(height: 10),
                  DottedBorder(
                    child: Text(
                      'WELCOME30',
                      style: kManRope_500_16_white,
                    ),
                    radius: const Radius.circular(16),
                    padding: const EdgeInsets.all(16),
                    borderType: BorderType.RRect,
                  )
                ],
              )),
          Expanded(
            child: Image.asset(
              _charImageList[widget.index],
              width: 95.w,
              height: 115.h,
            ),
          ),
        ],
      ),
    );
  }
}
