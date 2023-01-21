import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UBottomsheet.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/decorations.dart';
// import 'package:greymatter/screens/UserPanel/UWidgets/UBottomsheet.dart';
// import 'package:greymatter/screens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/screens/explore_screens/cancel_booking_screen.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  void _selectGender() {
    showModalBottomSheet(
        backgroundColor: kFFFFFF,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => const GenderBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: DotappBar(imgPath: 'assets/images/3doticonlarge.png', onTap: () {  _selectGender(); },),
      // appBar: AppBar(
      //   elevation: 0,
      //   leadingWidth: 40.w,
      //   backgroundColor: Colors.white,
      //   centerTitle: false,
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
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         _selectGender();
      //       },
      //       child: SvgPicture.asset(
      //         'assets/icons/kebabMenu.svg',
      //         height: 30.h,
      //         width: 14.w,
      //       ),
      //     ),
      //     SizedBox(
      //       width: 18.w,
      //     ),
      //   ],
      // ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w, bottom: 35.h),
        child: SizedBox(
          child: ListView(
            children: [
              Text('Selected Psychologists', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/userP.png',
                      fit: BoxFit.cover,
                      height: 133.h,
                      width: 135.w,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 98,
                          child: Text(
                            'Priya Singh',
                            overflow: TextOverflow.ellipsis,
                            style: kManRope_500_16_001314,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'psychologist',
                          style: kManRope_400_14_626A6A,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        StarWidget()

                      ],
                    ),
                  ),

                  SvgPicture.asset(
                    'assets/icons/sarrow.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
              SizedBox(
                height: 44.h,
              ),
              Text('Selected issue', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Loneliness',
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text('Selected Date', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Wed, 12/07/2022',
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text('Selected Slot', style: kManRope_700_16_001314),
              SizedBox(
                height: 24.h,
              ),
              Text(
                '1:00 PM',
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 77.h,
              ),
              // Row(mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     MainButton(
              //         onPressed: () {},
              //         child: Padding(
              //           padding:  EdgeInsets.only(top:19.h,bottom: 19.h,left: 42.w,right: 42.w),
              //           child: Text("Join meeting",style: kManRope_400_16_white,),
              //         ),
              //         color: k66898D,
              //         shape: CustomDecoration().button08Decoration()),
              //   ],
              // )
              // SizedBox(
              //   height: 56.h,
              //   width: 183.w,
              //   child: MaterialButton(
              //     color: k006D77,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10), // <-- Radius
              //     ),
              //     onPressed: () {},
              //     child: Text(
              //       'Join meeting',
              //       style: kManRope_400_16_white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(left: 123.w,right: 123.w,bottom: 35.h),
        child: MainButton(
            onPressed: () {},
            child: Padding(
              padding:  EdgeInsets.only(top:19.h,bottom: 19.h,),
              child: Text("Join meeting",style: kManRope_400_16_white,),
            ),
            color: k66898D,
            shape: CustomDecoration().button08Decoration()),
      ),
    );
  }
}

