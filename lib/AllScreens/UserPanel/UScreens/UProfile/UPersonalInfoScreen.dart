import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UprofileScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/UBottomsheet.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';

class UserPersonalInfoScreen extends StatefulWidget {
  const UserPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserPersonalInfoScreen> createState() => _UserPersonalInfoScreenState();
}

class _UserPersonalInfoScreenState extends State<UserPersonalInfoScreen> {
  void _selectGenderBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const SelectGenderBottomSheet());
  }

  void _relationStatusBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => RelationStatusBottomSheet());
  }

  void _occupationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => OccupationBottomSheet());
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
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(appBarText: "Account", imgPath: "assets/images/iconbackappbar2.png"),
      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 30.h,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child:isreadable ? Column(
            children: [
              SizedBox(height: 43),
              Center(
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  color: k006D77,

                  strokeWidth: 0.5,
                  dashPattern: [
                    2,
                    2,
                  ],
                  child: Container(
                    height: 102.h,
                    width: 102.w,
                    decoration: const BoxDecoration(
                        color: Color(0xFF006D77), shape: BoxShape.circle),
                    child: Image.asset('assets/images/userP.png'),
                    clipBehavior: Clip.hardEdge,
                  ),
                ),
              ),
              Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          height: 40.h,
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
          ],
        ),
        SizedBox(height: 40.h,),
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
          ],
        ),
        SizedBox(height: 40.h,),
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
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          'Relationship status',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Single",style: kManRope_400_16_001314,),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
            Text(
              'Occuption',
              style: kManRope_400_16_626A6A,
            ),
            SizedBox(
              height: 8.h,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Student",style: kManRope_400_16_001314,),
              ],
            ),

        SizedBox(
          height: 104.h,
        ),
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
                    top: 15.h,bottom: 15.h,
                      left: 50.w, right: 50.w),
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
      ) ,
            ],
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 43.h,),
              Column(
                children: [
                  Center(
                    child: DottedBorder(
                      borderType: BorderType.Circle,
                      color: k006D77,

                      strokeWidth: 0.5,
                      dashPattern: [
                        2,
                        2,
                      ],
                      child: Container(
                        height: 102.h,
                        width: 102.w,
                        decoration: const BoxDecoration(
                            color: Color(0xFF006D77), shape: BoxShape.circle),
                        child: Image.asset('assets/images/userP.png'),
                        clipBehavior: Clip.hardEdge,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text("Change Photo",style: kManRope_500_16_404040,),
                  SizedBox(height: 40.h,),
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
                              'Relationship status',
                              style: kManRope_400_16_626A6A
                          ),
                          SizedBox(height: 8.h,),
                          Container(
                            // color: Colors.red,
                            width: 320.w,
                            child: TextField(  style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _relationStatusBottomSheet();
                                },
                                decoration:  TextfieldDecoration(label: 'SIngle').textfieldProfileDecoration()
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _relationStatusBottomSheet();
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
                height: 20.h,),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Occuption',
                              style: kManRope_400_16_626A6A
                          ),
                          SizedBox(height: 8.h,),
                          Container(
                            // color: Colors.red,
                            width: 320.w,
                            child: TextField(  style: kManRope_400_16_001314,
                                readOnly: true,
                                onTap: () {
                                  _occupationBottomSheet();
                                },
                                decoration:  TextfieldDecoration(label: 'Student').textfieldProfileDecoration()
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _occupationBottomSheet();
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
              SizedBox(height: 40.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Center(
                  child: MainButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UProfileScreen()));

                        setState(() {
                          // isreadable = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15.h,bottom: 15.h,
                            left: 50.w, right: 50.w),
                        child:
                        Text(
                          "Save",
                          style: kManRope_500_18_FFFFF,
                        ),
                      ),
                      color: k006D77,
                      shape: CustomDecoration().smallButtonDecoration()),
                ),
              )

            ],
          ),

        ),
      ),
    ) ;
  }
}
