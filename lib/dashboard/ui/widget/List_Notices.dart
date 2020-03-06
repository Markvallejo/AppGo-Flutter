import 'package:flutter/material.dart';

class List_Notices extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _List_Notices();
  }
}

class _List_Notices extends State<List_Notices> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final divider = Divider(
      color: Colors.black45,
    );

    String notices1 =
        "Maneja un chevrolet spark 2018 con descuento especial de \$15,000 Maneja un chevrolet spark Maneja un chevrolet spark...";
    String notices2 = "Sigue tu beat con precio desde \$149,900";

    final avisos = Container(
      color: Colors.lightBlue[700],
      width: screenWidth,
      height: screenHeight * 0.068,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Avisos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "DIN",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

    final descChevrolet = Container(
      padding: EdgeInsets.only(left: 20.0, top: 25.0, bottom: 20.0),
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notices1,
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black87),
          )
        ],
      ),
    );
    final descBeat = Container(
      padding: EdgeInsets.only(left: 20.0, top: 25.0, bottom: 20.0),
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notices2,
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black87),
          )
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        avisos,
        descChevrolet,
        divider,
        descBeat,
        divider,
      ],
    );
  }
}
