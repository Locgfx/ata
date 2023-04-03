import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';
import '../../../../constants/urlconstants.dart';

class PostCommentApi {
  Future<dynamic> get(
      {required int postId,
      required String postType,
      required String comment}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request =
        http.Request('POST', Uri.parse('${counselorUrl}post-comment.php'));
    request.body = json
        .encode({"post_id": postId, "post_type": postType, "comment": comment});
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
