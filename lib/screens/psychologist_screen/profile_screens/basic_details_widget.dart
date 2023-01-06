import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import 'edit_personal_info_screen.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  void _selectGenderBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const SelectGenderBottomSheet());
  }

  void _SelectDesignationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const SelectDesignationBottomSheet());
  }

  // void _datePickerBottomSheet() {
  //   showModalBottomSheet(
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(8), topLeft: Radius.circular(8)),
  //       ),
  //       context: context,
  //       builder: (context) => const DatePickerBottomSheet());
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 36.h,
        ),
        Text(
          'Name',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          decoration: TextfieldDecoration(
              label: 'Enter your Name',
              child: Image.asset(
                "assets/images/editbutton.png",
                height: 20,
              )).underlinefieldDecoration(),
        ),
        BlackUnderline(),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Date of birth',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          readOnly: true,
          onTap: () {
            // _datePickerBottomSheet();
          },
          decoration: TextfieldDecoration(
              label: 'Enter your DOB',
              child: Image.asset(
                "assets/images/downarrowblack.png",
                height: 5,
              )).underlinefieldDecoration(),
        ),
        BlackUnderline(),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Gender',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          onTap: () {
            _selectGenderBottomSheet();
          },
          readOnly: true,
          decoration: TextfieldDecoration(
              label: 'Select your Gender',
              child: Image.asset(
                "assets/images/downarrowblack.png",
                height: 5,
              )).underlinefieldDecoration(),
        ),
        BlackUnderline(),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Designation',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          readOnly: true,
          onTap: () {
            _SelectDesignationBottomSheet();
          },
          decoration: TextfieldDecoration(
              label: 'Designation',
              child: Image.asset(
                "assets/images/downarrowblack.png",
                height: 5,
              )).underlinefieldDecoration(),
        ),
        BlackUnderline(),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add signature',
              style: kManRope_400_16_626A6A,
            ),
            Image.asset(
              'assets/images/signature.png',
              height: 48.h,
              width: 64.w,
            ),
          ],
        ),
        // SizedBox(
        //   height: 34.h,
        // ),
        Center(
          child: MainButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 15),
              child: Text(
                "Done",
                style: kManRope_500_18_FFFFF,
              ),
            ),
            color: k006D77,
            shape: CustomDecoration().smallButtonDecoration(),
            onPressed: () {},
          ),
        ),
        Center(
          child: SizedBox(
            height: 56.h,
            width: 168.w,
            child: MaterialButton(
              color: k006D77,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48), // <-- Radius
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PsychologistEditPersonalInfo()));
              },
              child: Text(
                'Edit',
                style: kManRope_400_16_white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BlackUnderline extends StatelessWidget {
  const BlackUnderline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.4,
      width: 1.sw,
      color: kB5BABA,
    );
  }
}
