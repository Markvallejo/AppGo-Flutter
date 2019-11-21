import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/solicitudes.dart';
import 'package:appgo/dashboard/ui/screen/details_solicitud.dart';

class ListAllSolicitudes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListAllSolicitudes();
  }
}

class _ListAllSolicitudes extends State<ListAllSolicitudes> {
  @override
  Widget build(BuildContext context) {
    String nameSolicitud = "ACO***** ZUÑ***** LA***** KAR*****";
    String modelo = "1XS26 - D EQUINOX D";
    int numSolicitud = 22064447;
    String fechaSolicitud = "2019-06-20   10:20 AM";
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DetailsSolicitud(
                          numSolicitud: numSolicitud,
                        )));
          },
          child: Solicitudes(
            nameSolicitud: nameSolicitud,
            modelo: modelo,
            numSolicitud: numSolicitud,
            fechaSolicitud: fechaSolicitud,
          ),
        )
      ].toList(),
    );
  }
}
