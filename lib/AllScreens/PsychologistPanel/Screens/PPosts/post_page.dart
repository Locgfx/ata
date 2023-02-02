import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PPosts/psychologist_create_post.dart';

import '../../../../constants/colors.dart';
import '../../../UserPanel/UScreens/UPosts/post_view_container.dart';

class PsychologistPostPage extends StatefulWidget {
  const PsychologistPostPage({Key? key}) : super(key: key);

  @override
  State<PsychologistPostPage> createState() => _PsychologistPostPageState();
}

class _PsychologistPostPageState extends State<PsychologistPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.h, bottom: 159),
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
          SizedBox(height: 20.h),
          Positioned(
            bottom: 180,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PsychologistCreatePostScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/addPost_1.svg',
                height: 72.w,
                width: 72.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
