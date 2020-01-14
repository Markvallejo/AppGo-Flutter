import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/btnLIsto.dart';
import 'package:appgo/dashboard/ui/widget/btnCloseSesion.dart';
import 'package:appgo/dashboard/ui/widget/filters.dart';

class OrdenarPorAlfabeto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrdenarPorAlfabeto();
  }
}

class _OrdenarPorAlfabeto extends State<OrdenarPorAlfabeto> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double elevation = screenHeight * 0.0357;
    bool isSelect = true;
    void onPress() {
      setState(() {
        isSelect = !isSelect;
      });
    }

    final ordenar = Container(
      margin: EdgeInsets.only(left: 0.0),
      child: Text(
        "ORDENAR POR",
        style: TextStyle(
            letterSpacing: 0.2,
            fontFamily: "DIN",
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 20),
      ),
    );

    return Container(
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
                      top: screenHeight * 0.041, left: 10.0, right: 16.0),
                  onTap: () {},
                  title: ordenar,
                  leading: Icon(
                    Icons.chevron_left,
                    color: Colors.white60,
                  ),
                  trailing: BtnListo()),
              Divider(
                color: Colors.white60,
              ),
              ListTile(
                selected: false,
                onTap: () {
                  onPress();
                  Navigator.pop(context);
                },
                leading: Filters("Nombre", "A-Z", isSelect),
              ),
              Divider(
                color: Colors.white60,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Filters("Nombre", "Z-A", !isSelect),
              ),
              Divider(
                color: Colors.white60,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Filters("No Solicitud", "0-9", !isSelect),
              ),
              Divider(
                color: Colors.white60,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Filters("No Solicitud", "9-0", !isSelect),
              ),
              Divider(
                color: Colors.white60,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Filters("Fecha", "- +", !isSelect),
              ),
              Divider(
                color: Colors.white60,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Filters("Fecha", "+ -", !isSelect),
              ),
              Divider(
                color: Colors.white60,
              ),
              Expanded(flex: 1, child: Text("")),
              Expanded(
                flex: 0,
                child: BtnCloseSesion("Limpiar Filtros", !isSelect),
              ),
            ])));
  }
}
