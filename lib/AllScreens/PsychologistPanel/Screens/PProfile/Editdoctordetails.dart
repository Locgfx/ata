import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/Editbasicdetails.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/buttons.dart';

class EditDoctorProfile extends StatefulWidget {
  const EditDoctorProfile({Key? key}) : super(key: key);

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  void _SpecializationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => const SpecializationBottomSheet());
  }

  void _LanguageBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => LanguageBottomSheet());
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
          'About',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Animesh is a Counselling Psychologist with distinction in both BA and MA. She also holds a Diploma in Counselling Skills from the Tata Institute of Social Sciences. She has trained in REBT, CBT and NLP therapy techniques. When providing therapy, she uses an eclectic approach to understand what suits her clients the best. She believes that a blend of different approaches helps her in establishing a good therapeutic relationship with her clients while further facilitating their effective healing process. She primarily uses the Client Centered approach, Cognitive behavioral therapy, and Narrative Therapy based on the concerns of the clients.",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(height: 20.h,),
        Text(
          'Total experience',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("2 yrs",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(height: 20.h,),
        Text(
          'Specialization',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(
          height: 8.h,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Anxiety, Depression, Relationship Issue, Couple Counseling, Grief & Loss, Suiciddal Ideation, Sleep Issues, Trauma, Narcissistic Abuse, Family Therphy, Body Image, Psycho-Somatic Disorders, LGBTQI",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
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
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("English",style: kManRope_400_16_001314,),
            SizedBox(height: 20),
            BlackUnderline(),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Pricing',
          style: kManRope_400_16_626A6A,
        ),
        SizedBox(height: 8,),
        Container(
                  height: 39.h,
                  decoration: BoxDecoration(
                    color: kE2F2F4,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextField(
                      readOnly: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 10,),
                          border: InputBorder.none,
                          hintStyle: kManRope_400_16_001314,
                          hintText: 'Rs 500'
                      ),
                    ),
                  ),
                ),

        SizedBox(
          height: 24.h,
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
                        'About',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      // color: Colors.red,
                      width: 335.w,
                      child: TextField(
                        // readOnly: true,
                        onTap: () {},

                        decoration:  TextfieldDecoration(label: 'Type About').textfieldProfileDecoration()
                    )
                    ),
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
                        'Total experience',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      // color: Colors.red,
                      width: 335.w,
                      child: TextField(
                          style: kManRope_400_16_001314,
                        // readOnly: true,
                        onTap: () {
                         // _SpecializationBottomSheet();
                        },

                        decoration:  TextfieldDecoration(label: 'Type here yrs').textfieldProfileDecoration()
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
                        'Specialization',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      // color: Colors.red,
                      width: 320.w,
                      child: TextField(
                          style: kManRope_400_16_001314,
                        readOnly: true,
                        onTap: () {
                          _SpecializationBottomSheet();

                        },
                        decoration:  TextfieldDecoration(label: 'Specialization').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _SpecializationBottomSheet();

                  },
                  child: Container(
                      height: 48,
                      width: 48,
                      child: Image.asset("assets/images/icondropdownlargee.png",height: 20,width: 20,)),
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
                        'Language',
                        style: kManRope_400_16_626A6A
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      // color: Colors.red,
                      width: 320.w,
                      child: TextField(
                          style: kManRope_400_16_001314,
                        readOnly: true,
                        onTap: () {
                        _LanguageBottomSheet();
                        },
                        decoration:  TextfieldDecoration(label: 'English').textfieldProfileDecoration()
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _LanguageBottomSheet();

                  },
                  child: Container(   height: 48,
                      width: 48,
                      child: Image.asset("assets/images/icondropdownlargee.png")),
                )
              ],
            ),
            SizedBox(height: 10.h,),

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pricing',
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(height: 8,),
                Container(
                  height: 39.h,
                  decoration: BoxDecoration(
                    color: kE2F2F4,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextField(
                      style: kManRope_400_14_001314,
                      // cursorColor: Colors.white,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 10,),
                          border: InputBorder.none,
                          hintStyle: kManRope_400_16_001314,
                          hintText: 'Enter Amount'
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
        SizedBox(
          height: 24.h,),

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
    // return SingleChildScrollView(
    //   child: SizedBox(
    //     // height: 600.h,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           height: 36.h,
    //         ),
    //         Text(
    //           'About',
    //           style: kManRope_400_16_626A6A,
    //         ),
    //         SizedBox(
    //           height: 5.h,
    //         ),
    //         TextField(
    //           readOnly: isreadable? true:false,
    //           decoration: TextfieldDecoration(
    //               label: 'About',
    //               child: Image.asset(
    //                 "assets/images/editbutton.png",
    //                 height: 20,
    //               )).underlinefieldDecoration(),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Text(
    //           'Total exprience',
    //           style: kManRope_400_16_626A6A,
    //         ),
    //         SizedBox(
    //           height: 8.h,
    //         ),
    //         TextField(
    //           readOnly: isreadable? true:false,
    //           decoration: TextfieldDecoration(
    //               label: 'Total experience',
    //               child: Image.asset(
    //                 "assets/images/editbutton.png",
    //                 height: 20,
    //               )).underlinefieldDecoration(),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Text(
    //
    //           'Specialization',
    //           style: kManRope_400_16_626A6A,
    //         ),
    //         SizedBox(
    //           height: 8.h,
    //         ),
    //         TextField(
    //           readOnly: isreadable? true:false,
    //           onTap: () {
    //
    //             _SpecializationBottomSheet();
    //           },
    //           // readOnly: true,
    //           decoration: TextfieldDecoration(
    //               label: 'Specialization',
    //               child: Image.asset(
    //                 "assets/images/downarrowblack.png",
    //                 height: 5,
    //               )).underlinefieldDecoration(),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Text(
    //           'Language',
    //           style: kManRope_400_16_626A6A,
    //         ),
    //         SizedBox(
    //           height: 8.h,
    //         ),
    //         TextField(
    //           readOnly: isreadable? true:false,
    //           onTap: () {
    //             _LanguageBottomSheet();
    //           },
    //           // readOnly: true,
    //           decoration: TextfieldDecoration(
    //               label: 'Language',
    //               child: Image.asset(
    //                 "assets/images/downarrowblack.png",
    //                 height: 5,
    //               )).underlinefieldDecoration(),
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Text(
    //           'Pricing',
    //           style: kManRope_400_16_626A6A,
    //         ),
    //         SizedBox(height: 8.h),
    //
    //         Container(
    //           height: 39.h,
    //           decoration: BoxDecoration(
    //             color: kE2F2F4,
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //           ),
    //           child: TextField(
    //             decoration: TextfieldDecoration(label: 'Type Price Here').textfielde2f2f4Decoration(),
    //           )
    //         ),
    //         SizedBox(
    //           height: 40.h,
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(bottom: 20.h),
    //           child: Center(
    //             child: MainButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     isreadable = false;
    //
    //
    //
    //
    //                   });
    //                   // Navigator.push(
    //                   //   context,
    //                   //   MaterialPageRoute(builder: (context) =>  BasicDetails()),
    //                   // );
    //
    //                 },
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                       top: 16.h, bottom: 16.h, left: 63.w, right: 63.w),
    //                   child: isreadable ? Text(
    //                     "Edit",
    //                     style: kManRope_500_18_FFFFF,
    //                   ):
    //                   Text(
    //                     "Save",
    //                     style: kManRope_500_18_FFFFF,
    //                   ),
    //                 ),
    //                 color: k006D77,
    //                 shape: CustomDecoration().smallButtonDecoration()),
    //           ),
    //         )
    //         // Padding(
    //         //   padding: const EdgeInsets.only(bottom: 50.0),
    //         //   child: Center(
    //         //     child: MainButton(
    //         //         onPressed: () {
    //         //           Navigator.push(
    //         //             context,
    //         //             MaterialPageRoute(
    //         //                 builder: (context) => PsychologistEditDoctorInfo()),
    //         //           );
    //         //         },
    //         //         child: Padding(
    //         //           padding: const EdgeInsets.symmetric(
    //         //               horizontal: 63, vertical: 15),
    //         //           child: Text(
    //         //             "Save",
    //         //             style: kManRope_500_18_FFFFF,
    //         //           ),
    //         //         ),
    //         //         color: k006D77,
    //         //         shape: CustomDecoration().smallButtonDecoration()),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
