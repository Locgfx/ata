import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets/DatePickerBottomSheet.dart';
import 'package:greymatter/widgets/BottomSheets/GenderBottomSheet.dart';
import 'package:greymatter/widgets/buttons.dart';

import '../../../../widgets/BottomSheets/DesignationBottomSheet.dart';

class PEditBasicDetailsScreen extends StatefulWidget {
  const PEditBasicDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PEditBasicDetailsScreen> createState() => _PEditBasicDetailsScreenState();
}

class _PEditBasicDetailsScreenState extends State<PEditBasicDetailsScreen> {

  void _selectGenderBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const SelectGenderBottomSheet());
  }

  void _selectDesignationBottomSheet() {
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
    return isreadable ? Column(
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
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Priya Singh",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(height: 20.h,),
        Text(
          'Date of birth',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("25/02/1993",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(height: 20.h,),
        Text(
          'Gender',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Female",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Designation',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Other",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'signature',
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
            child: SizedBox(
              height: 56.h,
              child: MainButton(
                  onPressed: () {
                    setState(() {
                      isreadable = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 63.w, right: 63.w),
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
          ),
        )
      ],
    ) :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 36.h,),
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Name',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      // color: Colors.red,
                      width: 335.w,
                      child: TextField(
                          style: kManRope_400_16_001314,
                          // readOnly: true,
                          onTap: () {},
                          decoration: TextfieldDecoration(label: 'Priya singh').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                Image.asset("assets/images/iconedit.png",height: 20,width: 20,)
              ],
            ),
            SizedBox(height: 10.h,),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 20.h,),
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Date of birth',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      // color: Colors.red,
                      width: 320.w,
                      child: TextField(  style: kManRope_400_16_001314,
                          readOnly: true,
                          onTap: () {
                            _datePickerBottomSheet();
                          },
                          decoration: TextfieldDecoration(label: '25/02/1993').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _datePickerBottomSheet();

                  },
                  child: SizedBox(
                      height: 48,
                      width: 48,
                      child: Image.asset("assets/images/icondropdownlargee.png",)),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 20.h,),
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Gender',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      width: 320.w,
                      child: TextField(  style: kManRope_400_16_001314,
                          readOnly: true,
                          onTap: () {
                            _selectGenderBottomSheet();
                          },
                          decoration:  TextfieldDecoration(label: 'Female').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _selectGenderBottomSheet();
                  },
                  child: SizedBox(
                    // color: Colors.red,
                      height: 48,
                      width: 48,
                      child: Image.asset("assets/images/icondropdownlargee.png",)),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 20.h,),
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Designation',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      width: 320.w,
                      child: TextField(  style: kManRope_400_16_001314,
                          readOnly: true,
                          onTap: () {
                            _selectDesignationBottomSheet();
                          },
                          decoration:  TextfieldDecoration(label: 'Other').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _selectDesignationBottomSheet();
                  },
                  child: SizedBox(
                      height: 48,
                      width: 48,
                      child: Image.asset("assets/images/icondropdownlargee.png",)),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 10.h,),
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      width: 335.w,
                      child: TextField(  style: kManRope_400_16_001314,

                          decoration:  TextfieldDecoration(label: 'Add Signature').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                Image.asset("assets/images/iconplussmall.png",height: 20,width: 20,)
              ],
            ),
            SizedBox(height: 10.h,),

          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Center(
            child: SizedBox(
              height: 56.h,
              child: MainButton(
                  onPressed: () {
                    setState(() {
                      isreadable = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 63.w, right: 63.w),
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