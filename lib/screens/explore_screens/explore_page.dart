import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/screens/explore_screens/filters_page.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../widgets/shared/buttons/card_buttons/secondary_card_button.dart';
import '../book_appointment_screens/confirm_booking_screen.dart';
import '../book_appointment_screens/psychologists_profile_screen.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key, required this.issue}) : super(key: key);
  final String issue;
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String date = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9D,
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 54.h, right: 24.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '213 psychologists',
                  style: kManRope_500_16_001314,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FilterScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      height: 20.h,
                      width: 18.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 24.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(width: 1, color: Colors.white),
                        color: kEDF6F9D,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            //width: 280.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 85.w,
                                      height: 85.h,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                          'assets/images/userP.png'),
                                    ),
                                    SizedBox(width: 8.w),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Raghuram Singh',
                                            style: kManRope_400_16_Black),
                                        //SizedBox(width: 10,),
                                        SizedBox(height: 8.h),
                                        Text('MA in Counselling Psychology',
                                            style: kManRope_400_14_626A6A),
                                        SizedBox(height: 8.h),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: kDFBE13,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text('4.0',
                                                style: kManRope_400_12_001314),
                                            SizedBox(width: 4.w),
                                            Text('.',
                                                style: kManRope_700_16_001314),
                                            SizedBox(width: 4.w),
                                            Text('12 Yrs. Exp',
                                                style: kManRope_400_12_001314),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text('₹270', style: kManRope_400_12_001314),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Expertise in :",
                                style: kManRope_400_12_001314,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            'Anxiety, Stress, Depression,Rel..',
                                        style: kManRope_400_12_626A6A),
                                    TextSpan(
                                        text: 'Show more',
                                        style: kManRope_400_12_006D77),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              SizedBox(
                                height: 48,
                                width: 160,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PsychologistProfile()));
                                  },
                                  child: SecondaryCardButton(),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                height: 48,
                                width: 158,
                                child: MaterialButton(
                                  color: k006D77,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmAppointmentBooking(
                                                  issue: widget.issue,
                                                  date: date,
                                                )));
                                  },
                                  child: Text(
                                    'Book session',
                                    style: kManRope_400_16_white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return SizedBox(height: 40.h);
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
