import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddactivity.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_activity_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_activity_model.dart';
import 'package:greymatter/widgets/shared/buttons/costom_secondary_text_w_icon_button.dart';

class URecommendedActivities extends StatefulWidget {
  const URecommendedActivities({Key? key}) : super(key: key);

  @override
  State<URecommendedActivities> createState() => _URecommendedActivitiesState();
}

class _URecommendedActivitiesState extends State<URecommendedActivities> {
  int _index2 = 0;
  int _index = 0;

  List _bgImageActivitiesList = [
    'assets/images/activitycardbg.png',
    'assets/images/activitycardbg.png',
    'assets/images/activitycardbg.png',
  ];

  UserActivityModel modelUserActivity = UserActivityModel();
  List<UserActivityModel> userActivity = [];
  bool _isLoading = false;

  getActivityData() {
    _isLoading = true;
    final resp = UserActivityApi().get(scroll: '0');
    resp.then((value) {
      //print(value);
      setState(() {
        for (var v in value) {
          userActivity.add(UserActivityModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      width: 1.sw,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Column(
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
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return Container(
                  height: 87.h,
                  width: 248.w,
                  margin: EdgeInsets.only(left: 24.w),
                  decoration: BoxDecoration(
                    color: k5A72ED,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/backimg.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      userActivity[i].name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: kManRope_600_18_white,
                    ),
                  ),
                );
              },
              itemCount: 3,
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
