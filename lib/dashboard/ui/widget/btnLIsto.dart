import 'package:flutter/material.dart';

class BtnListo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BtnListo();
  }
}

class _BtnListo extends State<BtnListo> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth * 0.20,
        height: screenHeight * 0.068,
        child: FlatButton.icon(
          color: Colors.lightBlue[700],
          icon: Icon(
            Icons.accessibility_new,
            color: Colors.blue[400],
            size: 0.0,
          ),
          label: Text("Listo",
              style: TextStyle(
                  fontFamily: "DIN",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
          onPressed: () {
            Navigator.pop(context);
            print(screenHeight);
          },
        ));
  }
}
