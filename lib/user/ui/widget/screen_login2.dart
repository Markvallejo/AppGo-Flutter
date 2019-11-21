import 'package:flutter/material.dart';

class ScreenLogin2 extends StatelessWidget {
  String urlSolited = "assets/images/images_for_Login/icono_held.png";
  String solicited = "SOLICITUDES";
  String descriptionApp =
      "Accesa desde la pantalla Dashboard a tus diferentes listas de solicitudes ó abre el menú en cualquier momento de tu navegacion";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final imgSolicited = Container(
      width: screenWidth * 0.50,
      height: screenHeight * 0.123,
      margin: EdgeInsets.only(top: screenHeight * 0.245),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(urlSolited),
        ),
      ),
    );
    final textSolicitud = Container(
      margin: EdgeInsets.only(top: 06.0),
      child: Text(
        solicited,
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
        imgSolicited,
        textSolicitud,
        textDescriptionApp,
      ],
    );
  }
}
