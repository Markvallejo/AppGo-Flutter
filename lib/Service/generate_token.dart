import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';

Future<User> generateToken() async {
  User user;
  user = User();

  var response = await http
      .post(GENERATE_TOKEN_URL,
          headers: {
            "Content-Type": "application/json",
            "__RequestVerificationToken": getVerificationToken().toString(),
          },
          body: json.encode({
            'sDealerNumber': user.sDealerNumber,
            'sSalesManInfo': user.sSalesManInfo,
            'sIMEI': user.sIMEI,
          }))
      .then((r) {
    return r.body;
  }).then((response) {
    var token = json.decode(response);
    // print(token);
    return token;
  });
}
