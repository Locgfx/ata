import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/session_successful_screen.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class BookingSuccessful extends StatefulWidget {
  const BookingSuccessful({Key? key}) : super(key: key);

  @override
  State<BookingSuccessful> createState() => _BookingSuccessfulState();
}

class _BookingSuccessfulState extends State<BookingSuccessful> {
  String text1 = 'Connecting with Priya singh';
  String text3 = 'Connected to Priya singh';
  String text4 = 'please join the meeting';
  bool _flag = true;
  Timer? _timer;
  static const maxSeconds = 60;
  int _start = maxSeconds;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          if (_start == 0) {
            _timer?.cancel();
            _flag = false;
          } else {
            _start--;
          }
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(left: 123.w,right: 123.w,bottom: 40.h),
        child: SizedBox(
          height: 56.h,
          // width: 183.w,
          child: MainButton(onPressed: () {
            // if (!_flag) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SessionSuccessful()));
            // }


          },
              child: Text(
                'Join Meeting',
                style: kManRope_400_16_white,
              ),
              color: k006D77,
              shape: CustomDecoration().button08Decoration(),),
        ),
      ),
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(appBarText: 'Confirm your booking', imgPath: 'assets/images/iconbackappbar2.png',),
      // appBar: AppBar(
      //   elevation: 0,
      //   leadingWidth: 40.w,
      //   centerTitle: false,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Confirm your booking',
      //     style: kManRope_500_16_006D77,
      //   ),
      //   titleSpacing: 18.w,
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Padding(
      //       padding: EdgeInsets.all(20.0),
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //         size: 20,
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 96.h, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80.h,
                // width: 380.w,
                decoration: CustomDecoration().outlineC7C7C7DDecoration(),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.red,
                        child: Image.asset(
                          'assets/images/iconcircletick24.png',
                          height: 48.h,
                          width: 48.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Booking successful',
                        style: kManRope_500_16_001314,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 99.h,
              ),
              Text(
                _flag ? text1 : text3,
                style: kManRope_500_20_001314,
              ),
              SizedBox(height: 12.h),
              Text(
                _flag ? 'please wait $_start sec' : text4,
                style: kManRope_500_16_626A6A,
              ),
              SizedBox(
                height: 88.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/userP.png',
                          height: 83.h,
                          width: 83.w,fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              'Priya Singh',
                              style: kManRope_400_16_001314,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'MA in Counselling Psychology',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          StarWidget(),
                          // Row(
                          //   children: [
                          //     Image.asset(
                          //       'assets/images/Star 1.png',
                          //       width: 20.w,
                          //       height: 20.h,
                          //     ),
                          //     SizedBox(
                          //       width: 4,
                          //     ),
                          //     Text(
                          //       '4.0',
                          //       style: kManRope_400_12_001314,
                          //     ),
                          //     SizedBox(
                          //       width: 4,
                          //     ),
                          //     Text(
                          //       '.',
                          //       style: kManRope_400_12_001314,
                          //     ),
                          //     SizedBox(
                          //       width:4.w,
                          //     ),
                          //     Text(
                          //       '12 Yrs. Exp',
                          //       style: kManRope_400_12_001314,
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ],
                  ),

                  // SizedBox(
                  //   width: 72.w,
                  // ),
                  Image.asset(
                    'assets/images/iconcirclearrow48.png',
                    width: 48.w,
                    height: 48.h,
                  ),
                ],
              ),
              SizedBox(
                height: 233.h,
              ),
              // SizedBox(
              //   height: 56.h,
              //   width: 183.w,
              //   child: MaterialButton(
              //     color: k006D77,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10), // <-- Radius
              //     ),
              //     onPressed: () {
              //       if (!_flag) {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const SessionSuccessful()));
              //       }
              //     },
              //     child: Text(
              //       'Join Meeting',
              //       style: kManRope_400_16_white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
