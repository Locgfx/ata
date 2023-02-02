import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UPosts/post_view_container.dart';

import '../../../../constants/colors.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.h, bottom: 235.h),
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 40 : 0),
                    child: PostViewContainer(isCommentsViewable: true),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(height: 40.h);
                },
                itemCount: 10),
          ),
          // Positioned(
          //   bottom: 120.h,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => PsychologistCreatePostScreen()));
          //     },
          //     child: SvgPicture.asset(
          //       'assets/icons/addPost_1.svg',
          //       height: 72.h,
          //       width: 72.w,
          //     ),
          //   ),
          // ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
