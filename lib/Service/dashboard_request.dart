import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';

class DashboardDataRequest {
  final String sDealerNumber;
  final String sSalesManInfo;
  final String sIMEI;
  final String days;

  DashboardDataRequest(
      this.sDealerNumber, this.sSalesManInfo, this.sIMEI, this.days);
}

Future dashboardData() async {
  User user = new User();

  DashboardDataRequest data;
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
        .post(DASHBOARD_URL,
            headers: {
              "Content-Type": "application/json",
              "__RequestVerificationToken": getVerificationToken().toString(),
            },
            body: json.encode({
              'sDealerNumber': user.sDealerNumber,
              'sSalesManInfo': user.sSalesManInfo,
              'sIMEI': user.sIMEI,
              // 'days': data.days,
              'token': token["TokenValor"],
            }))
        .then((r) {
      return r.body;
    }).then((result) {
      var response = json.decode(result);

      if (response["TableroVendedor"] != null) {
        var output = response["TableroVendedor"];
        print("this dashboard data: $output");
        return output;
      }
      print("This dashboard is null $response");
      return response["Error"]["Descripcion"];
    });
  });
}
