import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

class ISalesmanListRequest {
  String sDealerNumber;
  String sSalesManInfo;
  String sIMEI;
}

Future salesmanListRequest() async {
  User user = new User();
  var connection = await connectionType().then((res) {
    if (res == ConnectivityResult.none.toString()) {
      return CONNECTION_ERROR;
    } else {
      var data = http
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
        //print(token["TokenValor"]);
        return await http
            .post(SALESMAN_LIST_URL,
                headers: {
                  "Content-Type": "application/json",
                  "__RequestVerificationToken":
                      getVerificationToken().toString(),
                },
                body: json.encode({
                  'sDealerNumber': user.sDealerNumber,
                  'sSalesManInfo': user.sSalesManInfo,
                  'sIMEI': user.sIMEI,
                  'token': token["TokenValor"],
                }))
            .then((r) {
          return r.body;
        }).then((result) {
          var response = json.decode(result);
          if (response["Vendedores"] == null) {
            print("Salesman Empty: $response");
            return response["Error"]["Descripcion"];
          }
          // print("Salesman List: $response");
          return response["Vendedores"];
        });
      });
      return data;
    }
  });
  return connection;
}
