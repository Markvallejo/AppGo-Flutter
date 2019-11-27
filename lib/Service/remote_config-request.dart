import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:appgo/Service/generate_token.dart';

Future<User> remoteConfig() async {
  var response = await http
      .post(
    REMOTE_CONFIG_URL,
    headers: {
      "Content-Type": "application/json",
      "__RequestVerificationToken": getVerificationToken().toString(),
    },
    body: json.encode({
      'token': generateToken().toString(),
    }),
  )
      .then((r) {
    return r.body;
  }).then((result) {
    var response = json.decode(result);
    if (response["Parametros"] == null) {
      print("Parametros is Empty $response");
      return response["Error"]["Description"];
    }
    print("Parametros is: ${response["Parametros"]}");
    return response["Parametros"];
  });
}
