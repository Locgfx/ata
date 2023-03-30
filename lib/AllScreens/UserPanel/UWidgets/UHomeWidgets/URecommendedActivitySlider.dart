import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_activity_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_activity_model.dart';

class RecommendedActivitiesSlider extends StatefulWidget {
  const RecommendedActivitiesSlider({Key? key}) : super(key: key);

  @override
  State<RecommendedActivitiesSlider> createState() =>
      _RecommendedActivitiesSliderState();
}

class _RecommendedActivitiesSliderState
    extends State<RecommendedActivitiesSlider> {
  UserActivityModel modelUserActivity = UserActivityModel();
  List<UserActivityModel> userActivity = [];

  bool isLoading = false;

  getActivityData() {
    isLoading = true;
    final resp = UserActivityApi().get(scroll: '0');
    resp.then((value) {
      //print(value);
      setState(() {
        for (var v in value) {
          userActivity.add(UserActivityModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
