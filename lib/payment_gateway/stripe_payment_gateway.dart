import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/payment_api/stripe_payment_api.dart';
import 'package:greymatter/payment_gateway/payment_keys.dart';

import '../Apis/payment_api/create_intent_api.dart';
import '../constants/colors.dart';

class StripeClass {
/*  Map<String, dynamic>? paymentIntentData;

  Future<dynamic> makePayment({required String amount}) async {
    bool _isSuccess = false;
    try {
      paymentIntentData = await StripeApi().createPaymentIntent(amount, "INR");
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret: secretKey,
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  //applePay: PaymentSheetApplePay.,
                  //googlePay: true,
                  //testEnv: true,
                  customFlow: true,
                  style: ThemeMode.dark,
                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'Ataraxis'))
          .then((value) {});
      _isSuccess = await displayPaymentSheet();
     return _isSuccess ? paymentIntentData : false;
    } catch (e, s) {
      print('Payment exception:$e$s');
      return false;
    }
  }

  Future<dynamic> displayPaymentSheet() async {
    String? id;
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        log('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        //Fluttertoast.showToast(msg: "Payment Successful");
        id = paymentIntentData!['id'];
       // paymentIntentData = null;
        return true;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
        return false;
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      return false;
    } catch (e) {
      print('$e');
      return false;
    }
    if(id != null){
      return true;
    }else{
      return false;
    }
  }*/

  Future<void> initPaymentSheet(dynamic data) async {
    try {
      // 1. create payment intent on the server
      //final data = await CreatePaymentIntent().get();

      // 2. initialize the payment sheet
      var gPay = PaymentSheetGooglePay(merchantCountryCode: "IN",currencyCode: "INR", testEnv: true);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          /*appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              background: kEDF6F9,
              primary: k006D77,
              componentBorder: Colors.red,
            ),
            shapes: PaymentSheetShape(
              borderWidth: 4,
              shadow: PaymentSheetShadowParams(color: Colors.red),
            ),
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              shapes: PaymentSheetPrimaryButtonShape(blurRadius: 8),
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: Color.fromARGB(255, 231, 235, 30),
                  text: Color.fromARGB(255, 235, 92, 30),
                  border: Color.fromARGB(255, 235, 92, 30),
                ),
              ),
            ),
          ),*/
          // Enable custom flow
          //customFlow: true,
          googlePay: gPay,
          // Main params
          merchantDisplayName: 'Ataraxis',
          paymentIntentClientSecret: data['paymentIntent'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['customer'],
          // Extra options
          /*testEnv: true,
          applePay: true,
          googlePay: true,*/
          style: ThemeMode.light,
          //merchantCountryCode: 'DE',
        ),
      );
      //Fluttertoast.showToast(msg: "Success 1");
      /*setState(() {
        _ready = true;
      });*/
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: Payment cancelled.");
      log(e.toString());
      rethrow;
    }
  }


}
