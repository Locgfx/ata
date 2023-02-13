import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PSuccessfulSessionScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets/HistoryFilterBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class PJoiningScreen extends StatefulWidget {
  const PJoiningScreen({Key? key}) : super(key: key);

  @override
  State<PJoiningScreen> createState() => _PJoiningScreenState();
}

class _PJoiningScreenState extends State<PJoiningScreen> {
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
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        appBarText: '',
        imgPath: "assets/images/iconbackappbarlarge.png",
        hasThreeDots: true,
        onThreeDotTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              context: context,
              builder: (context) => HistoryFilterBottomSheet());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Container(
                  height: 133.h,
                  width: 135.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage("assets/images/Rectangle 26.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Priya Singh",
                style: kManRope_400_16_1314,
              ),
              SizedBox(height: 40.h),
              SizedBox(
                // height: 408.h,
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
                child: MainButton(
                  shape: CustomDecoration().smallButton10Decoration(),
                  color: k66898D,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => PSuccessfulSessionScreen()));
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
