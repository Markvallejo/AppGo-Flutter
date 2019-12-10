import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/solicitudes.dart';

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
    String emptyRequest = "assets/images/images_for_dashboard/warning@3x.png";
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
              width: screenWidth,
              height: screenHeight * 0.877,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.10,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(emptyRequest))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "No hay Solicitudes",
                      style: TextStyle(
                        fontFamily: "DIN",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
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
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
            ),
          ),
        );
      },
    );
  }
}
