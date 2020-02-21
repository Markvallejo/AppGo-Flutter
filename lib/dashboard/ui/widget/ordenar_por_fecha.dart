import 'package:flutter/material.dart';
import 'package:appgo/filtros/filters_model.dart';
import 'package:appgo/dashboard/ui/widget/btnLIsto.dart';
import 'package:appgo/dashboard/ui/widget/filters.dart';
import 'package:appgo/dashboard/ui/widget/calendar.dart';
import 'package:appgo/dashboard/ui/widget/list_all_solicitudes.dart';

class OrdenarPorFecha extends StatefulWidget {
  var categoria;
  OrdenarPorFecha(this.categoria);
  @override
  State<StatefulWidget> createState() {
    return _OrdenarPorFecha();
  }
}

class _OrdenarPorFecha extends State<OrdenarPorFecha> {
  @override
  Widget build(BuildContext context) {
    FiltersModel filter = new FiltersModel();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double elevation = screenHeight * 0.0357;

    final ordenar = Container(
      margin: EdgeInsets.only(left: 0.0),
      child: Text(
        "DESDE HACE",
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
        child: Column(
          children: <Widget>[
            ListTile(
                contentPadding: EdgeInsets.only(
                    top: screenHeight * 0.041, left: 10.0, right: 16.0),
                onTap: () {
                  Navigator.pop(context);
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
              child: ListView.builder(
                itemCount: filter.dateByItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          if (filter.dateByItems[index].id ==
                              filter.dateByItems.last.id) {
                            Calendar calendar = new Calendar();
                            return calendar.build(context);
                          } else {
                            print(
                                "selection ${filter.dateByItems[index].name}");
                          }
                        },
                        title: Filters(
                          filterName: filter.dateByItems[index].name,
                          filterDescription:
                              filter.dateByItems[index].description,
                          isSelect: filter.dateByItems[index].selected,
                        ),
                      ),
                      Divider(
                        color: Colors.white60,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
