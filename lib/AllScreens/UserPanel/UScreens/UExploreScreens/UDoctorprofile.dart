import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UScheduleAppointmentScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UListsViews.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class UDoctorProfileScreen extends StatefulWidget {
  final bool showBookSession;
  final UPsychologistModel psychologistData;
  final String issue;
  final String bookingType;
  final String issueId;
  const UDoctorProfileScreen({
    Key? key,
    required this.psychologistData,
    required this.issue,
    required this.bookingType,
    required this.issueId,
    required this.showBookSession,
  }) : super(key: key);

  @override
  State<UDoctorProfileScreen> createState() => _UDoctorProfileScreenState();
}

class _UDoctorProfileScreenState extends State<UDoctorProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  getSpecialities() {
    String a = '';
    for (int i = 0; i < widget.psychologistData.specialities!.length; i++) {
      if (i != widget.psychologistData.specialities!.length - 1) {
        a = a + widget.psychologistData.specialities![i].name.toString() + ', ';
      } else {
        a = a + widget.psychologistData.specialities![i].name.toString();
      }
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: "",
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 276.h,
                  width: 1.sw,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.psychologistData.profilePhoto.toString(),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Opacity(
                      opacity: 0.9,
                      child: Container(
                        color: Colors.white,
                        width: 64.w,
                        height: 64.w,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 247.h),
                  child: Container(
                    // margin: EdgeInsets.only(top: 246.h),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    // height: 1190.h,
                    width: 428.w,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.psychologistData.name.toString(),
                            style: kManRope_500_20_001314,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            widget.psychologistData.designation.toString(),
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              Expanded(
                                child: DoctorDetailsCard(
                                    imgPath: 'assets/icons/profile.svg',
                                    text: '0',
                                    title: "Clients"),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: DoctorDetailsCard(
                                    imgPath: 'assets/icons/tickCircle.svg',
                                    text:
                                        '${widget.psychologistData.totalExprience} Years',
                                    title: "Experience"),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: DoctorDetailsCard(
                                    imgPath: 'assets/icons/starOutline.svg',
                                    text: '${widget.psychologistData.rating}',
                                    title: "RATING"),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            'About',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            widget.psychologistData.about.toString(),
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            'Specialization',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            getSpecialities(),
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            'Language',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            widget.psychologistData.language.toString(),
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            'Availability',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(height: 24.h),
                          if (widget.psychologistData.availability != null)
                            PsychologistTimingList(
                                availability:
                                    widget.psychologistData.availability!),
                          SizedBox(height: 40.h),
                          if (widget.showBookSession)
                            SizedBox(
                              height: 83.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      // height:56.h,
                                      child: Text(
                                        '₹${widget.psychologistData.price}',
                                        style: kManRope_500_20_006D77,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 56.h,
                                      // width: 200,
                                      child: MainButton(
                                        color: k006D77,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // <-- Radius
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UScheduleAppointmentScreen(
                                                        bookingType:
                                                            widget.bookingType,
                                                        psychologist: widget
                                                            .psychologistData,
                                                        issue: widget.issue,
                                                        issueId: widget.issueId,
                                                      )));
                                        },
                                        child: Text(
                                          'Book session',
                                          style: kManRope_400_16_white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
