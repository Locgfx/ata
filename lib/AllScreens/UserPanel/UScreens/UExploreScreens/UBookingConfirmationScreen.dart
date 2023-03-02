import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../widgets/BottomSheets/CancelBookingBottomSheet.dart';

class UBookingConfirmationScreen extends StatefulWidget {
  final bool isCancellationAvailable;
  const UBookingConfirmationScreen({
    Key? key,
    required this.isCancellationAvailable,
  }) : super(key: key);

  @override
  State<UBookingConfirmationScreen> createState() =>
      _UBookingConfirmationScreenState();
}

class _UBookingConfirmationScreenState
    extends State<UBookingConfirmationScreen> {
  void _selectGender() {
    showModalBottomSheet(
        backgroundColor: kFFFFFF,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) => const CancelBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: widget.isCancellationAvailable ? true : false,
        onThreeDotTap: () {
          _selectGender();
        },
        appBarText: '',
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w, bottom: 35.h),
        child: SizedBox(
          child: ListView(
            children: [
              Text('Selected Counselors', style: kManRope_700_16_001314),
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
                      height: 135.w,
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
                          'Counselors',
                          style: kManRope_400_14_626A6A,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        //StarWidget()
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UDoctorProfileScreen()));*/
                    },
                    child: SvgPicture.asset(
                      'assets/icons/sarrow.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 123.w, right: 123.w, bottom: 35.h),
        child: MainButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                top: 19.h,
                bottom: 19.h,
              ),
              child: Text(
                "Join meeting",
                style: kManRope_400_16_white,
              ),
            ),
            color: k66898D,
            shape: CustomDecoration().button08Decoration()),
      ),
    );
  }
}
