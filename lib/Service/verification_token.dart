import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

Future getVerificationToken() async {
  String token;
  var connection = await connectionType().then((res) {
    if (res == ConnectivityResult.none.toString()) {
      return CONNECTION_ERROR;
    } else {
      var response = http.get(
        API_URL,
        headers: {"Content-Type": "text/html; charsest=utf-8"},
      ).then((r) {
        return r.body;
      }).then((response) {
        var reg = new RegExp('value="([A-Za-z0-9_-]*)"');
        var res = reg.firstMatch(response);
        token = res.group(1);
        //print("this is a Token: $token");
        return token;
      });
      return response;
    }
  });
  return connection;
}
