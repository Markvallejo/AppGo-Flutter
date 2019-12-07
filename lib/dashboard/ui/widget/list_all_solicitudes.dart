import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/solicitudes.dart';

class ListAllSolicitudes extends StatefulWidget {
  var categoria;

  ListAllSolicitudes({this.categoria});
  @override
  State<StatefulWidget> createState() {
    return _ListAllSolicitudes();
  }
}

class _ListAllSolicitudes extends State<ListAllSolicitudes> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: widget.categoria,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List solicitud = snapshot.data;
          return Container(
            margin: EdgeInsets.only(top: screenHeight * 0.070),
            child: ListView(
              children: solicitud
                  .map((solicitud) => Solicitudes(
                        nameSolicitud: solicitud['NombreCompleto'],
                        modelo: solicitud['Modelo'],
                        numSolicitud: solicitud['NumeroSolicitud'],
                        fechaSolicitud: solicitud['FechaCreacion'],
                      ))
                  .toList(),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.none) {
          return Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text("No se encontro Resultados"),
            ),
          );
        }
        return Container(
          margin: EdgeInsets.only(top: 30.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlue,
          ),
        );
      },
    );
  }
}
