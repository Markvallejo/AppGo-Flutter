import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/app_bar_solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/details.dart';
import 'package:appgo/dashboard/ui/screen/documents.dart';

class DetailsSolicitud extends StatefulWidget {
  String imgDoc = "assets/images/images_for_dashboard/document@3x.png";

  int numSolicitud;

  DetailsSolicitud({Key key, this.numSolicitud});
  @override
  State<StatefulWidget> createState() {
    return _DetailsSolicitud();
  }
}

class _DetailsSolicitud extends State<DetailsSolicitud> {
  String title = "Detalle";
  bool details = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final doc = Container(
      width: 18.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain, image: AssetImage(widget.imgDoc)),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 60), // width is infinity and 64 is the height
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
            margin: EdgeInsets.only(top: 13.0, right: 5.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(Icons.chevron_left, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          title: new Container(
            margin: EdgeInsets.only(top: 15.0, right: screenWidth * 0.04),
            width: screenWidth,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "DIN",
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: screenWidth * 0.122,
                    child: RaisedButton(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: doc,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Documents()));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Details(),
            ),
          ),
          Column(
            children: <Widget>[
              AppBarSolicitudes(
                details: details,
                numSolicitudes: widget.numSolicitud,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
