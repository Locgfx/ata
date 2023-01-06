import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/profile_screens/order_history_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../tabs_screen/psychologist_home_screen.dart';

class HolidayConfirmScreen extends StatefulWidget {
  const HolidayConfirmScreen({Key? key}) : super(key: key);

  @override
  State<HolidayConfirmScreen> createState() => _HolidayConfirmScreenState();
}

class _HolidayConfirmScreenState extends State<HolidayConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusAppBar(
        appBarText: 'Slots Availability',
        imgPath: 'assets/images/Vector 175.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 206.h,
              ),
              Center(
                  child: Image.asset(
                'assets/images/success.gif',
                height: 160.h,
                width: 215.w,
              )),
              SizedBox(
                height: 40.h,
              ),
              Center(
                  child: Text(
                'Your profile will not show to user for appintment from mon,10,2022 (1:00 am) to fri, 16, 2022(2:00 pm)till.',
                style: kManRope_400_16_001314,
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 129.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderHistoryScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                          ),
                          child: Text(
                            'Edit',
                            style: kManRope_500_16_white,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().buttonDecoration()),
                  ),
                ],
              ),
              // CustomActiveTextButton(onPressed: () {}, text: 'Edit'),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PsychologistHomeScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                          ),
                          child: Text(
                            'Go Home',
                            style: kManRope_500_16_006D77,
                          ),
                        ),
                        color: Colors.white,
                        shape: CustomDecoration().outline16ButtonDecoration()),
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
