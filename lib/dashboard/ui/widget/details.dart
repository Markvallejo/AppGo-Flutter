import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  bool status;
  String nameSolicitud;
  String modelo;
  int numSolicitud;
  String fechaSolicitud;
  String year;
  String numTelefono;
  String numCelular;
  String faseProceso;
  String respuesta;
  String coments;

  Details(
      {Key key,
      this.nameSolicitud,
      this.modelo,
      this.numSolicitud,
      this.fechaSolicitud,
      this.year,
      this.numTelefono,
      this.numCelular,
      this.faseProceso,
      this.respuesta,
      this.coments});
  @override
  State<StatefulWidget> createState() {
    return _Details();
  }
}

class _Details extends State<Details> {
  String statusConvertion = "Estatus de Conversión:";
  String statusSolicitud = "Venta no efectuada - Falta de Inventario";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    setState(() {
      if (statusSolicitud != null) {
        widget.status = true;
      } else {
        widget.status = false;
      }
    });
    final divider = Divider(
      color: Colors.black38,
      height: 24.0,
    );
    final divider2 = Divider(
      color: Colors.black45,
      height: 0.0,
    );

    final name = Container(
      child: Text(
        widget.nameSolicitud,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );

    final nombre = Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Nombre:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          name
        ],
      ),
    );

    final idModelo = Container(
      child: Row(
        children: <Widget>[
          Text(
            widget.year,
            style: TextStyle(
              fontFamily: "DIN",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Text(
            widget.modelo,
            style: TextStyle(
              fontFamily: "DIN",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );

    final model = Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Modelo:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          idModelo
        ],
      ),
    );

    final telefono = Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(
        widget.numTelefono,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );

    final phone = Container(
      margin: EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Telefono:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Colors.lightBlue[600],
                size: 15.0,
              ),
              telefono
            ],
          ),
        ],
      ),
    );
    final celular = Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(
        widget.numCelular,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );

    final celularPhone = Container(
      margin: EdgeInsets.only(top: 16.0, left: screenWidth * 0.22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Celular:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.stay_primary_portrait,
                color: Colors.lightBlue[600],
                size: 15.0,
              ),
              celular
            ],
          ),
        ],
      ),
    );

    final contacto = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[phone, celularPhone],
      ),
    );

    final date = Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(
        widget.fechaSolicitud,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );

    final horaRespuesta = Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hora de Respuesta:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          date,
        ],
      ),
    );

    final fase = Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(
        widget.faseProceso,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );
    final proceso = Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fase del proceso:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          fase
        ],
      ),
    );

    final resp = Container(
      // margin: EdgeInsets.only(left: 5.0),
      child: Text(
        widget.respuesta,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );
    final respuestaSolicitud = Container(
      margin: EdgeInsets.only(left: 16.0),
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Respuesta:",
            style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 17),
          ),
          resp
        ],
      ),
    );

    final estadoConversion = Container(
      child: Text(
        statusConvertion,
        style: TextStyle(
          fontFamily: "DIN",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black38,
        ),
      ),
    );

    final estadoSolicitud = Container(
      child: statusSolicitud != null
          ? Text(
              statusSolicitud,
              style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            )
          : Text(""),
    );

    final estado = Container(
      width: screenWidth,
      padding: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 16.0),
      child: InkWell(
        onTap: () {
          print(screenWidth);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                estadoConversion,
                estadoSolicitud,
              ],
            ),
            Container(
              child: Icon(
                Icons.chevron_right,
                color: Colors.lightBlue[600],
                size: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
    final comentarios = Container(
      width: screenWidth,
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Text(
        "Comentarios acerca de la solicitud:",
        style: TextStyle(
            letterSpacing: 1.2,
            fontFamily: "DIN",
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 17.0),
        textAlign: TextAlign.center,
      ),
    );

    final comentario = Container(
      width: screenWidth,
      padding: EdgeInsets.all(15.0),
      color: Colors.grey[200],
      child: Text(
        widget.coments,
        style: TextStyle(
            fontFamily: "DIN",
            color: Colors.black38,
            fontWeight: FontWeight.bold,
            fontSize: 17.0),
        textAlign: TextAlign.left,
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 45.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          nombre,
          model,
          contacto,
          divider,
          horaRespuesta,
          divider,
          proceso,
          divider,
          respuestaSolicitud,
          divider2,
          widget.status == false
              ? Container(
                  width: 0.0,
                  height: 0.0,
                )
              : estado,
          divider2,
          comentarios,
          divider2,
          comentario,
          divider2,
        ],
      ),
    );
  }
}
