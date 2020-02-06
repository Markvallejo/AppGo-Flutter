import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

class IGetConversionStatusRequest {
  num id;
  String sDealerNumber;
  String sSalesManInfo;
  String sIMEI;
}

Future getConversionStatus(IGetConversionStatusRequest data) async {
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
            .post(CONVERSION_STATUS_URL,
                headers: {
                  "Content-Type": "application/json",
                  "__RequestVerificationToken":
                      getVerificationToken().toString(),
                },
                body: json.encode({
                  'DealerNumber': user.sDealerNumber,
                  'SalesManInfo': user.sSalesManInfo,
                  'IMEI': user.sIMEI,
                  'token': token["TokenValor"],
                  'StatusConversionId': data.id
                }))
            .then((r) {
          print("status: ${r.body}");
          return r.body;
        }).then((result) {
          var response = json.decode(result);

          if (response["StatusConversion"] != null) {
            var output = response["StatusConversion"];
            if (output.length > 0) {
              return output;
            }
          }
          return "Estatus de conversión no válido!!!!!!.";
        });
      });
      return resp;
    }
  });
  print("result: $connection");
  return connection;
}
