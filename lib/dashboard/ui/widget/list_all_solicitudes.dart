import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/document_empty.dart';

class ListAllRequest extends StatefulWidget {
  var categoria;

  ListAllRequest({this.categoria});
  @override
  State<StatefulWidget> createState() {
    return _ListAllRequest();
  }
}

class _ListAllRequest extends State<ListAllRequest> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: widget.categoria,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List solicitud = snapshot.data;
          if (solicitud != null) {
            return Container(
              margin: EdgeInsets.only(top: screenHeight * 0.070),
              child: Scrollbar(
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
              ),
            );
          } else {
            return Container(
              child: DocumentEmpty("No hay Solicitudes"),
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
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.030),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
            ),
          ),
        );
      },
    );
  }
}
