import 'package:flutter/material.dart';

class ListNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListNews();
  }
}

class _ListNews extends State<ListNews> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String responseTime = " 3 horas";
    String analysisTime = "2 horas";

    final response = Container(
      padding: EdgeInsets.only(left: 20.0, top: 25.0, bottom: 20.0),
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Tiempo de respuesta de compra",
            style: TextStyle(
              fontFamily: "DIN",
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
          Text(
            responseTime,
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black54),
          )
        ],
      ),
    );

    final analysis = Container(
      padding: EdgeInsets.only(left: 20.0, top: 25.0, bottom: 20.0),
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tiempo de Analysis",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black87),
          ),
          Text(
            analysisTime,
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black54),
          )
        ],
      ),
    );

    return Container(
      child: Column(
        children: <Widget>[
          response,
          Divider(
            color: Colors.black45,
          ),
          analysis
        ],
      ),
    );
  }
}
