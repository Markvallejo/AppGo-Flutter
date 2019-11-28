import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';

class DashboarDataRequest {}

Future<User> dashboardData() async {
  User user;
  user = new User();

  var response = await http
      .post(GENERATE_TOKEN_URL,
          headers: {
            "Content-Type": "application/json",
            "__RequestVerificationToken": getVerificationToken().toString(),
          },
          body: json.encode({
            'sDealerNumber': user.sDealerNumber,
            'sSalesManInfo': user.sSalesManInfo,
            'sIMEI': user.sIMEI
          }))
      .then((r) {
    return r;
  }).then((result) async {
    var token = json.decode(result.body);

    return await http.post(DASHBOARD_URL,
        headers: {
          "Content-Type": "application/json",
          "__RequestVerificationToken": getVerificationToken().toString(),
        },
        body: json.encode({
          'sDealerNumber': user.sDealerNumber,
          'sSalesManInfo': user.sSalesManInfo,
          'sIMEI': user.sIMEI,
          'token': token["TokenValor"],
        }));
  });
}
