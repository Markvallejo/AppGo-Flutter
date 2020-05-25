import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/document_empty.dart';
import 'package:appgo/Service/Api_Service.dart';

class ListAllRequest extends StatefulWidget {
  var categoria;
  int numSolicitudes;
  var dateStar;

  ListAllRequest({this.categoria, this.numSolicitudes, this.dateStar});
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
          if (widget.numSolicitudes == 0) {
            return Container(
              child: DocumentEmpty("No hay Solicitudes"),
            );
          }
          if (snapshot.data == CONNECTION_ERROR) {
            return Container(
              child: Center(
                child: Text(snapshot.data),
              ),
            );
          } else {
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
                              descSC: solicitud['descSC'],
                              bancoSC: solicitud['BancoSC'],
                              marcaSC: solicitud['MarcaSC'],
                              dateStar: widget.dateStar,
                            ))
                        .toList(),
                  ),
                ),
              );
            }
          }
        }
        if (snapshot.connectionState == ConnectionState.none) {
          return Container(
            child: DocumentEmpty("No hay Solicitudes"),
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
