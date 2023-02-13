import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/USeelAllVideosScreen.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UAllVideos extends StatefulWidget {
  const UAllVideos({Key? key}) : super(key: key);

  @override
  State<UAllVideos> createState() => _UAllVideosState();
}

class _UAllVideosState extends State<UAllVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
          hasThreeDots: false,
          appBarText: "All videos",
          imgPath: "assets/images/iconbackappbar2.png"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
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
                      )).searchFieldBigIconDecoration(),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending Videos',
                              style: kManRope_700_16_001314,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const USeeAllVideosScreen())),
                              child: Text(
                                'See all',
                                style: kManRope_500_16_006D77,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  })
            ],
          ) ,
        ),
      ),

    );
  }
}
