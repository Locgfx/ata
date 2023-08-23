import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UInvoicedetails.dart';
import 'package:greymatter/Apis/UserAPis/user_profile_apis/order_history/order_history.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:intl/intl.dart';

import '../../../../model/UModels/user_profile_models/user_order_history.dart';
import '../../../../widgets/loadingWidget.dart';

class UOrderHistory extends StatefulWidget {
  const UOrderHistory({Key? key}) : super(key: key);

  @override
  State<UOrderHistory> createState() => _UOrderHistoryState();
}

class _UOrderHistoryState extends State<UOrderHistory> {
  getOrders() {
    return 0;
  }

  bool _isLoading = false;
  int scroll = 0;
  List<ProfileOrderHistoryModel> orderList = [];
  _getData() {
    _isLoading = true;
    final resp = ProfileOrderHistory().get(scroll: "0");
    resp.then((value) {
      // log(value.toString());
      setState(() {
        for (var v in value) {
          orderList.add(ProfileOrderHistoryModel.fromJson(v));
        }
        orderList.removeWhere(
            (element) => element.status.toString().toLowerCase() == 'u');
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        imgPath: "assets/images/iconbackappbarlarge.png",
        appBarText: "Order History",
      ),
      body: _isLoading
          ? Container(
              //padding: EdgeInsets.only(bottom: 159.0),
              child: LoadingWidget(),
            )
          : orderList.isEmpty
              ? Center(
                  child: Text(
                    'No appointments yet.',
                    style: kManRope_600_16_Black,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UInvoiceDetails(
                                      bookingId: orderList[index].id.toString(),
                                    )));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: index == 0 ? 40 : 0),
                            child: Container(
                              // height: 144.h,
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              width: 1.sw,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 20.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kEDF6F9,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 16,
                                    spreadRadius: 0,
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        orderList[index].name.toString(),
                                        style: kManRope_500_20_001314,
                                      ),
                                      Text(
                                        'INR ${orderList[index].pricing.toString()}',
                                        style: kManRope_400_16_626A6A,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'Order  ID ${orderList[index].id.toString()}',
                                    style: kManRope_400_14_001314,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat.yMMMEd().format(
                                            DateTime.parse(orderList[index]
                                                .date
                                                .toString())),
                                        style: kManRope_400_16_626A6A,
                                      ),
                                      orderList[index].status.toString() == "c"
                                          ? Text(
                                              'cancelled',
                                              style: kManRope_500_12_F8474E,
                                            )
                                          : Text(
                                              "successful",
                                              style: kManRope_500_12_006D77,
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return SizedBox(height: 20.h);
                      },
                      itemCount: orderList.length),
                ),
    );
  }
}
