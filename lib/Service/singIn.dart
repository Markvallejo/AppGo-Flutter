import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';
import 'dart:convert';
import 'package:appgo/Service/verification_token.dart';
import 'package:connectivity/connectivity.dart';
import 'package:appgo/utils/connetivity.dart';

Future singIn() async {
  User user = new User();
  var connection = await connectionType().then((res) {
    if (res == ConnectivityResult.none.toString()) {
      return CONNECTION_ERROR;
    } else {
      var response = http
          .post(SIGIN_URL,
              headers: {
                "Content-Type": "application/json",
                "__RequestVerificationToken": getVerificationToken().toString(),
              },
              body: json.encode({
                'sPassword': user.sPassword,
                'sDealerNumber': user.sDealerNumber,
                'sSalesManInfo': user.sSalesManInfo,
                'sIMEI': user.sIMEI,
              }))
          .then((r) {
        return r.body;
      }).then((result) {
        var response = json.decode(result);

        if (response["Autenticacion"] == null) {
          print("Autentication is Empty ${response["Error"]["Descripcion"]}");
          return response["Error"]["Descripcion"];
        }
        var isValid = response["Autenticacion"]["Valido"];
        if (isValid) {
          print(result);
          return result;
        }
        print(response["Autenticacion"]["Razon"]);
        return response["Autenticacion"]["Razon"];
      });
      return response;
    }
  });
  return connection;
}
