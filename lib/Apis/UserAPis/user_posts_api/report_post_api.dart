import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class ReportPostApi {
  Future<dynamic> get(
      {required String postType,
      required String reportText,
      required int postId,
      required String commentedBy,
      required String replyBy,
      required String type}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}user_report.php'));
    request.body = type == "comment"
        ? json.encode({
            "comment_id": postId,
            "post_type": postType,
            "report": reportText,
            "commented_by": commentedBy
          })
        : type == "reply"
            ? json.encode({
                "creply_id": postId,
                "post_type": postType,
                "report": reportText,
                "commented_by": commentedBy,
                "reply_by": replyBy
              })
            : json.encode({
                "post_id": postId,
                "post_type": postType,
                "report": reportText
              });
    request.headers.addAll(headers);

    log("report post ${request.body}");
    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    log(resp.toString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return resp;
    }
  }
}
