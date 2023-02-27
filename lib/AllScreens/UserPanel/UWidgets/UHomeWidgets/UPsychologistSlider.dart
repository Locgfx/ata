import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/fonts.dart';
// import 'package:greymatter/screens/UserPanel/UWidgets/Uwidgets.dart';

class PsychologistSlider extends StatelessWidget {
  PsychologistSlider({
    Key? key,
  }) : super(key: key);

  List<String> images = [
    'assets/images/userP.png',
    'assets/images/userpic2.png',
    'assets/images/userpic3.png',
    'assets/images/userpic4.png',
  ];
  List<String> rating = [
    '4.0',
    '4.0',
    '4.0',
    '4.0',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 5),
        shrinkWrap: true,
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (ctx, index) {
          return Container(
            height: 83.h,
            // width: 2.w,
            child: Center(
              child: Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 81.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage("assets/images/userP.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Raghuram Singh ddhsdgh",
                        style: kManRope_400_16_001314,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "psychologist",
                        style: kManRope_400_14_626A6A,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      //StarWidget()
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
