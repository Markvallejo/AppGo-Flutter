import 'package:flutter/material.dart';

class InfoLogin extends StatelessWidget {
  String welcome;
  String appName;
  String descriptionApp;

  InfoLogin(this.welcome, this.appName, this.descriptionApp);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final textWelcome = Container(
      margin: EdgeInsets.only(top: screenHeight * 0.259),
      child: Text(
        welcome,
        style: TextStyle(
            letterSpacing: 1.0,
            wordSpacing: 0.5,
            fontFamily: "DIN",
            color: Colors.black54,
            fontSize: 18.0,
            fontWeight: FontWeight.w900),
      ),
    );
    final textNameApp = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Text(
        appName,
        style: TextStyle(
            letterSpacing: 3.0,
            fontFamily: "DIN",
            color: Colors.white,
            fontSize: 65.0,
            fontWeight: FontWeight.w900),
      ),
    );

    final textDescriptionApp = Container(
      margin: EdgeInsets.only(top: screenHeight * 0.165),
      width: screenWidth * 0.605,
      child: Text(
        descriptionApp,
        style: TextStyle(
            fontFamily: "DIN",
            color: Colors.white,
            fontSize: 11.8,
            fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        textWelcome,
        textNameApp,
        textDescriptionApp,
      ],
    );
  }
}
