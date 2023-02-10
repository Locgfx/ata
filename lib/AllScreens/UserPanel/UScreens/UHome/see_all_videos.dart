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
      backgroundColor: kEDF6F9,
      appBar: CuswhiteAppBar(
        hasThreeDots: false,
        appBarText: "All videos",
        imgPath: "assets/images/iconbackappbar2.png",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: ListView(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kFFFFFF,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: k5A72ED.withOpacity(0.24))),
              child: TextField(
                decoration: TextfieldDecoration(
                  label: 'Nature',
                  child: Image.asset(
                    "assets/images/iconsearchblue.png",
                    height: 48.h,
                    width: 48.w,
                  ),
                ).searchFieldBigIconDecoration(),
              ),
            ),
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
                    childAspectRatio: 0.8),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 182.w,
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
