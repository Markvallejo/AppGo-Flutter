import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/btnLIsto.dart';
import 'package:appgo/dashboard/ui/widget/filters.dart';
import 'package:appgo/filtros/filters_model.dart';
import 'package:appgo/dashboard/ui/widget/drawer_right.dart';

class OrdenarPorNombre extends StatefulWidget {
  var resp;
  var salesman;
  OrdenarPorNombre(this.salesman);
  @override
  State<StatefulWidget> createState() {
    return _OrdenarPorNombre();
  }
}

class _OrdenarPorNombre extends State<OrdenarPorNombre> {
  @override
  Widget build(BuildContext context) {
    FiltersModel filter = new FiltersModel();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double elevation = screenHeight * 0.0357;

    onPress(int index) {
      print("value: ${filter.sortByItems[index].name}");
    }

    back(bool request) {
      setState(() {
        widget.resp = request;
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

    final alfabeto = Container(
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
                    maxHeight: screenHeight * 0.75,
                    maxWidth: screenWidth * 0.76),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filter.sortByItems.length,
                  //filter.sortByItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            onTap: () {
                              onPress(index);
                            },
                            title: Filters(
                                filterName: filter.sortByItems[index].name,
                                filterDescription:
                                    filter.sortByItems[index].description,
                                isSelect: filter.sortByItems[index].selected)),
                        Divider(
                          color: Colors.white60,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ])));

    if (widget.resp == true) {
      return DrawerRight(vendedor: widget.salesman);
    } else {
      return alfabeto;
    }
  }
}
