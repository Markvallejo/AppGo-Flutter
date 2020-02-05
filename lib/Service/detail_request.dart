import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

class IApplicationDetailRequest {
  String sDealerNumber;
  String sSalesManInfo;
  String sIMEI;
  String applicatinId;
}

Future detailRequest(applicationId) async {
  User user = new User();

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
        return http
            .post(APPLICATION_DETAIL_URL,
                headers: {
                  "Content-Type": "application/json",
                  "__RequestVerificationToken":
                      getVerificationToken().toString(),
                },
                body: json.encode({
                  'ApplicationId': applicationId,
                  'sDealerNumber': user.sDealerNumber,
                  'sSalesManInfo': user.sSalesManInfo,
                  'sIMEI': user.sIMEI,
                  'token': token["TokenValor"],
                }))
            .then((r) {
          var request = json.decode(r.body);
          return request;
        }).then((result) {
          if (result["DetalleSolicitud"] != null) {
            var output = result["DetalleSolicitud"];
            if (output["Comentario"][0] == "") {
              output["Comentario"] = [];
            }
            return output;
          }
          print(result['Description']['Error']);
          return result['Description']['Error'];
        });
      });
      return resp;
    }
  });
  return connection;
}
