import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/chatmessage.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: 'FAQs',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          // clipBehavior: Clip.hardEdge,
          height: 136.h,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              Text(
                'Still stuck? Help is a mail away',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 56.h,
                width: 1.sw,
                child: MaterialButton(
                  elevation: 0,
                  color: k006D77,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: k006D77),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatMessages()),
                    );
                  },
                  child: Text(
                    'Send a message',
                    style: kManRope_400_16_white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'We are here to help you with anything and everything on AtarAxis',
                style: kManRope_700_20_001314,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'At AtarAxis everything we expert at a day’s start is you, better and happier than yesterday. We have got you covered. Share your concern or check our frequently asked question listed below.',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 56.h,
                width: 380.w,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for help',
                    hintStyle: kManRope_400_14_626A6A,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0)),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIconConstraints:
                        BoxConstraints(maxHeight: 55.h, maxWidth: 55.w),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Container(
                          height: 48,
                          width: 48,
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/images/searchiconlarge.png',
                            height: 48.h,
                            width: 48.w,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 48.h,
                width: 380.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is carebal ?',
                      style: kManRope_500_16_001314,
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/icondownlarge.png',
                        height: 48.h,
                        width: 48.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'At carebral everything we expert at a day’s start is you, better and happier than yesterday. We have got you covered. Share your concern or check our frequently asked question listed below.',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                width: 380.w,
                color: kD9D9D9,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 48.h,
                width: 380.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is carebal ?',
                      style: kManRope_500_16_001314,
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/icondownlarge.png',
                        height: 48.h,
                        width: 48.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                width: 380.w,
                color: kD9D9D9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
