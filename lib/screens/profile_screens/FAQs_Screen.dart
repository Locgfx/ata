import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/PsychologistPanel/Screens/Profile/chatmessage.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        imgPath: 'assets/images/iconbackappbarlarge.png',
        appBarText: 'FAQs',
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: false,
      //   leadingWidth: 40.w,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'FAQs',
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
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'We are here to help you with anything and everything on carebral',
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
                  decoration: TextfieldDecoration(
                          label: "Search for help",
                          child: Image.asset("assets/images/searchicon.png"))
                      .searchFieldDecoration(),
                ),
              ),
              // SizedBox(
              //   height: 56.h,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Search for help',
              //       hintStyle: kManRope_400_14_626A6A,
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(16.0)),
              //       fillColor: Colors.white,
              //       filled: true,
              //       suffixIconConstraints:
              //           BoxConstraints(maxHeight: 24.h, maxWidth: 24.w),
              //       suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is AtarAxis ?',
                      style: kManRope_500_16_001314,
                    ),
                    Image.asset(
                      'assets/images/icondropdown.png',
                      height: 48.h,
                      width: 48.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'At AtarAxis everything we expert at a day’s start is you, better and happier than yesterday. We have got you covered. Share your concern or check our frequently asked question listed below.',
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
              SizedBox(height: 20.h,),
              SizedBox(
                height: 48.h,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is AtarAxis ?',
                      style: kManRope_500_16_001314,
                    ),
                    Image.asset(
                      'assets/images/icondropdown.png',
                      height: 48.h,
                      width: 48.w,
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
              SizedBox(
                height: 84.h,
              ),
              Text(
                'Still stuck? Help is a mail away',
                style: kManRope_500_16_001314,
              ),
              SizedBox(
                height: 16.h,
              ),
              // SizedBox(
              //   height: 56.h,
              //   width: 380.w,
              //   child: MaterialButton(
              //     elevation: 0,
              //     color: k006D77,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(16),
              //       side: const BorderSide(color: k006D77),
              //     ),
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => const ChatSupportScreen()));
              //     },
              //     child: Text(
              //       'Send a message',
              //       style: kManRope_400_16_white,
              //     ),
              //   ),
              // // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'What is AtarAxis ?',
              //       style: kManRope_500_16_001314,
              //     ),
              //     SvgPicture.asset(
              //       'assets/icons/downArrow.svg',
              //       height: 24.h,
              //       width: 24.w,
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                        // padding: EdgeInset,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChatMessages()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: Text(
                            'Send a message',
                            style: kManRope_400_16_white,
                          ),
                        ),
                        color: k006D77,
                        shape: CustomDecoration().button16Decoration()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
