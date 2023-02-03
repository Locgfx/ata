import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UprofileScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/user_change_password_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UChangePasswordScreen extends StatefulWidget {
  const UChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UChangePasswordScreen> createState() => _UChangePasswordScreenState();
}

class _UChangePasswordScreenState extends State<UChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 135.w, right: 135.w),
          child: SizedBox(
            height: 60.h,
            width: 168.w,
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final resp = UserChangePasswordApi().get(
                      oldPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text,
                      cNewPassword: confirmPasswordController.text);
                  resp.then((value) async {
                    print(value);
                    if (value['status'] == true) {
                      Fluttertoast.showToast(
                          msg: 'Password changed successfully');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UProfileScreen()));
                    } else {
                      Fluttertoast.showToast(msg: value['error']);
                      /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDashboard()),
                                    );*/
                    }
                  });
                }
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => PTabsScreen()));
              },
              color: k006D77,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(48)),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: kManRope_500_16_white,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: kEDF6F9,
        appBar: CuswhiteAppBar(
          hasThreeDots: false,
          appBarText: 'Change password',
          imgPath: 'assets/images/iconbackappbarlarge.png',
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 44.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Old password ',
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 47.h,
                  width: 1.sw,
                  child: TextField(
                    controller: oldPasswordController,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Enter New password',
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 47.h,
                  width: 1.sw,
                  child: TextField(
                    controller: newPasswordController,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Confirm new password',
                  style: kManRope_400_16_626A6A,
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 47.h,
                  width: 1.sw,
                  child: TextField(
                    controller: confirmPasswordController,
                  ),
                ),
                SizedBox(
                  height: 386.h,
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 20.h),
                //   child: Center(
                //     child: SizedBox(
                //       height: 60.h,
                //       width: 168.w,
                //       child: MaterialButton(
                //         onPressed: () {
                //           // Navigator.of(context).push(MaterialPageRoute(
                //           //     builder: (context) => PTabsScreen()));
                //         },
                //         color: k006D77,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(48)),
                //         ),
                //         child: Center(
                //           child: Text(
                //             'Save',
                //             style: kManRope_500_16_white,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
