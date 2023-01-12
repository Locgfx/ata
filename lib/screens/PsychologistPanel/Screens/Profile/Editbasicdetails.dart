import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/screens/psychologist_screen/profile_screens/basic_details_widget.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/buttons.dart';

class EditbasicDetails extends StatefulWidget {
  const EditbasicDetails({Key? key}) : super(key: key);

  @override
  State<EditbasicDetails> createState() => _EditbasicDetailsState();
}

class _EditbasicDetailsState extends State<EditbasicDetails> {

  void _selectGenderBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const SelectGenderBottomSheet());
  }

  void _SelectDesignationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const SelectDesignationBottomSheet());
  }

  void _datePickerBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => DatePickerBottomSheet());
  }
  bool isreadable = true;
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
          readOnly: isreadable? true:false,
          decoration: TextfieldDecoration(
              label: 'Priya singh',
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
          readOnly: isreadable? true:false,
          onTap: () {
            _datePickerBottomSheet();
          },
          decoration: TextfieldDecoration(
              label: '25/ 02/1993',
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
          readOnly: isreadable? true:false,
          decoration: TextfieldDecoration(
              label: 'Female',
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
          readOnly: isreadable? true:false,
          onTap: () {
            _SelectDesignationBottomSheet();
          },
          decoration: TextfieldDecoration(
              label: 'Other',
              child: Image.asset(
                "assets/images/downarrowblack.png",
                height: 5,
              )).underlinefieldDecoration(),
        ),
        BlackUnderline(),
        SizedBox(
          height: 8.h,
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
                onPressed: () {
                  setState(() {
                    isreadable = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 16.h, bottom: 16.h, left: 63.w, right: 63.w),
                  child: isreadable ? Text(
                    "Edit",
                    style: kManRope_500_18_FFFFF,
                  ):
                  Text(
                    "Save",
                    style: kManRope_500_18_FFFFF,
                  ),
                ),
                color: k006D77,
                shape: CustomDecoration().smallButtonDecoration()),
          ),
        )
        // Center(
        //   child: MainButton(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 15),
        //       child: Text(
        //         "Done",
        //         style: kManRope_500_18_FFFFF,
        //       ),
        //     ),
        //     color: k006D77,
        //     shape: CustomDecoration().smallButtonDecoration(),
        //     onPressed: () {},
        //   ),
        // ),
        // Center(
        //   child: SizedBox(
        //     height: 56.h,
        //     width: 168.w,
        //     child: MaterialButton(
        //       color: k006D77,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(48), // <-- Radius
        //       ),
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => PsychologistEditPersonalInfo()));
        //       },
        //       child: Text(
        //         'Edit',
        //         style: kManRope_400_16_white,
        //       ),
        //     ),
        //   ),
        // ),
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