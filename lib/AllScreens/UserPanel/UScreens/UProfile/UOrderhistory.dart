import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UProfile/UInvoicedetails.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';

class UOrderHistory extends StatefulWidget {
  const UOrderHistory({Key? key}) : super(key: key);

  @override
  State<UOrderHistory> createState() => _UOrderHistoryState();
}

class _UOrderHistoryState extends State<UOrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBGColor,
      appBar: CuswhiteAppBar(
        imgPath: "assets/images/iconbackappbarlarge.png",
        appBarText: "Order History",
      ),
      body: Padding(
        padding:
        EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h, bottom: 20.h),
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  UInvoiceDetails()));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    // height: 144.h,
                    width: 1.sw,
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kWhiteBGColor,
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Stress',
                              style: kManRope_500_20_001314,
                            ),
                            Text(
                              'INR 399',
                              style: kManRope_400_16_626A6A,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Order  ID 09810745330001',
                          style: kManRope_400_14_001314,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10, June, 2022',
                              style: kManRope_400_16_626A6A,
                            ),
                            Text(
                              'Successful',
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
            itemCount: 10),
      ),
    );
  }
}
