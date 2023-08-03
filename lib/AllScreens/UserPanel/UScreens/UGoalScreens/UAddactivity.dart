import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UGoalScreens/UAddNewActivityScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_activity_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_home_models/user_activity_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../widgets/BottomSheets/DeleteBottomSheet.dart';

class UAddActivityScreen extends StatefulWidget {
  UAddActivityScreen({Key? key}) : super(key: key);

  @override
  State<UAddActivityScreen> createState() => _UAddActivityScreenState();
}

class _UAddActivityScreenState extends State<UAddActivityScreen> {
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

  int dataLength = 0;

  int _scroll = 0;
  getReloadedData() {
    _scroll++;
    // _isLoading = true;
    final resp = UserActivityApi().get(scroll: '$_scroll');
    resp.then((value) {
      debugPrint(value.toString());
      //modeluseractivity.clear();
      setState(() {
        dataLength = value.length;
        for (var v in value) {
          modeluseractivity.add(UserActivityModel.fromJson(v));
        }
        /*modeluseractivity.add(UserActivityModel(
            id: (value.length + 1).toString(), name: 'Add Activity Name'));*/
        //_isLoading = false;
      });
    });
  }

  getData() {
    _isLoading = true;
    final resp = UserActivityApi().get(scroll: '0');
    resp.then((value) {
      debugPrint(value.toString());
      modeluseractivity.clear();
      setState(() {
        dataLength = value.length;
        for (var v in value) {
          modeluseractivity.add(UserActivityModel.fromJson(v));
        }
        /*modeluseractivity.add(UserActivityModel(
            id: (value.length + 1).toString(), name: 'Add Activity Name'));*/
        _isLoading = false;
      });
    });
  }

  final customActivity = TextEditingController();

  void _uDeleteBottomsheet(int activityId, int removeIndex) {
    showModalBottomSheet(
        context: context,
        backgroundColor: kFFFFFF,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) => UDeleteBottomSheet(
              onPop: () {
                setState(() {
                  _isLoading = true;
                  //modeluseractivity.removeAt(removeIndex);
                  //dx[removeIndex] = 0.0;
                });
                getData();
                Fluttertoast.showToast(msg: "Activity removed.");
              },
              activityId: activityId,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kEDF6F9,
          appBar: CustomWhiteAppBar(
              hasThreeDots: false,
              appBarText: 'All Activities',
              imgPath: 'assets/images/iconbackappbar2.png'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 30.h,
              ),
              child: Column(
                children: [
                  LazyLoadScrollView(
                    onEndOfPage: () async {
                      if (dataLength >= 10) {
                        getReloadedData();
                      }
                    },
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: modeluseractivity.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Stack(
                              children: [
                                Container(
                                  height: 88.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      color: k5A72ED,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/backimg.png',
                                        ),
                                        fit: BoxFit.fitWidth,
                                      )),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
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
                                                //controller: customActivity,
                                                style: kManRope_600_18_white,
                                                cursorColor: Colors.white,
                                                decoration: InputDecoration(
                                                  enabled: false,
                                                  hintText:
                                                      modeluseractivity[index]
                                                          .name,
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
                                            GestureDetector(
                                              onTap: modeluseractivity[index]
                                                          .isAdded ==
                                                      0
                                                  ? () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              UAddNewActivityScreen(
                                                            activityImage:
                                                                modeluseractivity[
                                                                        index]
                                                                    .image!,
                                                            activityId:
                                                                modeluseractivity[
                                                                        index]
                                                                    .id!,
                                                            text: /*index <=modeluseractivity
                                                          ? customActivity
                                                              .text
                                                          : */
                                                                modeluseractivity[
                                                                        index]
                                                                    .name!,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  : () {
                                                      _uDeleteBottomsheet(
                                                          int.parse(
                                                              modeluseractivity[
                                                                      index]
                                                                  .id!),
                                                          index);
                                                    },
                                              child: Container(
                                                height: 48.h,
                                                width: 70.w,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child:
                                                      modeluseractivity[index]
                                                                  .isAdded ==
                                                              0
                                                          ? SvgPicture.asset(
                                                              'assets/icons/plus-square.svg',
                                                              height: 24.w,
                                                              width: 24.w,
                                                            )
                                                          : SvgPicture.asset(
                                                              'assets/icons/minus-square.svg',
                                                              height: 24.w,
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
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  /*Padding(
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
                        GestureDetector(
                          */ /*onHorizontalDragUpdate: (v) {
                                  setState(() {
                                    dx[index] = (dx[index] + v.delta.dx)
                                        .clamp(0.0, 70.w);
                                    //print(v.delta.dx);
                                    //print(dx[index]);
                                  });
                                  */ /* */ /*if (v.delta.dx > 0.0) {
                                    setState(() {
                                      dx[index] = 70.w;
                                    });
                                  } else */ /* */ /*
                                  if (v.delta.dx < 0.0) {
                                    setState(() {
                                      dx[index] = 0.0;
                                    });
                                  }
                                },*/ /*
                          child: Container(
                            height: 88.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: TextField(
                                          controller: customActivity,
                                          style: kManRope_600_18_white,
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            enabled: true,
                                            hintText: 'Add Activity Name',
                                            hintStyle: kManRope_600_18_white,
                                            contentPadding: EdgeInsets.zero,
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (customActivity.text.isEmpty) {
                                            Globals().showToast(
                                                'Please enter an activity name.');
                                          } else {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UAddNewActivityScreen(
                                                  activityImage: '',
                                                  activityId: '',
                                                  text: customActivity.text,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 48.h,
                                          width: 70.w,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              'assets/icons/plus-square.svg',
                                              height: 24.w,
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
                        )
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
        if (_isLoading) LoadingWidget(),
      ],
    );
    ;
  }
}
