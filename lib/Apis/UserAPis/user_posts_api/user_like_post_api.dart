import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLikePostApi {
  Future<dynamic> get({required String postType, required int postId}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}post-like.php'));
    request.body = json.encode({"post_id": postId, "post_type": postType});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var val = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return val;
    } else {
      print(response.reasonPhrase);
      return val;
    }
  }
}
