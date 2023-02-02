import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddactivity.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';

class RecommendedActivities extends StatefulWidget {
  const RecommendedActivities({Key? key}) : super(key: key);

  @override
  State<RecommendedActivities> createState() => _RecommendedVideosState();
}

class _RecommendedVideosState extends State<RecommendedActivities> {
  int _index2 = 0;
  int _index = 0;

  List _bgImageActivitiesList = [
    'assets/images/activitycardbg.png',
    'assets/images/activitycardbg.png',
    'assets/images/activitycardbg.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended activities',
                  style: kManRope_700_16_001314,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Boost your energy',
                  style: kManRope_400_16_626A64_07,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 87.h,
            // width: 1.sw,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return Container(
                  height: 87.h,
                  width: 248.w,
                  margin: EdgeInsets.only(left: 24.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          _bgImageActivitiesList[i],
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      'Nature',
                      overflow: TextOverflow.ellipsis,
                      style: kManRope_600_18_white,
                    ),
                  ),
                );
              },
              itemCount: _bgImageActivitiesList.length,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              width: 1.sw,
              height: 56.h,
              child: CustomSecondaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UAddActivityScreen()));
                },
                text: 'View All Activities',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AllActivities extends StatefulWidget {
  const AllActivities({Key? key}) : super(key: key);

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
