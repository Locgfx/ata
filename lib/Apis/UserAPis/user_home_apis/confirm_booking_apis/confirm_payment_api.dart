import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';

class ConfirmPaymentApi{
  Future<dynamic> get({required String bookingId, required String orderId, required String transactionId, required String totalPayment})async{
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}booking-payment.php'));
    request.fields.addAll({
      'booking_id': bookingId,
      'order_id': orderId,
      'transaction_id': transactionId,
      'total_payment': totalPayment
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    }
    else {
      print(response.reasonPhrase);
      return resp;
    }

  }
}