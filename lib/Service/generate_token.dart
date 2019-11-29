import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';

Future generateToken(user) async {
  User user = new User();

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
    return r;
  }).then((result) {
    var token = json.decode(result.body);
    //print(token["TokenValor"]);
    return token["TokenValor"];
  });
}
