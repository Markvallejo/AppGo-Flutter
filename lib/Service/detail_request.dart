import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

Future detailRequest(applicationId) async {
  final user = new User();
  int appId = 22;

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
            .post(APPLICATION_DETAIL_URL,
                headers: {
                  "Content-Type": "application/json",
                  "__RequestVerificationToken":
                      getVerificationToken().toString(),
                },
                body: json.encode({
                  'ApplicationId': appId,
                  'sDealerNumber': user.sDealerNumber,
                  'sSalesManInfo': user.sSalesManInfo,
                  'sIMEI': user.sIMEI,
                  'token': token["TokenValor"],
                }))
            .then((r) {
          return r.body;
        }).then((result) {
          var response = json.decode(result);
          if (response["DetalleSolicitud"] != null) {
            var output = response["DetalleSolicitud"];
            if (output["Comentario"][0] == "") {
              output["Comentario"] = [];
            }

            return output;
          }
          print(response['Description']['Error']);
          return response['Description']['Error'];
        });
      });
      return resp;
    }
  });
  return connection;
}
