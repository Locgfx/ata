import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40.w,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Delete Account',
          style: kManRope_500_16_006D77,
        ),
        titleSpacing: 18.w,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'priyasingh344@gmail.com',
                style: kManRope_400_16_001314,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Password ',
                style: kManRope_400_16_626A6A,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 24,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'priyasingh344@1234',
                    hintStyle: kManRope_400_16_001314,
                  ),
                  style: kManRope_400_16_001314,
                ),
              ),
              /*Text(
                'priyasingh344@1234',
                style: kManRope_400_16_001314,
              ),*/
              SizedBox(
                height: 140.h,
              ),
              Text(
                '"When you delete your account, all the user generated content is normally erased (although there are small exceptions), while all the log data is preserved – forever." The preserved log data won\'t have your name attached to it',
                style: kManRope_400_14_626A6A,
              ),
              SizedBox(
                height: 136.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48.h,
                    width: 182.w,
                    child: MaterialButton(
                      elevation: 0,
                      color: kEDF6F9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: kEDF6F9),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: kManRope_400_16_001314,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 182.w,
                    child: MaterialButton(
                      elevation: 0,
                      color: kB64C4C,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: kB64C4C),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Delete account',
                        style: kManRope_400_16_white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
