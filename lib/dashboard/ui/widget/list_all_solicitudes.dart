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
    return FutureBuilder(
      future: widget.categoria,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List sol = snapshot.data;
          for (int i = 0; i < sol.length; i++) {
            String nombre = sol[i]["NombreCompleto"];
            String modelo = sol[i]["Modelo"];
            String fecha = sol[i]["FechaCreacion"];
            num numSolicitud = sol[i]["NumeroSolicitud"];

            return Solicitudes(
              nameSolicitud: nombre,
              modelo: modelo,
              numSolicitud: numSolicitud,
              fechaSolicitud: fecha,
            );
          }
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
