import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

class ISearchApplicationRequest {
  String sDealerNumber;
  String sSalesManInfo;
  String sIMEI;
  String applicationId;
}

Future searchRequest(ISearchApplicationRequest data) async {
  User user = User();
  var connection = await connectionType().then((res) {
    if (res == ConnectivityResult.none.toString()) {
      return CONNECTION_ERROR;
    } else {
      var resp = http
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
      }).then((result) async {
        var token = json.decode(result.body);
        return await http
            .post(SEARCH_URL,
                headers: {
                  "Content-Type": "application/json",
                  "__RequestVerificationToken":
                      getVerificationToken().toString(),
                },
                body: json.encode({
                  'ApplicationId': data.applicationId,
                  'sDealerNumber': user.sDealerNumber,
                  'sSalesManInfo': user.sSalesManInfo,
                  'sIMEI': user.sIMEI,
                  'token': token["TokenValor"],
                }))
            .then((r) {
          return r;
        }).then((result) {
          var response = json.decode(result.body);
          if (response["SolicitudBusqueda"] != null) {
            var output = response["SolicitudBusqueda"];
            output["EsContrato"] = response["EsContrato"];
            return output;
          }
        });
      });

      return resp;
    }
  });
  print("Resultado de la busqueda $connection");
  return connection;
}
