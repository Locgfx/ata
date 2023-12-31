import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class UCreatePostScreen extends StatelessWidget {
  const UCreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        leadingWidth: 40.w,
        backgroundColor: Colors.white,
        title: Text(
          'Create post',
          style: kManRope_500_16_006D77,
        ),
        // titleSpacing: 18.w,
        leading: InkWell(
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
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/userP.png'),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SizedBox(
                    width: 90,
                    child: Text(
                      'Priya Singh',
                      overflow: TextOverflow.ellipsis,
                      style: kManRope_500_16_001314,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/icons/camera2.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  SvgPicture.asset(
                    'assets/icons/files.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  maxLines: 25,
                  style: kManRope_400_14_626A6A,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write here...',
                    hintStyle: kManRope_400_14_626A6A,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: SizedBox(
                  height: 56.h,
                  width: 182,
                  child: MaterialButton(
                    color: k006D77,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                    onPressed: () {},
                    child: Text(
                      'Post',
                      style: kManRope_400_16_white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
