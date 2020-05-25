import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/drawer_left.dart';
import 'package:appgo/dashboard/ui/widget/drawer_right.dart';
import 'package:appgo/dashboard/ui/widget/app_bar_solicitudes.dart';
import 'package:appgo/Service/conversion-status-dashboard-request.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/widget/Card_convertions_dashboard.dart';
import 'package:appgo/dashboard/ui/widget/Card_list_status.dart';

class DashboardConversion extends StatefulWidget {
  String salesman;
  DashboardConversion(this.salesman);
  @override
  State<StatefulWidget> createState() {
    return _DashboardConversion();
  }
}

class _DashboardConversion extends State<DashboardConversion> {
  @override
  Widget build(BuildContext context) {
    int dateStart = 90;
    IGetConversionStatusDashboardDataRequest data =
        new IGetConversionStatusDashboardDataRequest();
    data.days = dateStart.toString();
    var request = getConversionStatusDashboardData(data);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = "Dashboard de Conversion";
    String imgFiltrar =
        "assets/images/images_for_dashboard/icono_filtrar@3x.png";

    final filter = Container(
      width: 18.0,
      decoration: BoxDecoration(
        image:
            DecorationImage(fit: BoxFit.contain, image: AssetImage(imgFiltrar)),
      ),
    );

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerLeft(salesman: widget.salesman)),
      endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerRight(vendedor: widget.salesman)),
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 60), // width is infinity and the height is 60
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.lightBlueAccent[400], Colors.lightBlue[600]],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 0.6),
              stops: [0.0, 0.0],
              tileMode: TileMode.clamp,
            )),
          ),
          elevation: 0.0,
          leading: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
            ),
          ),
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "INPro-Bold",
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: screenWidth * 0.122,
                    child: RaisedButton(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: filter,
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppBarSolicitudes(
                idVendedor: widget.salesman,
              ),
              FutureBuilder(
                future: request,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == CONNECTION_ERROR) {
                      return Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.30),
                        child: Center(
                          child: Text(snapshot.data),
                        ),
                      );
                    } else {
                      var result = snapshot.data;
                      return CardListStatus(
                        request: result,
                        dateStart: dateStart,
                        salesman: widget.salesman,
                      );
                    }
                  }
                  return Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.30),
                    child: Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.white12,
                          valueColor: AlwaysStoppedAnimation(Colors.lightBlue)),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
