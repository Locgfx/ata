import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class UDeleteAccountScreen extends StatefulWidget {
  const UDeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<UDeleteAccountScreen> createState() => _UDeleteAccountScreenState();
}

class _UDeleteAccountScreenState extends State<UDeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      resizeToAvoidBottomInset: true,
      appBar: CuswhiteAppBar(
        imgPath: 'assets/images/iconbackappbarlarge.png',
        appBarText: 'Delete Account',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Email ",
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "priyasingh344@gmail.com",
                style: kManRope_400_16_Black,
              ),
              SizedBox(height: 40.h),
              Text(
                "Password  ",
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your password",
                    hintStyle: kManRope_400_16_001314
                ),
              ),
              // TextField(decoration: TextfieldDecoration(label: 'Priyasingh344@1234',hintstyle: kManRope_400_16_Black,).blankfieldDecoration(),),
              // Text(
              //   "Priyasingh344@1234",
              //   style: kManRope_400_16_Black,
              // ),
              SizedBox(
                height: 140.h,
              ),
              Text(
                "When you delete your account, all the user generated content is normally erased (although there are small exceptions), while all the log data is preserved – forever”. The preserved log data won't have your name attached to it,",
                style: kManRope_400_14_626A6A,
              ),
              SizedBox(height: 136.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      child: MainButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => PTabsScreen()));
                          },
                          child: Text(
                            "Cancel",
                            style: kManRope_500_16_Black,
                          ),
                          color: kWhiteBGColor,
                          shape: CustomDecoration().button16Decoration()),
                    ),
                  ),
                  // SizedBox(width: 16.w,),
                  Expanded(
                    child: Container(
                      // height: 48,
                      child: MainButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => PTabsScreen()));
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 16.h),
                            child: Text(
                              "Delete Account",
                              style: kManRope_500_16_white,
                            ),
                          ),
                          color: kB64C4C,
                          shape: CustomDecoration().button16Decoration()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
