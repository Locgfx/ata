import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UBookingConfirmationScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UTabsScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class UBookingSuccessfulScreen extends StatelessWidget {
  final bool isCancellationAvailable;

  const UBookingSuccessfulScreen(
      {Key? key, required this.isCancellationAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20.h,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 66.w, right: 66.w),
                // height: 558.h,
                // width: 380.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/success.gif',
                      height: 200.h,
                      width: 200.w,
                    ),
                    Text(
                      'Congratulations',
                      style: kManRope_700_24_001314,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    RichText(
                      text: TextSpan(
                        style: kManRope_400_16_626A6A,
                        children: <TextSpan>[
                          TextSpan(text: 'Hi ', style: kManRope_400_16_626A6A),
                          TextSpan(
                              text: 'Pankaj ', style: kManRope_500_16_001314),
                          TextSpan(
                              text: ' your appointment with\n',
                              style: kManRope_400_16_001314),
                          TextSpan(
                              text: 'Priya Singh ',
                              style: kManRope_500_16_001314),
                          TextSpan(
                              text: 'has been created',
                              style: kManRope_400_16_626A6A),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Priya singh',
                          style: kManRope_400_14_006D77,
                        ),
                        Text(
                          'INR 599',
                          style: kManRope_400_14_006D77,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '12/07/2022',
                          style: kManRope_400_14_006D77,
                        ),
                        Text(
                          '1:00 PM',
                          style: kManRope_400_14_006D77,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 112.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 77.h,
              ),
              SizedBox(
                height: 56.h,
                width: 1.sw,
                child: MainButton(
                    onPressed: () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UBookingConfirmationScreen(
                                isCancellationAvailable: true,
                              )));*/
                    },
                    child: Text(
                      'See Appointment',
                      style: kManRope_400_16_white,
                    ),
                    color: k006D77,
                    shape: CustomDecoration().border16Decoration()),
              ),
              // SizedBox(
              //   height: 56.h,
              //   width: 400.h,
              //   child: MaterialButton(
              //     color: k006D77,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10), // <-- Radius
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const BookingSuccessful()));
              //     },
              //     child: Text(
              //       'See Appointment',
              //       style: kManRope_400_16_white,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 56.h,
                width: 1.sw,
                child: MainButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UTabsScreen()));
                    },
                    child: Text(
                      'Home',
                      style: kManRope_400_16_Black,
                    ),
                    color: kEDF6F9,
                    shape: CustomDecoration().outline16ButtonDecoration()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
