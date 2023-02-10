import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/buttons.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

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

  void _selectDesignationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => const SelectDesignationBottomSheet());
  }

  void _datePickerBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        context: context,
        builder: (context) => DatePickerBottomSheet());
  }

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
            _datePickerBottomSheet();
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
            _selectDesignationBottomSheet();
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
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Center(
            child: MainButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 16.h, bottom: 16.h, left: 63.w, right: 63.w),
                  child: Text(
                    "Save",
                    style: kManRope_500_18_FFFFF,
                  ),
                ),
                color: k006D77,
                shape: CustomDecoration().smallButtonDecoration()),
          ),
        )
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
