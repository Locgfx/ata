import 'dart:convert';

import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;

class BankDetailsApi {
  Future<dynamic> get({
    required bankID,
    required ifscCode,
    required accountNumber,
    required accountHolderName,
    required accountType,
    required branchName,
  })async{
    String? cookie = UserPrefs().getCookies();
    var headers = {
      // 'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=b28e091994576ef0a9a75f328e848f05'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://beta.alfrik.com/ataraxis/api-psychologist/add-bank-details.php'));
    request.fields.addAll({
      'bank_id': bankID,
      'ifsc_code': ifscCode,
      'account_number': accountNumber,
      'account_holder_name': accountHolderName,
      'account_type': accountType,
      'branch_name': branchName,
    });
    request.headers.addAll(headers);
    print(request.fields);
    http.StreamedResponse response = await request.send();

    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}