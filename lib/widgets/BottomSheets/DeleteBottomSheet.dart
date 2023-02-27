import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/Apis/UserAPis/user_goals_api/delete_goal_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/buttons.dart';

class UDeleteBottomSheet extends StatefulWidget {
  final int activityId;
  const UDeleteBottomSheet({Key? key, required this.activityId})
      : super(key: key);

  @override
  State<UDeleteBottomSheet> createState() => _UDeleteBottomSheet();
}

class _UDeleteBottomSheet extends State<UDeleteBottomSheet> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 170.h,
      child: Column(
        children: [
          Container(
            // height: 120.h,
            padding: EdgeInsets.only(top: 40.h),
            child: Column(
              children: [
                Text(
                  "Are you sure you want to delete this activity",
                  style: kManRope_500_14_686868,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Back",
                                style: kManRope_500_16_626A6A,
                              ),
                            ),
                            color: kFFFFFF,
                            shape:
                                CustomDecoration().button10outlineDecoration()),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: MainButton(
                            onPressed: () {
                              final resp = DeleteGoalApi()
                                  .get(activityId: widget.activityId);
                              resp.then((value) {});
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                "Delete",
                                style: kManRope_500_16_white,
                              ),
                            ),
                            color: kBC5656,
                            shape: CustomDecoration()
                                .button10BC5656outlineDecoration()),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
