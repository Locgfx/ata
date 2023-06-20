import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PEarningHistoryScreen.dart';
import 'package:greymatter/AllScreens/PsychologistPanel/Screens/PEarning/PWithdrawEarningScreen.dart';
import 'package:greymatter/Apis/DoctorApis/earning_apis/last_transactions_api.dart';
import 'package:greymatter/Apis/DoctorApis/earning_apis/total_earnings_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/model/PModels/home_models/earning_models/last_transactions_model.dart';
import 'package:greymatter/model/PModels/home_models/earning_models/total_earnings_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shimmerLoader.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/fonts.dart';
import '../../../../constants/globals.dart';
import '../../../../widgets/BottomSheets/FilterBottomSheet.dart';
import 'PWithdrawEarning2Screen.dart';

class PMyEarningsScreen extends StatefulWidget {
  const PMyEarningsScreen({Key? key}) : super(key: key);

  @override
  State<PMyEarningsScreen> createState() => _PMyEarningsScreenState();
}

class _PMyEarningsScreenState extends State<PMyEarningsScreen> {
  @override
  void initState() {
    getPrefs();
    _getTotalEarnings();
    _getData();
    super.initState();
  }

  bool _isLoading = false;
  LastTransactionsModel model = LastTransactionsModel();

  TotalEarningsModel earningsModel = TotalEarningsModel();
  String filter = '';

  bool _earningsLoading = false;
  _getTotalEarnings() {
    _earningsLoading = true;
    final resp = TotalEarningApi().get(filter: filter);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == true) {
        log("message");
        setState(() {
          earningsModel = TotalEarningsModel.fromJson(value);
          _earningsLoading = false;
        });
      } else {
        setState(() {
          log("me");
          _earningsLoading = false;
        });
      }
    });
  }

  _getData() {
    _isLoading = true;
    final resp = LastTransactionsApi().get(search: '', filter: '');
    resp.then((value) {
      if (value['status'] == true) {
        setState(() {
          model = LastTransactionsModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _filterbottomsheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => FilterBottomSheet(onPop: (val) {
              setState(() {
                _earningsLoading = true;
                filter = val;
              });
              _getTotalEarnings();
            }));
  }

  String userName = '';
  getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    String a = prefs.getString(Keys().userName)!;
    setState(() {
      userName = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: HomeAppBar(
        color: kEDF6F9,
        text: Text(
          "Good ${DateTime.now().hour < 12 ? 'Morning' : DateTime.now().hour > 12 && DateTime.now().hour < 15 ? 'Afternoon' : 'Evening'}, ${userName != '' ? userName : 'User'}",
          style: kManRope_700_20_686868,
        ),
        child: Image.asset(
          'assets/images/iconnotificationlarge.png',
          width: 48.w,
          height: 48.w,
          // color: imagecolor,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _earningsLoading
                  ? Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: ShimmerLoader(height: 173),
                    )
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 24.w, right: 24.w, top: 30.h),
                      child: Container(
                        // height: 173.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 0.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filter == "w"
                                        ? "This Week"
                                        : filter == "m"
                                            ? "This Month"
                                            : filter == "y"
                                                ? "This Year"
                                                : 'Total',
                                    style: kManRope_500_16_001314,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _filterbottomsheet();
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 16, top: 16, bottom: 16),
                                      child: SvgPicture.asset(
                                        'assets/icons/downArrow.svg',
                                        height: 24.h,
                                        width: 24.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 1.5,
                                width: 1.sw,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Earning',
                                        style: kManRope_700_20_001314,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        earningsModel.allEarning.toString(),
                                        style: kManRope_500_16_626A6A,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Order',
                                        style: kManRope_700_20_001314,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        earningsModel.order!.toString(),
                                        style: kManRope_500_16_626A6A,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 40.h,
              ),
              _earningsLoading
                  ? Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: ShimmerLoader(height: 173),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Container(
                        // height: 173.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 24.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Earning',
                                        style: kManRope_700_20_001314,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        earningsModel.fixAmount.toString(),
                                        style: kManRope_500_16_626A6A,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (earningsModel.bankStatus! == 0) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PWithDrawEarningsScreen(
                                                      currentBalance:
                                                          earningsModel
                                                              .currentBalance
                                                              .toString(),
                                                    )));
                                      } else {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PWithDrawEarningsScreen2(
                                                      currentBalance:
                                                          earningsModel
                                                              .currentBalance
                                                              .toString(),
                                                    )));
                                      }
                                    },
                                    child: Text(
                                      'WITHDRAW',
                                      style: kManRope_600_18_006D77,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Container(
                                height: 1.5,
                                width: 1.sw,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 19.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'History',
                                    style: kManRope_500_18_001314,
                                  ),
                                  GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PEarningHistoryScreen()));
                                    },
                                    child: Image.asset(
                                      'assets/images/iconrightarrow.png',
                                      height: 24.h,
                                      width: 24.w,
                                      color: k006D77,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 27.h),
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  'Last 5 Transaction',
                  style: kManRope_500_18_001314,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 40.h,
                width: 1.sw,
                color: kD6EAF0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 69.w,
                        // height: 16.h,
                        child: Text(
                          'Date',
                          style: kManRope_500_14_263238,
                        ),
                      ),
                      SizedBox(
                        width: 78.w,
                      ),
                      SizedBox(
                        width: 100.w,
                        // height: 16.h,
                        child: Text(
                          'Transaction No',
                          style: kManRope_500_14_263238,
                        ),
                      ),
                      SizedBox(
                        width: 78.w,
                      ),
                      SizedBox(
                        width: 53.w,
                        // height: 16.h,
                        child: Text(
                          'Amount',
                          style: kManRope_500_14_263238,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.h,
                ),
                child: _isLoading
                    ? Center(
                        child: SizedBox(
                            height: 100, width: 100, child: LoadingWidget()))
                    : model.allTransaction!.isEmpty
                        ? Center(
                            child: Text("No transaction available"),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 75.w,
                                        // height: 16.h,
                                        child: Text(
                                          DateFormat("dd.MM.yyyy").format(
                                              DateTime.parse(model
                                                  .allTransaction![index]
                                                  .dateTime!)),
                                          style: kManRope_400_14_626A6A,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 72.w,
                                      ),
                                      InkWell(
                                        onLongPress: () {
                                          Clipboard.setData(ClipboardData(
                                                  text: model
                                                      .allTransaction![index]
                                                      .transactionId
                                                      .toString()))
                                              .then((value) {
                                            /*Fluttertoast.showToast(
                                            msg: "ID copied to clipboard");*/
                                          });
                                        },
                                        child: SizedBox(
                                          width: 100.w,
                                          // height: 16.h,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              model.allTransaction![index]
                                                  .transactionId
                                                  .toString(),
                                              style: kManRope_400_16_626A6A,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 78.w,
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                        // height: 16.h,
                                        child: Text(
                                          model.allTransaction![index]
                                              .totalPayment
                                              .toString(),
                                          style: kManRope_400_16_626A6A,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return SizedBox(height: 29.h);
                            },
                            itemCount: model.allTransaction!.length > 5
                                ? 5
                                : model.allTransaction!.length),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
