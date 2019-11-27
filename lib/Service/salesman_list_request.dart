import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:appgo/Service/generate_token.dart';

Future<User> salesmanListRequest() async {
  User user;
  user = new User();

  var response = await http
      .post(SALESMAN_LIST_URL,
          headers: {
            "Content-Type": "application/json",
            "__RequestVerificationToken": getVerificationToken().toString(),
          },
          body: json.encode({
            'sDealerNumber': user.sDealerNumber,
            'sSalesManInfo': user.sSalesManInfo,
            'sIMEI': user.sIMEI,
            'token': generateToken().toString(),
          }))
      .then((r) {
    return r.body;
  }).then((result) {
    var response = json.decode(result);
    if (response["Vendedores"] == null) {
      print("Salesman Empty: $response");
      return response["Error"]["Descripcion"];
    }
    print("Salesman List: $result ");
    return response["Vendedores"];
  });
}
