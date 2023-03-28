import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/model/UModels/user_order_model/upcoming_orders.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class UserOrderHistoryApi {
  Future<dynamic> get({required int page, required String filter}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request('GET',
        Uri.parse('$baseUrl/order-history.php?filter_by=$filter&start=$page'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      //Fluttertoast.showToast(msg: resp.toString());
      return resp;
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<dynamic> getUpcoming({required int page}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/order-history.php?filter_by=u&start=$page'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var resp = jsonDecode(await response.stream.bytesToString());
    log(resp.toString());
    //print(resp);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      return UpcomingOrderData.fromList(resp);
    } else {
      //print(response.statusCode);
      return UpcomingOrderData(data: []);
    }
  }
}
