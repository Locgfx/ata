import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CouponAppliedApi {
  Future<dynamic> get({required String coupon, required String price}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}check-coupon.php'));
    request.fields.addAll({'coupon': coupon, 'price': price});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(headers);
    print(request.fields);

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      print(resp);
      print(response.reasonPhrase);
      return resp;
    } else {
      print(response.reasonPhrase);
      print(resp);
      return resp;
    }
  }
}
