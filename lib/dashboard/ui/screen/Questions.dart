import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/drawer_left.dart';

class Question extends StatelessWidget {
  String salesman;
  Question(this.salesman);
  @override
  Widget build(BuildContext context) {
    String title = "Preguntas Frecuentes";
    double screenWidth = MediaQuery.of(context).size.width;

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
      body: Container(),
    );
  }
}
