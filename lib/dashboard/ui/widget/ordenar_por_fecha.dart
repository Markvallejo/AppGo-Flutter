import 'package:flutter/material.dart';
import 'package:appgo/filtros/filters_model.dart';
import 'package:appgo/dashboard/ui/widget/btnLIsto.dart';
import 'package:appgo/dashboard/ui/widget/filters.dart';
import 'package:appgo/Service/dashboard_request.dart';

class OrdenarPorFecha extends StatefulWidget {
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
    // IActiveApplicationsRequest day_start = new IActiveApplicationsRequest();

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
                onTap: () {},
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
                            Future<DateTime> selectedDate = showDatePicker(
                              context: context,
                              locale: Locale('es'),
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2030),
                              builder: (BuildContext context, Widget calendar) {
                                return Theme(
                                  data: ThemeData.light(),
                                  child: calendar,
                                );
                              },
                            ).then((r) {
                              // var today = DateTime.now().day;
                              // var date_start = today - 90;
                              // day_start.days = date_start.toString();
                              // var date_Selected = r.toString().substring(0, 10);
                              // var dashboardrequest = dashboardData(day_start);
                              // return r;
                            });
                          } else {
                            print(
                                "selection ${filter.dateByItems[index].name}");
                            return null;
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
