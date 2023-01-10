import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CuswhiteAppBar(
        imgPath: 'assets/images/Vector 175.png',
        appBarText: 'Delete Account',
      ),
      body: Padding(
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
            Text(
              "Priyasingh344@1234",
              style: kManRope_400_16_Black,
            ),
            SizedBox(
              height: 140.h,
            ),
            Text(
              "When you delete your account, all the user generated content is normally erased (although there are small exceptions), while all the log data is preserved – forever”. The preserved log data won't have your name attached to it,",
              style: kManRope_400_14_626A6A,
            ),
            SizedBox(height: 136.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16.0, left: 33.5, bottom: 16, right: 33.5),
                      child: Text(
                        "Cancel",
                        style: kManRope_500_16_001314,
                      ),
                    ),
                  ),
                  MainButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 16.0, left: 30.w, bottom: 16, right: 30.w),
                        child: Text(
                          "Delete Account",
                          style: kManRope_500_16_white,
                        ),
                      ),
                      color: kB64C4C,
                      shape: CustomDecoration().button16Decoration()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
