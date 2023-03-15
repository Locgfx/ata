import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/USessionSucessfulScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets/HistoryFilterBottomSheet.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class UJoiningMeetingDetailsScreen extends StatefulWidget {
  const UJoiningMeetingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UJoiningMeetingDetailsScreen> createState() =>
      _UJoiningMeetingDetailsScreenState();
}

class _UJoiningMeetingDetailsScreenState
    extends State<UJoiningMeetingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: true,
        appBarText: '',
        imgPath: 'assets/images/iconbackappbar2.png',
        onThreeDotTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              context: context,
              builder: (context) => HistoryFilterBottomSheet());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selected Counsellorss",
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 133.h,
                        width: 133.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        child: Image.asset(
                          'assets/images/userP.png',
                          height: 135.h,
                          width: 133.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Priya Singh',
                            style: kManRope_400_16_001314,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Counsellorss',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          //StarWidget()
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/Frame 8498.svg',
                    width: 48.w,
                    height: 48.h,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Selected issue",
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Loneliness",
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Selected Date",
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Wed, 12/07/2022",
                style: kManRope_500_16_006D77,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Selected Slot",
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "1:00 PM",
                style: kManRope_500_16_006D77,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 122.w, right: 122.w, bottom: 35.h),
        child: SizedBox(
          height: 56.h,
          child: MainButton(
            shape: CustomDecoration().button08Decoration(),
            color: k66898D,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => USessionSuccessfulScreen()));
            },
            child: Text(
              "Join meeting",
              style: kManRope_400_16_white,
            ),
          ),
        ),
      ),
    );
  }
}
