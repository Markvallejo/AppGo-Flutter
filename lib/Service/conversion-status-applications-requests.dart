import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

class IConversionStatusApplicationsRequest {
  String sDealerNumber;
  String sSalesManInfo;
  String sIMEI;
  String days;
  int conversionStatusID;
}

Future getConversionStatusApplications(
    IConversionStatusApplicationsRequest data) async {
  final user = new User();
  var connection = await connectionType().then((res) {
    if (res == ConnectivityResult.none.toString()) {
      return CONNECTION_ERROR;
    } else {
      var resp = http
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
            .post(CONVERSION_STATUS_APPLICATIONS_URL,
                headers: {
                  "Content-Type": "application/json",
                  "__RequestVerificationToken":
                      getVerificationToken().toString(),
                },
                body: json.encode({
                  'DealerNumber': user.sDealerNumber,
                  'SalesManInfo': user.sSalesManInfo,
                  'IMEI': user.sIMEI,
                  'days': data.days,
                  'StatusConversionId': data.conversionStatusID,
                  'token': token["TokenValor"],
                }))
            .then((r) {
          return r.body;
        }).then((result) {
          var response = json.decode(result);

          var applications = response['Solicitudes'];

          if (applications == null) {
            applications = [];
          }

          return applications;
        });
      });
      return resp;
    }
  });
//  print("resultado de solicitudes: $connection");
  return connection;
}
