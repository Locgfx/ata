import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteCommentApi {
  Future<dynamic> get(
      {required int commentId,
      required String postType,
      required String commentType}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'DELETE', Uri.parse('${counselorUrl}delete-my-comment.php'));
    request.body = commentType == "comment"
        ? json.encode({"comment_id": commentId, "post_type": postType})
        : json.encode({"comment_reply_id": commentId, "post_type": postType});
    request.headers.addAll(headers);

    log(request.body.toString());
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
