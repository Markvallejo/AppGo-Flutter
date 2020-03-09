import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';

class IGetFAQs {
  String sDealerNumber;
  String sSalesManInfo;
  String sIMEI;
}

Future getFAQs() async {
  User user = new User();
  var data = await http
      .post(
    GENERATE_TOKEN_URL,
    headers: {
      "Content-Type": "application/json",
      "__RequestVerificationToken": getVerificationToken().toString(),
    },
    body: json.encode({
      'sDealerNumber': user.sDealerNumber,
      'sSalesManInfo': user.sSalesManInfo,
      'sIMEI': user.sIMEI
    }),
  )
      .then((r) {
    return r;
  }).then((result) async {
    var token = json.decode(result.body);
    return await http
        .post(FAQS_URL,
            headers: {
              "Content-Type": "application/json",
              "__RequestVerificationToken": getVerificationToken().toString(),
            },
            body: json.encode({
              'sDealerNumber': user.sDealerNumber,
              'sSalesManInfo': user.sSalesManInfo,
              'sIMEI': user.sIMEI,
              'token': token["TokenValor"],
            }))
        .then((result) {
      var response = json.decode(result.body);
      if (response["Notifications"] == null) {
        return response["Error"]["Descripcion"];
      }
      return response["Notifications"];
    });
  });
  return data;
}
