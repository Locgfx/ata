import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/tabs_screen/prescription_screen.dart';
import 'package:greymatter/screens/psychologist_screen/tabs_screen/psychologist_home_screen.dart';
import 'package:greymatter/widgets/buttons.dart';

class SuccesfulSesionScreen extends StatefulWidget {
  const SuccesfulSesionScreen({Key? key}) : super(key: key);

  @override
  State<SuccesfulSesionScreen> createState() => _SuccesfulSesionScreenState();
}

class _SuccesfulSesionScreenState extends State<SuccesfulSesionScreen> {
  var title = [
    "session type",
    "Issue",
    "Price",
  ];
  var description = ["Video", "Stress", "INR 399"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  "Session successful",
                  style: kManRope_500_16_001314,
                ),
              ),
              SizedBox(height: 24.h),
              Image.asset(
                'assets/images/animation_500_lcohiagq.gif',
                height: 183.h,
                width: 186.w,
              ),
              SizedBox(height: 100.h),
              SizedBox(
                height: 217.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: kManRope_400_16_626A6A,
                        ),
                        Column(
                          children: [
                            Text(
                              "10, June, 2022",
                              style: kManRope_400_16_001314,
                            ),
                            Text(
                              "8:00AM-9:00AM",
                              style: kManRope_400_12_626A6A,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 33.h),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      separatorBuilder: (ctx, index) {
                        return SizedBox(height: 16.h);
                      },
                      itemCount: title.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  title[index],
                                  style: kManRope_400_16_626A6A,
                                ),
                                Text(
                                  description[index],
                                  style: kManRope_400_16_001314,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 53),
              Padding(
                padding: const EdgeInsets.only(bottom: 130.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        shape: CustomDecoration().border10Decoration(),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => PsychologistHomeScreen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: Text(
                            "Go to Home",
                            style: kManRope_500_16_006D77,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: MainButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrescriptionScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/eyeicon.png",
                              height: 15,
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              "Prescription",
                              style: kManRope_500_16_white,
                            ),
                          ],
                        ),
                      ),
                      color: k006D77,
                      shape: CustomDecoration().border10Decoration(),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
