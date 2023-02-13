import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PPanVerifiedScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class PKycConfirmName extends StatefulWidget {
  const PKycConfirmName({Key? key}) : super(key: key);

  @override
  State<PKycConfirmName> createState() => _PKycConfirmNameState();
}

class _PKycConfirmNameState extends State<PKycConfirmName> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setPage();
    });
    //setPage();
  }

  setPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PPANVerified()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 50,
                    ),
                    SizedBox(height: 85.h),
                    Text(
                      'Verifying your PAN Number, don\'t press back button or close the application.',
                      style: kManRope_500_20_001314,
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      'ABSHDW4678942',
                      style: kManRope_500_14_006D77,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
