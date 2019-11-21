import 'package:flutter/material.dart';

class BtnCloseSesion extends StatefulWidget {
  String btnText;
  BtnCloseSesion(this.btnText);
  @override
  State<StatefulWidget> createState() {
    return _BtnCloseSesion();
  }
}

class _BtnCloseSesion extends State<BtnCloseSesion> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth * 0.76,
        height: screenHeight * 0.0816,
        child: FlatButton.icon(
          color: Colors.lightBlue[700],
          icon: Icon(
            Icons.accessibility_new,
            color: Colors.blue[400],
            size: 0.0,
          ),
          label: Text(widget.btnText,
              style: TextStyle(
                  fontFamily: "DIN",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          onPressed: () {
            Navigator.pop(context);
            print(screenHeight);
          },
        ));
  }
}
