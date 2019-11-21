import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:appgo/user/model/user.dart';
import 'package:http/http.dart' as http;

final STAGE_SERVICES =
    "http://test.gmac-smartlink.com/MobileApp/MobileApplication/";
final PRODUCTION_SERVICES =
    "https://www.rightlink.mx/MobileApplicationv2/MobileApplication/";
final API_URL = STAGE_SERVICES;
final VERIFICAION_TOKEN_URL = API_URL;
final GENERATE_TOKEN_URL = API_URL + "GenerateToken/";
final APPROVED_APPLICATIONS_URL = API_URL + "ApprovedApplications/";
final QUALIFIED_APPLICATIONS_URL = API_URL + "QualifiedApplications/";
final PURCHASED_APPLICATIONS_URL = API_URL + "PurchasedApplications/";
final PENDING_APPLICATIONS_URL = API_URL + "PendingApplications/";
final APPLICATION_DETAIL_URL = API_URL + "DetailApplication/";
final DASHBOARD_URL = API_URL + "Dashboard/";
final SIGIN_URL = API_URL + "AuthenticateUser/";
final SALESMAN_LIST_URL = API_URL + "SalesmanList/";
final ACTIVE_APPLICATIONS_URL = API_URL + "ActiveApplications/";
final HELD_OFFERING_APPLICATIONS_URL = API_URL + "HOApplications/";
final APPLICATION_DOCUMENTS_URL = API_URL + "Documents/";
final PURCHASED_DETAIL_URL = API_URL + "DetailContract/";
final SEARCH_URL = API_URL + "SearchApplication/";
final REJECTED_APPLICATIONS_URL = API_URL + "RejectedApplications/";
final REMOTE_CONFIG_URL = API_URL + "GetParameters/";
final RESPONSE_TIME_URL = API_URL + "NotifResponseTime/";
final NEWS_URL = API_URL + "NotifNews/";
final FAQS_URL = API_URL + "NotifFaqs/";
final GUIDES_URL = API_URL + "NotifGuides/";
final TRACK_DOCUMENT_URL = API_URL + "NotifGuidesTrack/";
final CONVERSION_STATUS_URL = API_URL + "GetStatusConversion/";
final UPDATE_CONVERSION_STATUS_URL =
    API_URL + "SaveApplicationStatusConversion/";
final CONVERSION_STATUS_DASHBOARD_URL =
    API_URL + "GetApplicationStatusConversionDashBoard/";
final CONVERSION_STATUS_APPLICATIONS_URL =
    API_URL + "GetApplicationStatusConversionList/";
final CONNECTION_ERROR = "Verifica tu conexión a internet.";
final REQUEST_TIMEOUT_ERROR = "Tiempo de espera superado.";

Future<User> generateToken() async {
  var response = await http.get(STAGE_SERVICES, headers: {
    "Content-Type": "application/json",
    "__RequestVerificationToken": "",
  });
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}

Future<User> fetch() async {
  final response = await http.post(
    GENERATE_TOKEN_URL,
    headers: {
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
    // Si la llamada al servidor no fue exitosa
    throw Exception('Failed to load data');
  } else {
    // Si la llamada fue exitosa
    return User.fromJson(json.decode(response.body));
  }
}

class Service extends StatelessWidget {
  Future<User> user;

  Service({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    user = generateToken();
    return Scaffold(
      appBar: AppBar(
        title: Text('APPGO'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("conexion con datos ${snapshot.data}");
              return ListView(
                children: <Widget>[
                  Text(snapshot.data.toString()),
                ],
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            );
          },
        ),
      ),
    );
  }
}
