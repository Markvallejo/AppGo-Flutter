import 'package:flutter/material.dart';

class ButtonCancel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonCancel();
  }
}

class _ButtonCancel extends State<ButtonCancel> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final cancelar = Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.02, right: screenWidth * 0.39),
        width: screenWidth * 0.34,
        height: screenHeight * 0.055,
        child: FlatButton.icon(
          focusColor: Colors.transparent,
          color: Colors.transparent,
          icon: Icon(
            Icons.navigate_before,
            color: Colors.blue[300],
          ),
          label: Text("Cancelar",
              style: TextStyle(
                  fontFamily: "DIN",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[200])),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
    return cancelar;
  }
}
