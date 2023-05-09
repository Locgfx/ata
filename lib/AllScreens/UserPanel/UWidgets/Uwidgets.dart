import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/UserAPis/rating_api/rating_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

class StarWidget extends StatelessWidget {
  final String rating;
  final String experience;
  StarWidget({Key? key, required this.rating, required this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/Star 1.png', width: 13.w, height: 13.w),
        SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text('$rating.0', style: kManRope_400_12_626A6A),
        ),
        SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            '.',
            style: kManRope_400_12_001314,
          ),
        ),
        SizedBox(width: 4.w),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text('$experience Yrs. Exp', style: kManRope_400_12_626A6A),
        )
      ],
    );
  }
}

class StarRatingWidget extends StatefulWidget {
  String bookingId;
  String rating;
  StarRatingWidget({Key? key, required this.bookingId, required this.rating})
      : super(key: key);

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool flag0 = false;

  int _rating = 1;
  _submitRating() {
    final resp = RatingApi()
        .get(rating: _rating.toString(), bookingId: widget.bookingId);
    resp.then((value) {
      if (value['status'] == true) {
      } else {
        Fluttertoast.showToast(msg: value["error"]);
      }
    });
  }

  @override
  void initState() {
    log(widget.rating.toString());
    _rating = int.parse(widget.rating);
    setRating(_rating);
    super.initState();
  }

  void setRating(int i) {
    if (i == 5) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = true;
        flag3 = true;
        flag4 = true;
        //_submitRating();
      });
    } else if (i == 4) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = true;
        flag3 = true;
        flag4 = false;
        //_submitRating();
      });
    } else if (i == 3) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = true;
        flag3 = false;
        flag4 = false;
        //_submitRating();
      });
    } else if (i == 2) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = false;
        flag3 = false;
        flag4 = false;
        // _submitRating();
      });
    } else if (i == 1) {
      setState(() {
        if (flag0 == false) {
          flag0 = true;
          flag1 = false;
          flag2 = false;
          flag3 = false;
          flag4 = false;
          // _submitRating();
        } else {
          flag0 = false;
          flag1 = false;
          flag2 = false;
          flag3 = false;
          flag4 = false;
        }
      });
    }
  }

  void rating(int i) {
    if (i == 5) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = true;
        flag3 = true;
        flag4 = true;
        _submitRating();
      });
    } else if (i == 4) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = true;
        flag3 = true;
        flag4 = false;
        _submitRating();
      });
    } else if (i == 3) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = true;
        flag3 = false;
        flag4 = false;
        _submitRating();
      });
    } else if (i == 2) {
      setState(() {
        flag0 = true;
        flag1 = true;
        flag2 = false;
        flag3 = false;
        flag4 = false;
        _submitRating();
      });
    } else if (i == 1) {
      setState(() {
        if (flag0 == false) {
          flag0 = true;
          flag1 = false;
          flag2 = false;
          flag3 = false;
          flag4 = false;
          _submitRating();
        } else {
          flag0 = false;
          flag1 = false;
          flag2 = false;
          flag3 = false;
          flag4 = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                _rating = 1;
              });
              rating(_rating);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(3),
              child: Image.asset(
                "assets/images/Star 1.png",
                color: flag0 ? Color(0xFFDFBE13) : Color(0xFF626A6A),
                height: 30.w,
                width: 30.w,
              ),
            )),
        GestureDetector(
            onTap: () {
              setState(() {
                _rating = 2;
              });
              rating(_rating);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(3),
              child: Image.asset(
                "assets/images/Star 1.png",
                color: flag1 ? Color(0xFFDFBE13) : Color(0xFF626A6A),
                height: 30.w,
                width: 30.w,
              ),
            )),
        GestureDetector(
            onTap: () {
              setState(() {
                _rating = 3;
              });
              rating(_rating);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(3),
              child: Image.asset(
                "assets/images/Star 1.png",
                color: flag2 ? Color(0xFFDFBE13) : Color(0xFF626A6A),
                height: 30.w,
                width: 30.w,
              ),
            )),
        GestureDetector(
          onTap: () {
            setState(() {
              _rating = 4;
            });
            rating(_rating);
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(3),
            child: Image.asset(
              "assets/images/Star 1.png",
              color: flag3 ? Color(0xFFDFBE13) : Color(0xFF626A6A),
              height: 30.w,
              width: 30.w,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _rating = 5;
            });
            rating(_rating);
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(3),
            child: Image.asset(
              "assets/images/Star 1.png",
              color: flag4 ? Color(0xFFDFBE13) : Color(0xFF626A6A),
              height: 30.w,
              width: 30.w,
            ),
          ),
        ),
      ],
    );
  }
}

class DoctorDetailsCard extends StatelessWidget {
  final String imgPath;
  final String text;
  final String title;

  DoctorDetailsCard({
    required this.imgPath,
    required this.text,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 68.h,
      // width: 120.w,
      decoration: const BoxDecoration(
        color: kD4EAEB,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  imgPath,
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  text,
                  style: kManRope_500_16_626A6A,
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title,
              style: kManRope_400_14_626A6A,
            ),
          ],
        ),
      ),
    );
  }
}

class BlackUnderline extends StatelessWidget {
  const BlackUnderline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.4,
      width: 1.sw,
      color: kB5BABA,
    );
  }
}
