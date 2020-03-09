import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/drawer_left.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/Service/getGuides.dart';
import 'package:appgo/dashboard/ui/widget/Guides_Boletines.dart';

class GuidesAndBoletines extends StatelessWidget {
  String salesman;
  GuidesAndBoletines(this.salesman);
  @override
  Widget build(BuildContext context) {
    String title = "Boletines Guias y Más";
    double screenWidth = MediaQuery.of(context).size.width;

    var guidesAndBoletines = getGuides();

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerLeft(
            salesman: salesman,
          )),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        // width is infinity and the height is 60
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
          title: Center(
            child: Container(
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
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: guidesAndBoletines,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List request = snapshot.data;
                    if (snapshot.data == CONNECTION_ERROR) {
                      return Container(
                        child: Center(
                          child: Text(snapshot.data),
                        ),
                      );
                    } else {
                      return Container(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            var guides = request.first['Categoria'];
                            var boletines = request.last['Categoria'];

                            return Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                GuidesBoletines(
                                                    title: guides,
                                                    request: guidesAndBoletines,
                                                    categoria: guides)));
                                  },
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(guides.toString()),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Colors.lightBlue,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black54,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                GuidesBoletines(
                                                    title: boletines,
                                                    request: guidesAndBoletines,
                                                    categoria: boletines)));
                                  },
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(boletines.toString()),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Colors.lightBlue,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black54,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
