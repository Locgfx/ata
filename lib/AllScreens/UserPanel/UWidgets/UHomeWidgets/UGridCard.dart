import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class GridCard extends StatelessWidget {
  final int index;
  GridCard({Key? key, required this.index}) : super(key: key);

  final List<String> _imgList = [
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
  ];
  final List<String> _titleList = [
    'Anxiety',
    'Stress',
    'Addiction',
    'Anger',
    'Loneliness',
    'Stress',
    'Grief',
    'OCD',
    'Loneliness',
    'Addiction',
    'Anger',
    'Stress',
    'Grief',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      height: 118.h,
      // color: Colors.red,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 84.h,
            width: 84.w,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(_imgList[index],),fit: BoxFit.cover,
              // ),
                color: kFFFFFF.withOpacity(0.40),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: kFFFFFF, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                _imgList[index],
                height: 62.h,
                width: 58.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            _titleList[index],
            style: kManRope_400_16_626A6A,
          ),
        ],
      ),
    );
  }
}