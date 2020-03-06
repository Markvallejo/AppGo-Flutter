import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/btnCloseSesion.dart';
import 'package:appgo/dashboard/ui/screen/dashboard.dart';
import 'package:appgo/dashboard/ui/screen/dashboard_conversion.dart';
import 'package:appgo/dashboard/ui/screen/news.dart';
import 'package:appgo/dashboard/ui/screen/Questions.dart';
import 'package:appgo/dashboard/ui/screen/Guides_&_Boletines.dart';

class DrawerLeft extends StatefulWidget {
  String imgSolicitudes = "assets/images/images_for_DrawerLeft/dashboard.png";
  String imgConversion = "assets/images/images_for_DrawerLeft/conversion.png";
  String imgBoletines = "assets/images/images_for_DrawerLeft/boletines.png";
  String imgPreguntas = "assets/images/images_for_DrawerLeft/preguntas.png";
  String imgNoticias = "assets/images/images_for_DrawerLeft/noticias.png";

  String salesman;
  DrawerLeft({Key key, this.salesman});
  @override
  State<StatefulWidget> createState() {
    return _DrawerLeft();
  }
}

class _DrawerLeft extends State<DrawerLeft> {
  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.chevron_right;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double elevation = screenHeight * 0.0357; // 26.27  // 23.

    return Container(
      margin: EdgeInsets.only(top: elevation),
      width: screenWidth * 0.76,
      height: screenHeight - elevation,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.lightBlueAccent[400], Colors.lightBlue[600]],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 0.6),
        stops: [0.0, 0.0],
        tileMode: TileMode.clamp,
      )),
      child: Drawer(
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: ListTile(
                  contentPadding:
                      EdgeInsets.only(top: 15.0, left: 16.0, right: 16.0),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Dashboard(
                                  salesman: widget.salesman,
                                )),
                        ModalRoute.withName('/Dashboard'));
                  },
                  title: new Text(
                    "Dashboard de Solicitudes",
                    style: TextStyle(
                        fontFamily: "DIN", color: Colors.white, fontSize: 16),
                  ),
                  leading: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.imgSolicitudes),
                    )),
                  ),
                  trailing: new Icon(icon, color: Colors.white)),
            ),
            Divider(
              color: Colors.white60,
            ),
            Expanded(
              flex: 0,
              child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DashboardConversion(widget.salesman)));
                  },
                  title: new Text(
                    "Dashboard de Conversion",
                    style: TextStyle(
                        fontFamily: "DIN", color: Colors.white, fontSize: 16),
                  ),
                  leading: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.imgConversion),
                    )),
                  ),
                  trailing: new Icon(icon, color: Colors.white)),
            ),
            Divider(
              color: Colors.white60,
            ),
            Expanded(
              flex: 0,
              child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GuidesAndBoletines(widget.salesman)));
                  },
                  title: new Text(
                    "Boletines, Guías y Más",
                    style: TextStyle(
                        fontFamily: "DIN", color: Colors.white, fontSize: 16),
                  ),
                  leading: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.imgBoletines),
                    )),
                  ),
                  trailing: new Icon(icon, color: Colors.white)),
            ),
            Divider(
              color: Colors.white60,
            ),
            Expanded(
              flex: 0,
              child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Question(widget.salesman)));
                  },
                  title: new Text(
                    "Preguntas Frecuentes",
                    style: TextStyle(
                        fontFamily: "DIN", color: Colors.white, fontSize: 16),
                  ),
                  leading: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.imgPreguntas),
                    )),
                  ),
                  trailing: new Icon(icon, color: Colors.white)),
            ),
            Divider(
              color: Colors.white60,
            ),
            Expanded(
              flex: 0,
              child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                News(salesman: widget.salesman)));
                  },
                  title: new Text(
                    "Noticias",
                    style: TextStyle(
                        fontFamily: "DIN", color: Colors.white, fontSize: 16),
                  ),
                  leading: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.imgNoticias),
                    )),
                  ),
                  trailing: new Icon(icon, color: Colors.white)),
            ),
            Divider(
              color: Colors.white60,
            ),
            Expanded(flex: 1, child: Text("")),
            Expanded(
              flex: 0,
              child: BtnCloseSesion("Cerrar Sesion", true),
            ),
          ],
        ),
      ),
    );
  }
}
