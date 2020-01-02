import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/input_search.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
            margin: EdgeInsets.only(top: 15.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          title: new Container(
            margin: EdgeInsets.only(top: 15.0),
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.only(right: screenWidth * 0.20),
              child: Text(
                "Buscar Solicitud",
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
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Center(
          child: InputSearch(),
        ),
      ),
    );
  }
}
