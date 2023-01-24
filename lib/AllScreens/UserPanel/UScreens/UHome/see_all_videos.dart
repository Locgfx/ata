import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class SeeAllVideos extends StatelessWidget {
  const SeeAllVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(appBarText: "All videos", imgPath: "assets/images/iconbackappbar2.png"),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kFFFFFF,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: k5A72ED.withOpacity(0.24))
              ),
              child: TextField(
                decoration: TextfieldDecoration(label: 'Nauture',child:
                Image.asset("assets/images/iconsearchblue.png",height: 48.h,width: 48.w,)).searchFieldBigIconDecoration(),
              ),
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Nature',
            //     hintStyle: kManRope_400_14_626A6A,
            //     border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(16.0)),
            //     fillColor: Colors.white,
            //     filled: true,
            //     suffixIconConstraints:
            //         BoxConstraints(maxHeight: 48.h, maxWidth: 48.w),
            //     suffixIcon: Padding(
            //       padding: EdgeInsets.only(right: 16.w),
            //       child: SvgPicture.asset('assets/icons/search.svg'),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 40.h,
            ),
            SingleChildScrollView(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 25.h,
                    childAspectRatio: 0.95),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 160.h,
                        child: Container(
                          height: 182.h,
                          width: 182.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Image.asset(
                            'assets/images/videodemo1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Name xyz',
                        style: kManRope_500_16_001314,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
