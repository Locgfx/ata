import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../constants/fonts.dart';
import '../../../../widgets/buttons.dart';
import 'my_bonus.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  final couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: Platform.isAndroid
            ? SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              )
            : SystemUiOverlayStyle.dark,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          color: Colors.white,
          height: 48,
          padding: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    // behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      color: Colors.transparent,
                      child: Image.asset(
                        "assets/images/iconbackappbar2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Refer & Earn",
                    style: kManRope_500_16_006D77,
                    // textAlign: TextAlign.left,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyBonusScreen()));
                      },
                      child: Container(
                        child: Text(
                          "MY BONUS",
                          style: kManRope_500_16_006D77,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 91, right: 91),
                child: Image.asset("assets/images/Referimage.png"),
              ),
              Text(
                "Refer with your clients and get exciting rewards.",
                style: kManRope_500_16_263238,
              ),
              SizedBox(height: 10),
              Text(
                "On first successful booking via the refferal code the client will get 10% discount and you will get 10% cash reward.",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: kManRope_500_14_626A6A,
              ),
              SizedBox(height: 25),
              Container(
                height: 48,
                width: 1.sw,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: k006D77,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: couponController,
                  cursorColor: k006D77,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: "Enter Your Coupon",
                      suffix: Text(
                        "Tap to copy",
                        style: kManRope_400_14_006D77,
                      )),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "OR",
                style: kManRope_500_14_001314,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/iconinsta.png",
                    height: 44,
                    width: 44,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/iconwhatsapp.png",
                    height: 44,
                    width: 44,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/iconfb.png",
                    height: 44,
                    width: 44,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/iconshare.png",
                    height: 44,
                    width: 44,
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 56,
                width: 1.sw,
                child: MainButton(
                  onPressed: () {},
                  color: k006D77,
                  shape: CustomDecoration().border10Decoration(),
                  child: Text(
                    "INVITE NOW",
                    style: kManRope_500_16_white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
