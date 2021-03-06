import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/screen/details_solicitud.dart';

class Solicitudes extends StatefulWidget {
  String nameSolicitud;
  String modelo;
  int numSolicitud;
  String fechaSolicitud;
  int year;
  String descSC;
  String marcaSC;
  String bancoSC;
  var dateStar;

  Solicitudes(
      {Key key,
      this.nameSolicitud,
      this.modelo,
      this.numSolicitud,
      this.fechaSolicitud,
      this.descSC,
      this.marcaSC,
      this.bancoSC,
      this.year,
      this.dateStar});
  @override
  State<StatefulWidget> createState() {
    return _Solicitudes();
  }
}

class _Solicitudes extends State<Solicitudes> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final name = Container(
      child: Text(
        widget.nameSolicitud,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 16.5,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );
    final idSolicitud = Container(
      child: Text(
        widget.modelo,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black38,
        ),
      ),
    );

    final nuSolicitud = Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "#Solicitud:",
              style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.numSolicitud.toString(),
              style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );

    final fecha = Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Fecha:",
              style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.fechaSolicitud,
              style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );

    final datosSolicitud = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[nuSolicitud, fecha],
    );

    final solicitud = Container(
      margin: EdgeInsets.only(left: 16.0),
      width: screenWidth * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          name,
          idSolicitud,
          datosSolicitud,
        ],
      ),
    );

    final allRequest = Container(
      width: screenWidth,
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      color: Colors.grey[200],
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DetailsSolicitud(
                        numSolicitud: widget.numSolicitud,
                        name: widget.nameSolicitud,
                        dateStar: widget.dateStar,
                        descSC: widget.descSC,
                      )));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            solicitud,
            Icon(
              Icons.chevron_right,
              color: Colors.lightBlue[600],
              size: 26.0,
            )
          ],
        ),
      ),
    );

    return Column(
      children: <Widget>[
        allRequest,
        Divider(
          color: Colors.transparent,
          height: 1.0,
        ),
      ],
    );
  }
}
