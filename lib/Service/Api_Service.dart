import 'dart:async';
import 'package:flutter/material.dart';
import 'package:appgo/user/model/user.dart';
import 'package:appgo/Service/aprobadas_applications-request.dart';
import 'package:appgo/Service/detail_request.dart';
import 'package:appgo/Service/documents_request.dart';
import 'package:appgo/Service/active_application-request.dart';

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

class Service extends StatelessWidget {
  Future<User> user;
  Service({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashboard = detailRequest(22065637);
    return Scaffold(
      appBar: AppBar(
        title: Text('APPGO'),
        backgroundColor: Colors.lightBlue,
      ),
      body: FutureBuilder(
        future: dashboard,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Documento: ${snapshot.data}");
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Error: ${snapshot.error}");
          }
          return CircularProgressIndicator(
            backgroundColor: Colors.lightBlue,
          );
        },
      ),
    );
  }
}
