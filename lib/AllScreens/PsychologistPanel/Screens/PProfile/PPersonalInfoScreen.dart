import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PEditBasicScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PProfile/PEditDoctorDetailsScreen.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Apis/UserAPis/user_profile_apis/user_profile_api.dart';
import '../../../../Apis/UserAPis/user_profile_apis/user_update_profile_pic_api.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/PModels/counselor_profile_model/counselor_profile_model.dart';

class PPersonalInfoScreen extends StatefulWidget {
  const PPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PPersonalInfoScreen> createState() => _PPersonalInfoScreenState();
}

class _PPersonalInfoScreenState extends State<PPersonalInfoScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  CounselorProfileModel model = CounselorProfileModel();
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = UserProfileApi().get();
    print(resp);
    resp.then((value) {
      log(value.toString());
      setState(() {
        try {
          model = CounselorProfileModel.fromJson(value);
          profilePic = model.photo.toString();
          _isLoading = false;
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  final ImagePicker _imgPicker = ImagePicker();
  File _pickedImage = File("");
  String profilePic = '';

  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldUnFocusOnTap(
      child: Scaffold(
        backgroundColor: kEDF6F9,
        appBar: CustomWhiteAppBar(
          hasThreeDots: false,
          appBarText: 'Account',
          imgPath: 'assets/images/iconbackappbarlarge.png',
        ),
        body: _isLoading
            ? Center(
                child: LoadingWidget(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            XFile? v = await _imgPicker.pickImage(
                                source: ImageSource.gallery);
                            if (v != null) {
                              setState(() {
                                _pickedImage = File(v.path);
                              });
                              final resp = UserUpdateProfilePic()
                                  .get(pickedImg: _pickedImage);
                              resp.then((value) {
                                if (value['status'] == true) {
                                  setState(() {
                                    profilePic = value['url'];
                                    Fluttertoast.showToast(
                                        msg: "Profile picture updated");
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Update failed. Please try again.");
                                }
                              });
                            }
                          },
                          child: Column(
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
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Image.network(
                                      profilePic,
                                      fit: BoxFit.cover,
                                      errorBuilder: (q, w, e) => Container(
                                        height: 102.h,
                                        width: 102.w,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/person-pngrepo-com.png"),
                                                fit: BoxFit.cover),
                                            color: kEDF6F9,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "Change Photo",
                                style: kManRope_500_16_404040,
                              ),
                            ],
                          ),
                        ),
                      ),
                      /*Center(
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
                      // clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF006D77),
                      ),
                      child: Image.network(
                        profilePic,
                        fit: BoxFit.cover,
                        errorBuilder: (q, w, e) => Container(
                          height: 102.h,
                          width: 102.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/person-pngrepo-com.png"),
                                  fit: BoxFit.cover),
                              color: kEDF6F9,
                              shape: BoxShape.circle),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                    ),
                  ),
                ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Center(
                        child: Text(
                          'Change Photo',
                          style: kManRope_500_16_404040,
                        ),
                      ),*/
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                flag = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Basic Details',
                                  style: flag
                                      ? kManRope_700_16_001314
                                      : kManRope_400_16_626A6A,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 1.5.h,
                                  width: 100.w,
                                  color: flag ? k006D77 : kEDF6F9,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 36.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                flag = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Psychologist Profile',
                                  style: flag
                                      ? kManRope_400_16_626A6A
                                      : kManRope_700_16_001314,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 1.5.h,
                                  width: 154.w,
                                  color: flag ? kEDF6F9 : k006D77,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      flag
                          ? PEditBasicDetailsScreen(
                              model: model,
                            )
                          : PEditDoctorProfileScreen(
                              model: model,
                            ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
