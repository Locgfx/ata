import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/edit_doctor_profile_screen.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  void _SpecializationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const SpecializationBottomSheet());
  }

  void _LanguageBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => LanguageBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // height: 600.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 36.h,
            ),
            Text(
              'About',
              style: kManRope_400_16_626A6A,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextField(
              decoration: TextfieldDecoration(
                  label: 'About',
                  child: Image.asset(
                    "assets/images/editbutton.png",
                    height: 20,
                  )).underlinefieldDecoration(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Total exprience',
              style: kManRope_400_16_626A6A,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextField(
              decoration: TextfieldDecoration(
                  label: 'Total experience',
                  child: Image.asset(
                    "assets/images/editbutton.png",
                    height: 20,
                  )).underlinefieldDecoration(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Specialization',
              style: kManRope_400_16_626A6A,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextField(
              onTap: () {
                _SpecializationBottomSheet();
              },
              readOnly: true,
              decoration: TextfieldDecoration(
                  label: 'Specialization',
                  child: Image.asset(
                    "assets/images/downarrowblack.png",
                    height: 5,
                  )).underlinefieldDecoration(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Language',
              style: kManRope_400_16_626A6A,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextField(
              onTap: () {
                _LanguageBottomSheet();
              },
              readOnly: true,
              decoration: TextfieldDecoration(
                  label: 'Language',
                  child: Image.asset(
                    "assets/images/downarrowblack.png",
                    height: 5,
                  )).underlinefieldDecoration(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Pricing',
              style: kManRope_400_16_626A6A,
            ),
            SizedBox(height: 8.h),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: kE2F2F4,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type here price',
                      hintStyle: kManRope_400_16_001314,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: MainButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PsychologistEditDoctorInfo()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 63, vertical: 15),
                      child: Text(
                        "Save",
                        style: kManRope_500_18_FFFFF,
                      ),
                    ),
                    color: k006D77,
                    shape: CustomDecoration().smallButtonDecoration()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
