import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';

Future getVerificationToken() async {
  String token;
  var response = await http.get(
    API_URL,
    headers: {"Content-Type": "text/html; charsest=utf-8"},
  ).then((r) {
    return r.body;
  }).then((response) {
    var reg = new RegExp('value="([A-Za-z0-9_-]*)"');
    var res = reg.stringMatch(response);
    token = res.substring(6);
    // print("this is a Token: $token");
    return token;
  });
}
