import 'package:flutter/material.dart';
import 'package:appgo/filtros/filters_model.dart';
import 'package:appgo/dashboard/ui/widget/btnLIsto.dart';
import 'package:appgo/dashboard/ui/widget/filters.dart';
import 'package:appgo/dashboard/ui/widget/drawer_right.dart';
import 'package:appgo/Service/salesman_list_request.dart';

class OrdenarPorVendedor extends StatefulWidget {
  var resp;
  var salesman;
  OrdenarPorVendedor(this.salesman);
  @override
  State<StatefulWidget> createState() {
    return _OrdenarPorVendedor();
  }
}

class _OrdenarPorVendedor extends State<OrdenarPorVendedor> {
  @override
  Widget build(BuildContext context) {
    FiltersModel filter = new FiltersModel();
    var salesman = salesmanListRequest();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double elevation = screenHeight * 0.0357;

    onPress(int index) {}

    back(bool request) {
      setState(() {
        widget.resp = request;
      });
    }

    final ordenar = Container(
      margin: EdgeInsets.only(left: 0.0),
      child: Text(
        "VENDEDOR",
        style: TextStyle(
            letterSpacing: 0.2,
            fontFamily: "DIN",
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 20),
      ),
    );

    final vendedor = Container(
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
        child: Column(
          children: <Widget>[
            ListTile(
                contentPadding: EdgeInsets.only(
                    top: screenHeight * 0.041, left: 10.0, right: 16.0),
                onTap: () {
                  bool response = true;
                  Scaffold.geometryOf(context).addListener(back(response));
                },
                title: ordenar,
                leading: Icon(
                  Icons.chevron_left,
                  color: Colors.white60,
                ),
                trailing: BtnListo()),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.82, maxWidth: screenWidth * 0.76),
              child: FutureBuilder(
                  future: salesman,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List request = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: request.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                onTap: () {
                                  onPress(index);
                                },
                                title: Filters(
                                  filterName: request[index]['NombreVendedor'],
                                  filterDescription: " ",
                                ),
                              ),
                              Divider(
                                color: Colors.white60,
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );

    if (widget.resp == true) {
      return DrawerRight(
        vendedor: widget.salesman,
      );
    } else {
      return vendedor;
    }
  }
}
