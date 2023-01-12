import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/home_screens/SuccefulSessionScreen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class JoiningScreen extends StatefulWidget {
  const JoiningScreen({Key? key}) : super(key: key);

  @override
  State<JoiningScreen> createState() => _JoiningScreenState();
}

class _JoiningScreenState extends State<JoiningScreen> {
  var title = [
    "Issue",
    "Date of birth",
    "Gender",
    "Relationship status",
    "Occuption",
    "Date",
    "Slot",
  ];
  var desc = [
    "Loneliness",
    "25/ 02/1993",
    "Female",
    "Single",
    "Student",
    "Wed, 12/07/2022",
    "1:00 PM",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(left: 110.w, right: 110.w, bottom: 20.h),
      //   child: MaterialButton(
      //     color: k66898D,
      //     onPressed: () {
      //       Navigator.of(context).push(
      //           MaterialPageRoute(builder: (ctx) => SuccesfulSesionScreen()));
      //     },
      //     child: Padding(
      //       padding: EdgeInsets.only(
      //           left: 46.w, right: 46.w, top: 19.h, bottom: 19.h),
      //       child: Text(
      //         "Join meeting ",
      //         style: kManRope_400_16_white,
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: kWhiteBGColor,
      appBar: DotappBar(imgPath: "assets/images/Frame 48.png"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Container(
                  height: 133.h,
                  width: 136.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Rectangle 26.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Priya Singh",
                style: kManRope_400_16_1314,
              ),
              SizedBox(height: 40.h),
              SizedBox(
                height: 408.h,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  separatorBuilder: (ctx, index) {
                    return SizedBox(height: 40.h);
                  },
                  itemCount: title.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[index],
                          style: kManRope_400_16_626A6A,
                        ),
                        Text(
                          desc[index],
                          style: kManRope_400_16_001314,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 75.h),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: MaterialButton(
                  shape: CustomDecoration().smallButton10Decoration(),
                  color: k66898D,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => SuccesfulSesionScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 42.w, right: 46.w, top: 19.h, bottom: 19.h),
                    child: Text(
                      "Join meeting ",
                      style: kManRope_400_16_white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
