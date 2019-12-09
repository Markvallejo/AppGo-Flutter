import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:appgo/filtros/list_item.dart';

Future calificadasApplication() async {
  final user = new User();
  final data = new ListItemDate();

  var resp = await http
      .post(
    GENERATE_TOKEN_URL,
    headers: {
      "Content-Type": "application/json",
      "__RequestVerificationToken": getVerificationToken().toString(),
    },
    body: json.encode({
      'sDealerNumber': user.sDealerNumber,
      'sSalesManInfo': user.sSalesManInfo,
      'sIMEI': user.sIMEI,
    }),
  )
      .then((r) {
    return r;
  }).then((result) async {
    var token = json.decode(result.body);

    return await http
        .post(QUALIFIED_APPLICATIONS_URL,
            headers: {
              "Content-Type": "application/json",
              "__RequestVerificationToken": getVerificationToken().toString(),
            },
            body: json.encode({
              'sDealerNumber': user.sDealerNumber,
              'sSalesManInfo': user.sSalesManInfo,
              'sIMEI': user.sIMEI,
              'days': data.days,
              'token': token["TokenValor"],
            }))
        .then((r) {
      return r.body;
    }).then((result) {
      var response = json.decode(result);
      var applications = response["SolicitudesCalificadas"];

      if (applications == null) {
        return null;
      }

      // print("Solicitudes activas: ${applications[1]}");
      return applications;
    });
  });
  // print(resp);
  return resp;
}
