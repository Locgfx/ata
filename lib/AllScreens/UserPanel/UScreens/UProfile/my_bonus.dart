import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/colors.dart';

class MyBonusScreen extends StatelessWidget {
  const MyBonusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
          appBarText: "My Bonus",
          imgPath: "assets/images/iconbackappbar2.png",
          hasThreeDots: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 32),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 2, color: kFFFFFF)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/iconrevenue.png",
                              height: 48,
                              width: 48,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Revenue",
                              style: kManRope_500_16_263238,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: 143,
                          color: Colors.white,
                        ),
                        Text(
                          "₹4391",
                          style: kManRope_700_36_36B3BF,
                        ),
                        Text(
                          "Last Month: ₹1239",
                          style: kManRope_400_16_263238,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/iconrefer.png",
                              height: 48,
                              width: 48,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Refer",
                              style: kManRope_500_16_263238,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: 143,
                          color: Colors.white,
                        ),
                        Text(
                          "₹405",
                          style: kManRope_700_36_36B3BF,
                        ),
                        Text(
                          "Last Month: ₹239",
                          style: kManRope_400_16_263238,
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 38,
                        width: 38,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "KK",
                            style: kManRope_500_14_white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "Kishore Kumar",
                          style: kManRope_400_14_626A62,
                        )),
                    SizedBox(width: 14),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Welcome30",
                        style: kManRope_400_14_626A62,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "05-10-2023",
                          style: kManRope_400_14_626A62,
                        )),
                    Expanded(
                        child: Text(
                      "120",
                      style: kManRope_400_14_626A62,
                    ))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
