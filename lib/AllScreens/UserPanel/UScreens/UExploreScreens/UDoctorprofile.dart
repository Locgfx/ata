import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UScheduleAppointmentScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UListsViews.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class UDoctorProfileScreen extends StatefulWidget {
  const UDoctorProfileScreen({Key? key}) : super(key: key);

  @override
  State<UDoctorProfileScreen> createState() => _UDoctorProfileScreenState();
}

class _UDoctorProfileScreenState extends State<UDoctorProfileScreen> {
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
                  child: Image.asset(
                    'assets/images/doctorprofileimage.png',
                    fit: BoxFit.cover,
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
                            'Animesha Jain',
                            style: kManRope_500_20_001314,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Psychiatrist',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DoctorDetailsCard(
                                    imgPath: 'assets/icons/profile.svg',
                                    text: '599',
                                    title: "Clients"),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: DoctorDetailsCard(
                                    imgPath: 'assets/icons/tickCircle.svg',
                                    text: '2 Years',
                                    title: "Experience"),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: DoctorDetailsCard(
                                    imgPath: 'assets/icons/starOutline.svg',
                                    text: '5.0',
                                    title: "RATING"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'About',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            'Animesha is a Counselling Psychologist with distinction in both BA and MA. She also holds a Diploma in Counselling Skills from Tata Institute of Social Sciences. She has trained in REBT, CBT and NLP therapy techniques. When providing therapy, she uses an eclectic approach to understand what suits her clients the best. She believes that a blend of different approaches helps her in establishing a good therapeutic relationship with her clients while further facilitating their effective healing process. She primarily uses the Client Centered approach, Cognitive behavioral therapy, and Narrative Therapy based on the concerns of the clients.',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Specialization',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            'Anxiety, Depression, Relationship Issue, Couple Counseling, Grief & Loss, Suiciddal Ideation, Sleep Issues, Trauma, Narcissistic Abuse, Family Therphy, Body Image, Psycho-Somatic Disorders, LGBTQI',
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Language',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            "English, Hindi, Tamil",
                            style: kManRope_400_14_626A6A,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Availability',
                            style: kManRope_700_16_001314,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),

                          PsychologistTimingList(),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 80.w,
                                child: Text(
                                  'Sunday',
                                  style: kManRope_400_14_626A6A,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'EMERGENCY CALL ONLY',
                                    style: kManRope_500_14_626A6A,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),
                          SizedBox(
                            height: 83.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    // height:56.h,
                                    child: Text(
                                      '₹599',
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
                                                      issue: 'issue',
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
