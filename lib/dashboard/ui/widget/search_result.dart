import 'package:flutter/material.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/widget/solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/document_empty.dart';
import 'package:appgo/Service/search_request.dart';

class SearchResult extends StatefulWidget {
  var numSolicitud;
  SearchResult(this.numSolicitud);
  @override
  State<StatefulWidget> createState() {
    return _SearchResult();
  }
}

class _SearchResult extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    var request = searchRequest(widget.numSolicitud);
    return FutureBuilder(
      future: request,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == CONNECTION_ERROR) {
            return Container(
              // margin: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(snapshot.data),
              ),
            );
          } else {
            if (snapshot.data != null) {
              return Container(
                child: Solicitudes(
                  nameSolicitud: snapshot.data['NombreCompleto'],
                  modelo: snapshot.data['Modelo'],
                  numSolicitud: snapshot.data['NumeroSolicitud'],
                  fechaSolicitud: snapshot.data['FechaCreacion'],
                  year: snapshot.data['Anno'],
                  status: snapshot.data['EstadoSolicitud'],
                ),
              );
            } else {
              return Container(
                child: DocumentEmpty("No hay Solicitudes"),
              );
            }
          }
        }
        if (snapshot.connectionState == ConnectionState.none) {
          return Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(REQUEST_TIMEOUT_ERROR),
            ),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: screenHeight * 0.37),
          child: Center(
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
