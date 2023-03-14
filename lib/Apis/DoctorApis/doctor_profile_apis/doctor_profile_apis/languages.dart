import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;

class Languages {
  Future<dynamic> get() async {
    var request = http.Request('GET', Uri.parse('${baseUrl}languages.php'));

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else if (response.statusCode == 201) {
      return [];
    } else {
      print(response.reasonPhrase);
      return resp;
    }
  }
}
