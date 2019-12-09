import 'package:flutter/material.dart';

class AppBarSolicitudes extends StatelessWidget {
  String idVendedor;
  int numSolicitudes;
  bool details;

  AppBarSolicitudes(
      {Key key, this.numSolicitudes, this.idVendedor, this.details});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final appBarSolicitudes = Container(
      color: Colors.lightBlue[700],
      width: screenWidth,
      height: screenHeight * 0.068,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          numSolicitudes == null
              ? Text(
                  "Solicitudes de $idVendedor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "DIN",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  "$numSolicitudes Solicitudes de $idVendedor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "DIN",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );

    final appBarDetails = Container(
      color: Colors.lightBlue[700],
      width: screenWidth,
      height: screenHeight * 0.068,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Solicitud No. $numSolicitudes",
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

    return Container(
      child: details == true ? appBarDetails : appBarSolicitudes,
    );
  }
}
