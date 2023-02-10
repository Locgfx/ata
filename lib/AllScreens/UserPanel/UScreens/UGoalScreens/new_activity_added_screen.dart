import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class NewActivityAddedScreen extends StatelessWidget {
  const NewActivityAddedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40.h,
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/check-circle.png',
              height: 108.h,
              width: 108.w,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'New activity added',
              style: kManRope_400_14_001314,
            ),
          ],
        ),
      ),
    );
  }
}
