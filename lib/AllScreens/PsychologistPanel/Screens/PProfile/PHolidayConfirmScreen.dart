import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/Home/PTabsScreen.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:intl/intl.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class PHolidayConfirmScreen extends StatefulWidget {
  final String start;
  final String end;
  const PHolidayConfirmScreen(
      {Key? key, required this.start, required this.end})
      : super(key: key);

  @override
  State<PHolidayConfirmScreen> createState() => _PHolidayConfirmScreenState();
}

class _PHolidayConfirmScreenState extends State<PHolidayConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        appBarText: 'Holiday Confirmed',
        imgPath: 'assets/images/iconbackappbarlarge.png',
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
                height: 159.h,
                width: 219.w,
              )),
              SizedBox(
                height: 40.h,
              ),
              Center(
                  child: Text(
                'Your profile will not show to user for appointment from ${DateFormat.yMMMMd().format(DateTime.parse(widget.start))} (${DateFormat.jm().format(DateTime.parse(widget.start))}) to ${DateFormat.yMMMMd().format(DateTime.parse(widget.end))} (${DateFormat.jm().format(DateTime.parse(widget.end))}).',
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
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 20.h,
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
              Padding(
                padding: EdgeInsets.only(bottom: 62.h),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (ctx) => PTabsScreen()),
                                (route) => false);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PTabsScreen()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                              bottom: 20.h,
                            ),
                            child: Text(
                              'Go Home',
                              style: kManRope_500_16_006D77,
                            ),
                          ),
                          color: Colors.white,
                          shape:
                              CustomDecoration().outline16ButtonDecoration()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
