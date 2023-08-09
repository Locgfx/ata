import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/payment_api/apply_coupon.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/payment_gateway/stripe_payment_gateway.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

import '../../../../Apis/UserAPis/user_home_apis/confirm_booking_apis/confirm_instant_booking_api.dart';
import '../../../../Apis/payment_api/confirm_payment_api.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../UExploreScreens/UDoctorprofile.dart';
import 'UBookingSuccessfulScreen.dart';

class UConfirmBookingScreen extends StatefulWidget {
  UPsychologistModel model;
  UConfirmBookingScreen(
      {Key? key,
      required this.issue,
      required this.model,
      required this.bookingType,
      required this.issueId,
      required this.price})
      : super(key: key);
  final String issue;
  final String bookingType;
  final String issueId;
  final String price;

  @override
  State<UConfirmBookingScreen> createState() => _UConfirmBookingScreenState();
}

class _UConfirmBookingScreenState extends State<UConfirmBookingScreen> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();

  final TextEditingController _couponController = TextEditingController();

  String price = "";
  String couponButtonText = "Apply";
  bool couponEmpty = true;
  bool _isLoading = false;
  bool applied = false;
  bool _coupnLoading = false;
  final ConfettiController _confettiController = ConfettiController();

  @override
  void initState() {
    price = widget.model.price.toString();
    super.initState();
  }

  String _bookingId = '';
  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Confirm your booking',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: Stack(
        children: [
          Form(
            key: _fKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, top: 40.h, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected issue', style: kManRope_700_16_001314),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      widget.issue,
                      style: kManRope_500_16_006D77,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text('Selected Counsellors', style: kManRope_700_16_001314),
                    SizedBox(
                      height: 24.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UDoctorProfileScreen(
                                  bookingType: "i",
                                  showBookSession: false,
                                  issue: widget.issue,
                                  issueId: widget.issueId,
                                  psychologistData: widget.model,
                                )));
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 64.h,
                                    width: 64.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: kFFFFFF, width: 1),
                                      borderRadius: BorderRadius.circular(16),
                                      // image: DecorationImage(
                                      //   image: AssetImage('assets/images/userP.png'),fit: BoxFit.cover
                                      // )
                                    ),
                                    child: Image.network(
                                      widget.model.profilePhoto.toString(),
                                      errorBuilder: (q, w, e) => Image.asset(
                                        "assets/images/userP.png",
                                        fit: BoxFit.cover,
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.model.name.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: kManRope_400_16_001314,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      widget.model.education.toString(),
                                      style: kManRope_400_14_626A6A,
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    //StarWidget()
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/rightarrowcircle.png",
                              height: 48.h,
                              width: 48.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Text(
                      'Apply Coupon Code',
                      style: kManRope_700_16_001314,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      width: 380.w,
                      height: 48.h,
                      // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFB5BABA))),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 310.w,
                                child: TextFormField(
                                  onChanged: (val) {
                                    if (val.isNotEmpty) {
                                      setState(() {
                                        couponEmpty = false;
                                      });
                                    }
                                  },
                                  validator: (val) {
                                    if (_couponController.text.trim().isEmpty) {
                                      return 'This coupon code is invalid or has expired.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _couponController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: 'Coupon',
                                    hintStyle: kManRope_500_16_626A6A,
                                  ),
                                ),
                              ),
                              Container(
                                width: 1.w,
                                height: 58.h,
                                color: const Color(0xFFB5BABA),
                              ),
                              GestureDetector(
                                onTap: couponButtonText == "Applied"
                                    ? () {}
                                    : _couponController.text.isEmpty
                                        ? () {}
                                        : () {
                                            setState(() {
                                              _coupnLoading = true;
                                            });
                                            final resp = CouponAppliedApi().get(
                                                coupon: _couponController.text,
                                                price: widget.price);
                                            resp.then((value) {
                                              if (value["status"] == true) {
                                                setState(() {
                                                  price =
                                                      "${int.parse(widget.model.price.toString()) - int.parse(value["total_discount"])}";
                                                  applied = true;
                                                  _confettiController.play();
                                                  couponButtonText = "Applied";
                                                  Future.delayed(
                                                      Duration(seconds: 1), () {
                                                    _confettiController.stop();
                                                  });
                                                  _coupnLoading = false;
                                                });
                                              } else {
                                                setState(() {
                                                  Fluttertoast.showToast(
                                                      msg: value["error"]);
                                                  _coupnLoading = false;
                                                });
                                              }
                                            });
                                          },
                                child: SizedBox(
                                  width: 55.w,
                                  child: Center(
                                    child: _coupnLoading
                                        ? SpinKitThreeBounce(
                                            color: k006D77,
                                            size: 10,
                                          )
                                        : Text(
                                            couponButtonText,
                                            style: kManRope_500_16_006D77,
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          ConfettiWidget(
                            confettiController: _confettiController,
                            shouldLoop: false,
                            blastDirectionality: BlastDirectionality.explosive,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    if (applied)
                      Text(
                        "“Coupon code applied successfully”",
                        style: kManRope_400_10_006D77,
                      ),
                    SizedBox(
                      height: 239.h,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'You’ll be connected to the psychologist within 60',
                            style: kManRope_400_14_001314,
                          ),
                          Text(
                            'seconds after the payment',
                            style: kManRope_400_14_001314,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 83.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              // height:56.h,
                              child: Text(
                                '₹$price',
                                style: kManRope_500_20_006D77,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 56.h,
                              // width: 200,
                              child: MainButton(
                                color: k006D77,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  final resp = ConfirmInstantBookingApi().get(
                                    psychologistId:
                                        widget.model.psychologistId.toString(),
                                    issueId: widget.issueId,
                                    coupon:
                                        applied ? _couponController.text : "",
                                  );
                                  resp.then((value) async {
                                    log(value.toString());
                                    if (value['status'] == true) {
                                      _bookingId =
                                          value['booking_id'].toString();
                                      try {
                                        await StripeClass()
                                            .initPaymentSheet(value['payment'])
                                            .then((value2) async {
                                          await Stripe.instance
                                              .presentPaymentSheet()
                                              .then((value3) {
                                            final resp = ConfirmPaymentApi()
                                                .get(value['payment']
                                                    ['paymentIntent']);
                                            resp.then((value4) {
                                              if (value4['status'] == true) {
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                                log(_bookingId);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UInstantBookingSuccessfulScreen(
                                                              bookingId:
                                                                  _bookingId,
                                                              model:
                                                                  widget.model,
                                                            )));
                                              } else {
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg: value4['error']);
                                              }
                                            });
                                          }).onError((StripeException error,
                                                  stackTrace) {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                            Fluttertoast.showToast(
                                                msg: error.error.message
                                                    .toString());
                                            log("present error ${error.toString()}");
                                          });
                                        });
                                      } on StripeException catch (e) {
                                        log('Exception/DISPLAYPAYMENTSHEET==> $e');
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      } catch (e) {
                                        print('$e');
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg: value['error']);
                                    }
                                  });
                                },
                                child: Text(
                                  'Proceed to payment',
                                  style: kManRope_400_16_white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading) LoadingWidget(),
        ],
      ),
    );
  }
}
