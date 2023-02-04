import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/tabs_screen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';

class RequestSentSuccessfulScreen extends StatefulWidget {
  const RequestSentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<RequestSentSuccessfulScreen> createState() =>
      _RequestSentSuccessfulScreenState();
}

class _RequestSentSuccessfulScreenState
    extends State<RequestSentSuccessfulScreen> {
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
        .push(MaterialPageRoute(builder: (context) => PTabsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 78.h,
            ),
            Container(
              height: 848.h,
              width: 1.sw,
              decoration: CustomDecoration().topCircularRadius(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Image.asset(
                    'assets/images/successfully-completed.png',
                    height: 202.h,
                    width: 288.sw,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text(
                    'Request sent successful',
                    style: kManRope_500_24_006D77,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Hey pankaj your request has been sent to our partner he will contact you within 24 hrs.once our partner will verify you your account will enable for appointment.',
                      style: kManRope_400_14_626A6A,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'AtarAxis partner',
                    style: kManRope_500_24_001314,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Our AtarAxis partner will not charged you for any work',
                    style: kManRope_400_14_626A6A,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 88.h,
                        width: 88.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: CustomDecoration().containerDecoration(),
                        child: Image.asset('assets/images/userP.png',
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Priyanka singh',
                            style: kManRope_500_16_001314,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '9810745330',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text('10 June 2022', style: kManRope_400_14_626A6A),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}