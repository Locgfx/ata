import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/activity_model.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/add_new_activity.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_activity_api.dart';
import 'package:greymatter/constants/Lists.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_activity_model.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

class UAddActivityScreen extends StatefulWidget {
  UAddActivityScreen({Key? key}) : super(key: key);

  @override
  State<UAddActivityScreen> createState() => _UAddActivityScreenState();
}

class _UAddActivityScreenState extends State<UAddActivityScreen> {
  List<ActivityValue> a = [];
  List dx = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  @override
  void initState() {
    getData();
    super.initState();
  }

  UserActivityModel model = UserActivityModel();
  List<UserActivityModel> modeluseractivity = [];
  bool _isLoading = false;
  bool _isLoading2 = false;

  getData() {
    _isLoading = true;
    final resp = UserActivityApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          modeluseractivity.add(UserActivityModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Scaffold(
          backgroundColor: kEDF6F9,
          appBar: CuswhiteAppBar(
              hasThreeDots: false,
              appBarText: 'All activities',
              imgPath: 'assets/images/iconbackappbar2.png'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 40.h,
              ),
              child: Column(
                children: [
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: false,
                    child: ListView.builder(
                      itemCount: modeluseractivity.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        for (int i = 0; i < activityList.length; i++) {
                          a.add(
                              ActivityValue(slide: false, name: activityList[i]));
                        }

                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Stack(
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  color: kBC5656,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(24)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  //margin: EdgeInsets.only(top: 16.h),
                                  width: 90.h,
                                  height: 88.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10)),
                                    color: kBC5656,
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset(
                                    'assets/images/bin.png',
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(dx[index], 0),
                                child: GestureDetector(
                                  onHorizontalDragUpdate: (v) {
                                    setState(() {
                                      dx[index] = (dx[index] + v.delta.dx)
                                          .clamp(0.0, 81.h);
                                      //print(_dx);
                                    });
                                  },
                                  child: Container(
                                    height: 88.h,
                                    // width: 380.w,
                                    // margin: EdgeInsets.only(left: 10, right: 10),
                                    // padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: k5A72ED,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Image.asset(
                                          'assets/images/backimg.png',
                                          fit: BoxFit.cover,
                                          height: 88.h,
                                          // width: 1.sw,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24.w),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200.w,
                                                child: TextField(
                                                  onChanged: (v) {
                                                    setState(() {
                                                      a[index].name = v;
                                                    });
                                                  },
                                                  style: kManRope_600_18_white,
                                                  cursorColor: Colors.white,
                                                  decoration: InputDecoration(
                                                    enabled: activityList[
                                                    index] ==
                                                        'Add Activity Name'
                                                        ? true
                                                        : false,
                                                    hintText: activityList[index],
                                                    hintStyle:
                                                    kManRope_600_18_white,
                                                    contentPadding:
                                                    EdgeInsets.zero,
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (a[index].name !=
                                                  'Add Activity Name' &&
                                                  a[index].name.isNotEmpty)
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddNewActivity(
                                                              text: activityList[
                                                              index] ==
                                                                  'Add Activity Name'
                                                                  ? ''
                                                                  : a[index].name,
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 48.h,
                                                    width: 70.w,
                                                    decoration:
                                                    const BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)),
                                                      color: Colors.white,
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        'assets/icons/plus-square.svg',
                                                        height: 24.h,
                                                        width: 24.w,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 163.h,
                  )
                ],
              ),
            ),
          ),
          /* bottomNavigationBar: Container(
          height: 100.h,
          padding: EdgeInsets.only(left: 102.w, right: 102.w, bottom: 40.h),
          child: SizedBox(
            height: 56.h,
            width: 223.w,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                setState(() {
                  activityList.add('Add Activity Name');
                });
          ),
        ),*/
        ),
        if (_isLoading) LoadingWidget(),

      ],
    );
    ;
  }
}
