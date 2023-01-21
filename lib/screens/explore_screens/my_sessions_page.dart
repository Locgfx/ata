import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/explore_screens/session_details_page.dart';
import 'package:greymatter/widgets/AppWidgets.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'booking_confirmation.dart';

class MySessionPage extends StatefulWidget {
  const MySessionPage({Key? key}) : super(key: key);

  @override
  State<MySessionPage> createState() => _MySessionPageState();
}

class _MySessionPageState extends State<MySessionPage> {
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9D,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 44.h, right: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming sessions',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingConfirmationScreen(),
                    ),
                  );
                },
                child: CardWidget(
                  decoration: CustomDecoration().card20Edf6Decoration(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                    child: Row(
                      children: [
                        Container(
                          height: 64.h,
                          width: 64.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/userP.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Priyanka singh',
                                    style: kManRope_400_14_001314,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    'Psychologist',
                                    style: kManRope_400_12_626A6A,
                                  ),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  Text(
                                    '05 June 2022',
                                    style: kManRope_400_12_626A6A,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    '8:00AM',
                                    style: kManRope_400_12_626A6A,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        /*SizedBox(
                          width: 65.w,
                        ),*/
                        /*Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/kebabMenu.svg',
                              height: 20,
                              width: 4,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 32.h,
                              width: 72.w,
                              child: MaterialButton(
                                color: kB5BABA,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Join',
                                  style: kManRope_400_16_white,
                                ),
                              ),
                            ),
                          ],
                        )*/
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'All sessions',
                style: kManRope_700_16_001314,
              ),
              SizedBox(
                height: 24.h,
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SessionDetailsScreen()));
                    },
                    child: CardWidget(decoration: CustomDecoration().card20Edf6Decoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 19.w,vertical: 24.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 64.w,
                                      height: 64.h,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Image.asset('assets/images/userP.png',fit: BoxFit.cover,),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 98,
                                                child: Text('Priyanka singh',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: kManRope_400_14_001314),
                                              ),
                                              Text('05 June 2022',
                                                  style: kManRope_400_14_626A6A),
                                            ],
                                          ),
                                          //SizedBox(width: 10,),
                                          SizedBox(height: 8.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Psychologist',
                                                  style: kManRope_400_12_626A6A),
                                              Text('8:00AM-9:00AM',
                                                  style: kManRope_400_12_626A6A),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap:() => _onSelected(index),
                                      child: Container(
                                        height: 28.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(28)),
                                          color:  _selectedIndex == index ? Color(0xFFFF5C5C).withOpacity(0.36): Color(0xFF006D77).withOpacity(0.36)
                                        ),
                                        child: Center(
                                            child: _selectedIndex == index ? Text(
                                                    'Canceled',
                                                     style: kManRope_400_12_001314,
                                                     ): Text(
                                              'Finished',
                                              style: kManRope_400_12_001314,
                                            ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        _selectedIndex == index ?Text(
                                          'Appointment cancelled by Psychologist',
                                          style: kManRope_400_10_F8474E,
                                        ) :Text(
                                          'Reschedule',
                                          style: kManRope_600_14_006D77,
                                        ),
                                        SizedBox(width: 4.w),
                                        _selectedIndex == index ?
                                        SvgPicture.asset("assets/icons/iconred!.svg",height: 18,width: 18,) :SizedBox.shrink()
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: 10,
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
