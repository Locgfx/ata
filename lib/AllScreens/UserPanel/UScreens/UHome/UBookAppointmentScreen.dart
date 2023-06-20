import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/search_psycologist_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/userspecialistapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../UProfile/UHelpandsupport.dart';
import 'UAllPsychologistScreen.dart';

class UBookAppointmentScreen extends StatefulWidget {
  final String bookingType;
  const UBookAppointmentScreen({Key? key, required this.bookingType})
      : super(key: key);

  @override
  State<UBookAppointmentScreen> createState() => _UBookAppointmentScreenState();
}

class _UBookAppointmentScreenState extends State<UBookAppointmentScreen> {
  bool isLoading = false;
  UserSpecialistModel modeltopspecialist = UserSpecialistModel();
  List<UserSpecialistModel> specialistModel = [];

  getTopSpecialistData() {
    isLoading = true;
    final resp = UserSpecialistApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          specialistModel.add(UserSpecialistModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getTopSpecialistData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
          hasThreeDots: false,
          appBarText: 'Book Appointment',
          imgPath: 'assets/images/iconbackappbar2.png',
          text: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UHelpandSupport()));
            },
            child: Text(
              "Help",
              style: kManRope_500_16_006D77,
            ),
          )),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => SearchPsychologistScreen(
                              bookingType: 'a',
                              issueId: "",
                              issue: "",
                            )));
                  },
                  child: Container(
                    height: 56.h,
                    decoration: CustomDecoration().outline5A72EDDecoration(),
                    child: IgnorePointer(
                      child: TextField(
                        decoration: TextfieldDecoration(
                                label: 'Search for Counsellors',
                                hintstyle: kManRope_400_14_626A6A)
                            .whiteColorSearchField(() {}),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text('Choose from Top Counsellors',
                    style: kManRope_700_16_001314),
                SizedBox(height: 8.h),
                Text('Book confirmed appointments',
                    style: kManRope_400_16_626A6A),
                SizedBox(height: 24.h),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 5, right: 5),
                    shrinkWrap: true,
                    itemCount: specialistModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1.5,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => UAllPsychologistScreen(
                                    bookingType: widget.bookingType,
                                    issue:
                                        specialistModel[index].name.toString(),
                                    issueId:
                                        specialistModel[index].id.toString(),
                                  )));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 84.w,
                              width: 84.w,
                              decoration: BoxDecoration(
                                  color: kFFFFFF.withOpacity(0.40),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Image.network(
                                specialistModel[index].icon.toString(),
                                height: 62.h,
                                width: 58.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              specialistModel[index].name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: kManRope_400_16_626A6A,
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
