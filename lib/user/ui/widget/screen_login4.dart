import 'package:flutter/material.dart';

class ScreenLogin4 extends StatelessWidget {
  String urlkey = "assets/images/images_for_Login/key@3x.png";
  String llave = "LLAVE";
  String descriptionApp =
      "Para tener acceso a todas tus solicitudes, no olvides registrar la siguiente llave con tu proveedor: 1B252D26-53EE-4D69-B5AB-C04592415941";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final imgkey = Container(
      width: screenWidth * 0.50,
      height: screenHeight * 0.123,
      margin: EdgeInsets.only(top: screenHeight * 0.245),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(urlkey),
        ),
      ),
    );
    final textkey = Container(
      margin: EdgeInsets.only(top: 06.0),
      child: Text(
        llave,
        style: TextStyle(
            letterSpacing: 0.0,
            fontFamily: "DIN",
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),
    );

    final textDescriptionApp = Container(
      margin: EdgeInsets.only(top: screenHeight * 0.140),
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
        imgkey,
        textkey,
        textDescriptionApp,
      ],
    );
  }
}
