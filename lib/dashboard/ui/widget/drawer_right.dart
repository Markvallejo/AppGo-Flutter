import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/btnLIsto.dart';
import 'package:appgo/dashboard/ui/widget/btnCloseSesion.dart';
import 'package:appgo/dashboard/ui/widget/ordenar_por_nombre.dart';
import 'package:appgo/dashboard/ui/widget/ordenar_por_fecha.dart';
import 'package:appgo/dashboard/ui/widget/ordenar_por_vendedor.dart';

class DrawerRight extends StatefulWidget {
  var categoria;
  String vendedor;
  String fecha = "7 días";
  String alfabeto = "Nombre A-Z";

  bool resp;
  var filtro;

  DrawerRight({Key key, this.resp, this.categoria, this.vendedor});
  @override
  State<StatefulWidget> createState() {
    return _DrawerRight();
  }
}

class _DrawerRight extends State<DrawerRight> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double elevation = screenHeight * 0.0357;

    final filtros = Container(
      child: Text(
        "FILTROS",
        style: TextStyle(
            letterSpacing: 0.2,
            fontFamily: "DIN",
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 25),
      ),
    );

    final ordenarAlfabeto = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "ORDENAR POR",
            style: TextStyle(
                fontFamily: "DIN",
                letterSpacing: 0.1,
                wordSpacing: 0.2,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
          Text(widget.alfabeto,
              style: TextStyle(
                  fontFamily: "DIN",
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w900))
        ],
      ),
    );
    final ordenarPorTiempo = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "DESDE HACE",
            style: TextStyle(
                fontFamily: "DIN",
                letterSpacing: 0.1,
                wordSpacing: 0.2,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
          Text(widget.fecha,
              style: TextStyle(
                  fontFamily: "DIN",
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w900))
        ],
      ),
    );

    final ordenarVendedor = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "VENDEDOR",
            style: TextStyle(
                fontFamily: "DIN",
                letterSpacing: 0.1,
                wordSpacing: 0.2,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
          Text("${widget.vendedor}",
              style: TextStyle(
                  fontFamily: "DIN",
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w900))
        ],
      ),
    );

    listiner(bool request, var filter) {
      setState(() {
        widget.filtro = filter;
        widget.resp = request;
      });
    }

    final menu = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.lightBlueAccent[400], Colors.lightBlue[600]],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 0.6),
        stops: [0.0, 0.0],
        tileMode: TileMode.clamp,
      )),
      margin: EdgeInsets.only(top: elevation),
      width: screenWidth * 0.76,
      height: screenHeight - elevation,
      child: Drawer(
          elevation: 0.0,
          child: Column(children: <Widget>[
            ListTile(
                contentPadding: EdgeInsets.only(
                    top: screenHeight * 0.041, left: 16.0, right: 16.0),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Container(child: filtros),
                trailing: BtnListo()),
            Divider(
              color: Colors.white60,
            ),
            ListTile(
                onTap: () {
                  bool type = true;
                  Scaffold.geometryOf(context)
                      .addListener(listiner(type, "Nombre"));
                },
                leading: Container(child: ordenarAlfabeto),
                trailing: new Icon(
                  Icons.chevron_right,
                  color: Colors.white60,
                )),
            Divider(
              color: Colors.white60,
            ),
            ListTile(
                onTap: () {
                  bool type = true;
                  Scaffold.geometryOf(context)
                      .addListener(listiner(type, "fecha"));
                },
                leading: Container(child: ordenarPorTiempo),
                trailing: new Icon(
                  Icons.chevron_right,
                  color: Colors.white60,
                )),
            Divider(
              color: Colors.white60,
            ),
            ListTile(
                onTap: () {
                  bool type = true;
                  Scaffold.geometryOf(context).addListener(listiner(type, ""));
                },
                leading: Container(child: ordenarVendedor),
                trailing: new Icon(
                  Icons.chevron_right,
                  color: Colors.white60,
                )),
            Divider(
              color: Colors.white60,
            ),
            Expanded(flex: 1, child: Text("")),
            Expanded(
              flex: 0,
              child: BtnCloseSesion("Limpiar Filtros", false),
            ),
          ])),
    );

    if (widget.resp == true) {
      if (widget.filtro == 'fecha') {
        return OrdenarPorFecha(widget.vendedor);
      }
      if (widget.filtro == 'Nombre') {
        return OrdenarPorNombre(widget.vendedor);
      } else {
        return OrdenarPorVendedor(widget.vendedor);
      }
      // return OrdenarPorFecha(widget.categoria);
    } else {
      return menu;
    }
  }
}
