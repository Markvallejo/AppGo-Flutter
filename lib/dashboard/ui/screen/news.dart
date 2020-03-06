import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/drawer_left.dart';
import 'package:appgo/dashboard/ui/widget/app_bar_solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/List_News.dart';
import 'package:appgo/dashboard/ui/widget/List_Notices.dart';

class News extends StatefulWidget {
  String salesman;
  News({Key key, this.salesman});
  @override
  State<StatefulWidget> createState() {
    return _News();
  }
}

class _News extends State<News> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = "Noticias";
    String news = "Crédito de Consumo";

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerLeft(
            salesman: widget.salesman,
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
          Column(
            children: <Widget>[
              AppBarSolicitudes(title: news),
              ListNews(),
              List_Notices(),
            ],
          )
        ],
      ),
    );
  }
}
