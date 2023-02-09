
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UWidgets/Uwidgets.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_profile_api.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_profile_update_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_profile_models/user_profile_model.dart';
import 'package:greymatter/widgets/BottomSheets.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/custom_active_text_button.dart';


class UserPersonalInfoScreen extends StatefulWidget {
  const UserPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserPersonalInfoScreen> createState() => _UserPersonalInfoScreenState();
}

class _UserPersonalInfoScreenState extends State<UserPersonalInfoScreen> {
  // void _selectGenderBottomSheet() {
  //   showModalBottomSheet(
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //       ),
  //       context: context,
  //       builder: (context) => const SelectGenderBottomSheet());
  // }

  void _relationStatusBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 71.h,
                decoration: const BoxDecoration(
                  color: k006D77,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    'Relationship Status',
                    style: kManRope_700_20_white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      relationshipValue ='Single';
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 123.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 0 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'Single',
                            style: _gIndex == 0
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 1;
                      relationshipValue ='Married';
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 123.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 1 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'Married',
                            style: _gIndex == 1
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 2;
                      relationshipValue ='Other';
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 123.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 2 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'Other',
                            style: _gIndex == 2
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }

  void _occupationBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 71.h,
                decoration: const BoxDecoration(
                  color: k006D77,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    'Select Occupation',
                    style: kManRope_700_20_white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 0;
                      occupationValue = 'Student';
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 123.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 0 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'Student',
                            style: _gIndex == 0
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 1;
                      occupationValue = 'Working';
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 123.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 1 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'Working',
                            style: _gIndex == 1
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _gIndex = 2;
                      occupationValue = 'Other';
                      Navigator.of(context).pop();
                    }),
                    child: Container(
                      height: 44.h,
                      width: 123.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: _gIndex == 2 ? k006D77 : Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            'Other',
                            style: _gIndex == 2
                                ? kManRope_500_16_white
                                : kManRope_500_16_626A6A,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ],
          ),
        ),);
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
  void initState() {
    _getData();
    super.initState();
  }

  UserProfileModel model = UserProfileModel();
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = UserProfileApi().get();
    print(resp);
    resp.then((value) {
      print(value);
      setState(() {
        try {
          model = UserProfileModel.fromJson(value);
          print(model);
          _isLoading = false;
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

//---------------------------------------------
//   Update Api
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateDobController = TextEditingController();
  TextEditingController updateGenderController = TextEditingController();
  TextEditingController updaterRelationshipController = TextEditingController();
  TextEditingController updateOccupationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File imageFile = File('');

  String genderValue = 'Male';
  String relationshipValue = 'Single';
  String occupationValue = 'Student';

  int _gIndex = 0;

  bool nameEmpty = true;
  bool dobEmpty = true;
  bool genderEmpty = true;
  bool relationshipEmpty = true;
  bool occupationEmpty = true;

  bool hasNameFocus = false;
  bool hasDobFocus = false;
  bool hasGenderFocus = false;
  bool hasRelationShipFocus = false;
  bool hasOccupationFocus = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Scaffold(
        backgroundColor: kEDF6F9,
        appBar: CuswhiteAppBar(
            hasThreeDots: false,
            appBarText: "Account",
            imgPath: "assets/images/iconbackappbar2.png"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: isreadable
                ? Column(
              children: [
                Column(
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
                          child: Image.network(
                            model.photo.toString(),
                            errorBuilder: (q, w, e) => Container(
                              height: 102.h,
                              width: 102.w,
                              decoration:  BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/images/person-pngrepo-com.png"),
                                      fit: BoxFit.cover),
                                  color: kEDF6F9, shape: BoxShape.circle),
                            ),
                          ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isLoading ? SizedBox() :Text(
                              model.name.toString(),
                              style: kManRope_400_16_001314,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "Date of birth",
                          style: kManRope_400_16_626A6A,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isLoading ? SizedBox() : Text(
                              // groupName == null ? '' : groupName

                              model.dob.toString() ,
                              style: kManRope_400_16_001314,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'Gender',
                          style: kManRope_400_16_626A6A,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isLoading ? SizedBox() :Text(
                              model.gender.toString(),
                              style: kManRope_400_16_001314,
                            ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isLoading ? SizedBox() : Text(
                              model.relationshipStatus.toString(),
                              style: kManRope_400_16_001314,
                            ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isLoading ? SizedBox() :Text(
                              model.occupation.toString(),
                              style: kManRope_400_16_001314,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 104.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height:56.h,
                                  child: MainButton(
                                      color: k006D77,
                                      onPressed: () {
                                        setState(() {
                                          isreadable = false;
                                        });
                                      },
                                      child:
                                           Text(
                                        "Edit",
                                        style: kManRope_500_18_FFFFF,
                                      ),


                                      shape:
                                      CustomDecoration().smallButton10Decoration()),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
                : Form(
                   key:_formKey,
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(
                    height: 43.h,
                  ),
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
                                color: Color(0xFF006D77),
                                shape: BoxShape.circle),
                            child: Image.asset('assets/images/userP.png'),
                            clipBehavior: Clip.hardEdge,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Change Photo",
                          style: kManRope_500_16_404040,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(height: 8.h),
                              SizedBox(
                                // color: Colors.red,
                                width: 335.w,
                                child: TextFormField(
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        setState(() {
                                          nameEmpty= false;
                                          hasNameFocus= true;
                                        });
                                      }
                                      if (val.isEmpty) {
                                        setState(() {
                                          nameEmpty = true;
                                          hasNameFocus = false;
                                        });
                                      }
                                    },
                                    // validator: (name) {
                                    //   if (name == null || name.isEmpty) {
                                    //     return 'Enter your name';
                                    //   }
                                    // },
                                    controller: updateNameController ,
                                    style: kManRope_400_16_001314,
                                    // readOnly: true,
                                    onTap: () {},
                                    decoration: TextfieldDecoration(
                                        label: 'Enter your Name')
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date of birth',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextFormField(
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        setState(() {
                                          dobEmpty= false;
                                          hasDobFocus= true;
                                        });
                                      }
                                      if (val.isEmpty) {
                                        setState(() {
                                          dobEmpty = true;
                                          hasDobFocus = false;
                                        });
                                      }
                                    },
                                    // validator: (dob) {
                                    //   if (dob == null || dob.isEmpty) {
                                    //     return 'Enter your Dob';
                                    //   }
                                    // },

                                    controller: updateDobController,
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      _datePickerBottomSheet();
                                    },
                                    decoration: TextfieldDecoration(
                                        label: '25/02/1993')
                                        .textfieldProfileDecoration()),
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
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Gender', style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextFormField(
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        setState(() {
                                          genderEmpty= false;
                                          hasGenderFocus= true;
                                        });
                                      }
                                      if (val.isEmpty) {
                                        setState(() {
                                          genderEmpty = true;
                                          hasGenderFocus = false;
                                        });
                                      }
                                    },
                                    // validator: (val) {
                                    //   if (val == null || val.isEmpty) {
                                    //     return 'Enter your Gender';
                                    //   }
                                    // },

                                    controller: updateGenderController,
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      setState(() {
                                      });

                                    },
                                    decoration:
                                    TextfieldDecoration(label: genderValue)
                                        .textfieldProfileDecoration()),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {


                              });
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                ),
                                context: context,
                                builder: (context) =>  SingleChildScrollView(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      // color: k006D77,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                    ),
                                    // height: 259.h,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 71.h,
                                          decoration: const BoxDecoration(
                                            color: k006D77,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Select Gender',
                                              style: kManRope_700_20_white,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () => setState(() {
                                                  _gIndex = 0;
                                                  genderValue ='Male';
                                                  Navigator.of(context).pop();
                                                }),
                                                child: Container(
                                                  height: 44.h,
                                                  width: 78.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(Radius.circular(5)),
                                                    color: _gIndex == 0 ? k006D77 : Colors.transparent,
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                        'Male',
                                                        style: _gIndex == 0
                                                            ? kManRope_500_16_white
                                                            : kManRope_500_16_626A6A,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              GestureDetector(
                                                onTap: () => setState(() {
                                                  genderValue ='Female';
                                                  _gIndex = 1;
                                                  Navigator.of(context).pop();
                                                }),
                                                child: Container(
                                                  height: 44.h,
                                                  width: 78.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(Radius.circular(5)),
                                                    color: _gIndex == 1 ? k006D77 : Colors.transparent,
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                        'Female',
                                                        style: _gIndex == 1
                                                            ? kManRope_500_16_white
                                                            : kManRope_500_16_626A6A,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              GestureDetector(
                                                onTap: () => setState(() {
                                                  genderValue ='Other';
                                                  _gIndex = 2;
                                                  Navigator.of(context).pop();
                                                }),
                                                child: Container(
                                                  height: 44.h,
                                                  width: 78.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(Radius.circular(5)),
                                                    color: _gIndex == 2 ? k006D77 : Colors.transparent,
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                        'Others',
                                                        style: _gIndex == 2
                                                            ? kManRope_500_16_white
                                                            : kManRope_500_16_626A6A,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              // color: Colors.red,
                                height: 48,
                                width: 48,
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Relationship status',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextFormField(
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        setState(() {
                                          relationshipEmpty= false;
                                          hasRelationShipFocus= true;
                                        });
                                      }
                                      if (val.isEmpty) {
                                        setState(() {
                                          relationshipEmpty = true;
                                          hasRelationShipFocus = false;
                                        });
                                      }
                                    },
                                    // validator: (val) {
                                    //   if (val == null || val.isEmpty) {
                                    //     return 'Enter your Relationship Status';
                                    //   }
                                    // },
                                    controller: updaterRelationshipController,
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                    },
                                    decoration:
                                    TextfieldDecoration(label: relationshipValue)
                                        .textfieldProfileDecoration()),
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
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Occupation',
                                  style: kManRope_400_16_626A6A),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                // color: Colors.red,
                                width: 320.w,
                                child: TextFormField(
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        setState(() {
                                          occupationEmpty= false;
                                          hasOccupationFocus= true;
                                        });
                                      }
                                      if (val.isEmpty) {
                                        setState(() {
                                          occupationEmpty = true;
                                          hasOccupationFocus = false;
                                        });
                                      }
                                    },
                                    // validator: (val) {
                                    //   if (val == null || val.isEmpty) {
                                    //     return 'Enter your Occupation';
                                    //   }
                                    // },

                                    controller: updateOccupationController,
                                    style: kManRope_400_16_001314,
                                    readOnly: true,
                                    onTap: () {
                                      // _occupationBottomSheet();
                                    },
                                    decoration:
                                    TextfieldDecoration(label: occupationValue)
                                        .textfieldProfileDecoration()),
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
                                child: Image.asset(
                                  "assets/images/icondropdownlargee.png",
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlackUnderline(),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                // nameEmpty?
                // CustomDeactiveTextButton(onPressed: () {}, text: 'Enter your Details'):
                //         genderEmpty?
                //         CustomDeactiveTextButton(onPressed: () {}, text: 'Enter your Details'):
                //             relationshipEmpty?
                //             CustomDeactiveTextButton(onPressed: () {}, text: 'Enter your Details'):
                //                 occupationEmpty?
                //                 CustomDeactiveTextButton(onPressed: () {}, text: 'Enter your Details'):
                                    CustomActiveTextButton(onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        final resp = UserProfileUpdateApi().get(
                                          name: updateNameController.text,
                                          dob: updateDobController.text,
                                          gender: updateGenderController.text,
                                          relationshipStatus: updaterRelationshipController.text,
                                          occupation:updateOccupationController.text,
                                        );
                                        resp.then((value) {
                                          print(value);
                                          if
                                          (value['status'] == true) {
                                            Fluttertoast.showToast(
                                                msg: 'Profile Setup Successful');
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //     builder: (context) => UProfileScreen())
                                            // );
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: value['error']);

                                          }
                                        });
                                      }
                                    }, text: 'Save',),
              ],
            ),
                ),
          ),
        ),
      ),
        if (_isLoading) LoadingWidget(),
      ],
    );
  }
}
