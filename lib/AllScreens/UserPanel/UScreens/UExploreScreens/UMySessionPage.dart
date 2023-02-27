import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/USessionDetailsPage.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UHomeWidgets/UMainCardWidget.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import 'UBookingConfirmationScreen.dart';

class UMySessionPage extends StatefulWidget {
  const UMySessionPage({Key? key}) : super(key: key);

  @override
  State<UMySessionPage> createState() => _UMySessionPageState();
}

class _UMySessionPageState extends State<UMySessionPage> {
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  List previousSessions = [];
  List upcomingSessions = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, top: 40.h, right: 24.h, bottom: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming sessions',
                    style: kManRope_700_16_001314,
                  ),
                  SizedBox(height: 24.h),
                  upcomingSessions.isEmpty
                      ? Center(
                          child: Text(
                            'No Upcoming sessions.',
                            style: kManRope_500_16_001314,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UBookingConfirmationScreen(
                                  isCancellationAvailable: true,
                                ),
                              ),
                            );
                          },
                          child: UMainCardWidget(
                            decoration:
                                CustomDecoration().card20Edf6Decoration(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 24.h),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                  previousSessions.isEmpty
                      ? Center(
                          child: Text(
                            'No Sessions Taken.',
                            style: kManRope_500_16_001314,
                          ),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                if (index != 0) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const USessionDetailsScreen()));
                                }
                              },
                              child: UMainCardWidget(
                                decoration:
                                    CustomDecoration().card20Edf6Decoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 19.w, vertical: 24.h),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/images/userP.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(width: 16.w),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 98,
                                                          child: Text(
                                                              'Priyanka singh',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  kManRope_400_14_001314),
                                                        ),
                                                        Text('05 June 2022',
                                                            style:
                                                                kManRope_400_14_626A6A),
                                                      ],
                                                    ),
                                                    //SizedBox(width: 10,),
                                                    SizedBox(height: 8.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Psychologist',
                                                            style:
                                                                kManRope_400_12_626A6A),
                                                        Text('8:00AM-9:00AM',
                                                            style:
                                                                kManRope_400_12_626A6A),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () => _onSelected(index),
                                                child: Container(
                                                  height: 28.h,
                                                  width: 70.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  28)),
                                                      color: _selectedIndex ==
                                                              index
                                                          ? Color(0xFFFF5C5C)
                                                              .withOpacity(0.36)
                                                          : Color(0xFF006D77)
                                                              .withOpacity(
                                                                  0.36)),
                                                  child: Center(
                                                    child:
                                                        _selectedIndex == index
                                                            ? Text(
                                                                'Canceled',
                                                                style:
                                                                    kManRope_400_12_001314,
                                                              )
                                                            : Text(
                                                                'Finished',
                                                                style:
                                                                    kManRope_400_12_001314,
                                                              ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  _selectedIndex == index
                                                      ? Text(
                                                          'Appointment cancelled by Psychologist',
                                                          style:
                                                              kManRope_400_10_F8474E,
                                                        )
                                                      : Text(
                                                          'Reschedule',
                                                          style:
                                                              kManRope_600_14_006D77,
                                                        ),
                                                  SizedBox(width: 4.w),
                                                  _selectedIndex == index
                                                      ? SvgPicture.asset(
                                                          "assets/icons/iconred!.svg",
                                                          height: 18,
                                                          width: 18,
                                                        )
                                                      : SizedBox.shrink()
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
                            return SizedBox(height: 24.h);
                          },
                          itemCount: previousSessions.length,
                        ),
                  SizedBox(height: 180),
                ],
              ),
            ),
          ),
          if (loading) LoadingWidget(),
        ],
      ),
    );
  }
}
