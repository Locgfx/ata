import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';
import '../../../constants/urlconstants.dart';

Future sendQuestionsData() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().cookie);
  var ans1 = prefs.getString(Keys().identity)!;
  var ans2 = prefs.getString(Keys().physicalHealth)!;
  var ans3 = prefs.getString(Keys().mentalHealth)!;
  var ans4 = prefs.getString(Keys().mentalHealthPeace)!;
  var ans5 = prefs.getString(Keys().lowTime)!;
  var ans6 = prefs.getString(Keys().emotionDay)!;
  var ans7 = prefs.getString(Keys().isHappy)!;
  var ans8 = prefs.getString(Keys().mentalDiagnosis)!;
  var ans9 = prefs.getString(Keys().lineageProblem)!;

  var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  var request = http.Request('POST', Uri.parse('$baseUrl/add-ques.php'));
  request.body = json.encode({
    "ques1": ans1,
    "ques2": ans2,
    "ques3": ans3,
    "ques4": ans4,
    "ques5": ans5,
    "ques6": ans6,
    "ques7": ans7,
    "ques8": ans8,
    "ques9": ans9,
    "ques10": "",
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    Globals().showToast(resp['message']);
    return resp['status'];
  } else {
    Globals().showToast(resp['message']);
    print(response.reasonPhrase);
    return false;
  }
}
