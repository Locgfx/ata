import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
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
                    Container(
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
                    Container(
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
                  child: Container(
                    height: 48,
                      width: 48,
                      // color: Colors.red,
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
                    Container(
                      // color: Colors.red,
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
                  child: Container(
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
                    Container(
                      // color: Colors.red,
                      width: 320.w,
                      child: TextField(  style: kManRope_400_16_001314,
                        readOnly: true,
                        onTap: () {
                          _SelectDesignationBottomSheet();
                        },
                        decoration:  TextfieldDecoration(label: 'Other').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _SelectDesignationBottomSheet();
                  },
                  child: Container(
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
                    Container(
                      // color: Colors.red,
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

        // Text(
        //   'Date of birth',
        //   style: kManRope_400_16_626A6A,
        // ),
        // SizedBox(
        //   height: 5.h,
        // ),
        // TextField(
        //   readOnly: isreadable? true:false,
        //   onTap: () {
        //     _datePickerBottomSheet();
        //   },
        //   decoration: TextfieldDecoration(
        //       label: '25/ 02/1993',
        //       child: Image.asset(
        //         "assets/images/downarrowblack.png",
        //         height: 5,
        //       )).underlinefieldDecoration(),
        // ),
        // BlackUnderline(),
        // SizedBox(
        //   height: 15.h,
        // ),
        // Text(
        //   'Gender',
        //   style: kManRope_400_16_626A6A,
        // ),
        // SizedBox(
        //   height: 5.h,
        // ),
        // TextField(
        //   onTap: () {
        //     setState(() {
        //
        //     });
        //     _selectGenderBottomSheet();
        //   },
        //   readOnly: isreadable? true:false,
        //   decoration: TextfieldDecoration(
        //       label: 'Female',
        //       child: Image.asset(
        //         "assets/images/downarrowblack.png",
        //         height: 5,
        //       )).underlinefieldDecoration(),
        // ),
        // BlackUnderline(),
        // SizedBox(
        //   height: 15.h,
        // ),
        // Text(
        //   'Designation',
        //   style: kManRope_400_16_626A6A,
        // ),
        // SizedBox(
        //   height: 5.h,
        // ),
        // TextField(
        //   readOnly: isreadable? true:false,
        //   onTap: () {
        //     _SelectDesignationBottomSheet();
        //   },
        //   decoration: TextfieldDecoration(
        //       label: 'Other',
        //       child: Image.asset(
        //         "assets/images/downarrowblack.png",
        //         height: 5,
        //       )).underlinefieldDecoration(),
        // ),
        // BlackUnderline(),
        // SizedBox(
        //   height: 8.h,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'Add signature',
        //       style: kManRope_400_16_626A6A,
        //     ),
        //     Image.asset(
        //       'assets/images/signature.png',
        //       height: 48.h,
        //       width: 64.w,
        //     ),
        //   ],
        // ),
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