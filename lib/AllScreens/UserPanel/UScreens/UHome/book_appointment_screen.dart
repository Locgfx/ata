import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/available_psychologists_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/userspecialistapi.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
          hasThreeDots: false,
          appBarText: 'Book Appointment',
          imgPath: 'assets/images/iconbackappbar2.png',
          text: Text(
            "Help",
            style: kManRope_500_16_006D77,
          )),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56.h,
                  decoration: CustomDecoration().outline5A72EDDecoration(),
                  child: TextField(
                    decoration: TextfieldDecoration(
                        label:
                        'Search for health problem, Psychologist',
                        hintstyle: kManRope_400_14_626A6A)
                        .whiteColorSearchField(),
                  ),
                ),
                SizedBox(height: 40.h),
                Text('Choose from Top Psychologists',
                    style: kManRope_700_16_001314),
                SizedBox(height: 8.h),
                Text('Book confirmed appointments',
                    style: kManRope_400_16_626A6A),
                SizedBox(height: 24.h),
                GridView.builder(
                    physics:  NeverScrollableScrollPhysics(),
                    padding:  EdgeInsets.only(top: 5, right: 5),
                    shrinkWrap: true,
                    itemCount: specialistModel.length,
                    gridDelegate:
                     SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1.5,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AvailablePsychologists(
                                  issue: titleList[index])));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 84.h,
                              width: 84.w,
                              decoration: BoxDecoration(
                                  color: kFFFFFF.withOpacity(0.40),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  specialistModel[index].icon.toString(),
                                  height: 62.h,
                                  width: 58.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              specialistModel[index].name.toString(),
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
