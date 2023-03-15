import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SaveBankDetails {
  Future<dynamic> get(
      {required String bankId,
      required String ifsc,
      required String accNumber,
      required String holderName,
      required String accType,
      required String branchName}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${counselorUrl}add-bank-details.php'));
    request.fields.addAll({
      'bank_id': bankId,
      'ifsc_code': ifsc,
      'account_number': accNumber,
      'account_holder_name': holderName,
      'account_type': accType,
      'branch_name': branchName
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return resp;
    }
  }
}
