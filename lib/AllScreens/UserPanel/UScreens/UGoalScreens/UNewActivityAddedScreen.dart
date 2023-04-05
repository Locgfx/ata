import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class UNewActivityAddedScreen extends StatefulWidget {
  const UNewActivityAddedScreen({Key? key}) : super(key: key);

  @override
  State<UNewActivityAddedScreen> createState() =>
      _UNewActivityAddedScreenState();
}

class _UNewActivityAddedScreenState extends State<UNewActivityAddedScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      int count = 0;
      Navigator.of(context).popUntil((_) => count++ >= 3);
    });
    super.initState();
  }

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
