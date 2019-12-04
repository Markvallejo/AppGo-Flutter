import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/app_bar_solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/List_card_Solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/drawer_left.dart';
import 'package:appgo/dashboard/ui/widget/drawer_right.dart';
import 'package:appgo/dashboard/ui/widget/ordenar_por_alfabeto.dart';
import 'package:appgo/user/model/user.dart';
import 'package:appgo/Service/dashboard_request.dart';

class DashBoard extends StatelessWidget {
  User user = new User();
  var dashboardSolicitudes = dashboardData();

  String title = "Dashboard";
  String imgSeparador = "assets/images/images_for_dashboard/separator@3x.png";
  String imgFiltrar = "assets/images/images_for_dashboard/icono_filtrar@3x.png";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
          child: DrawerLeft()),
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        //child: OrdenarPorAlfabeto()
        child: DrawerRight(),
      ),
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 60), // width is infinity and 64 is the height
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
          title: new Container(
            margin: EdgeInsets.only(top: 15.0),
            width: screenWidth,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "INPro-Bold",
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
          actions: <Widget>[
            Container(
              width: 30.0,
              margin: EdgeInsets.only(top: 15.0),
              child: Builder(
                builder: (context) => IconButton(
                    icon: new Icon(Icons.search),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    }),
              ),
            ),
            Container(
              width: 2.0,
              height: 15.0,
              margin: EdgeInsets.only(top: 15.0, left: 15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(imgSeparador)),
              ),
            ),
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
              AppBarSolicitudes(idVendedor: user.sSalesManInfo),
              FutureBuilder(
                  future: dashboardSolicitudes,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      num activas = snapshot.data['SolicitudesActivas'];
                      num compradas = snapshot.data['ContratosComprados'];
                      num aprobadas = snapshot.data['SolicitudesAprobadas'];
                      num calificadas = snapshot.data['SolicitudesCalificadas'];
                      num hOffering = snapshot.data['SolicitudesHO'];
                      num pendientes = snapshot.data['SolicitudesPendientes'];
                      num rechazadas = snapshot.data['SolicitudesRechazadas'];
                      num recibidas = snapshot.data['SolicitudesRecibidas'];

                      return ListCardSolicitudes(
                        numRecibidas: recibidas,
                        numActivas: activas,
                        numAprobadas: aprobadas,
                        numCalificadas: calificadas,
                        numCompradas: compradas,
                        numHeld: hOffering,
                        numPendientes: pendientes,
                        numRechazadas: rechazadas,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Container(
                        child: Text("Error, Revisa tu conexion a Internet"),
                      );
                    }
                    return Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlue,
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
