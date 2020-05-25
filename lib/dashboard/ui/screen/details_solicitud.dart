import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/app_bar_solicitudes.dart';
import 'package:appgo/dashboard/ui/widget/details.dart';
import 'package:appgo/dashboard/ui/screen/documents.dart';
import 'package:appgo/Service/detail_request.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/screen/conversion_status.dart';

class DetailsSolicitud extends StatefulWidget {
  String imgDoc = "assets/images/images_for_dashboard/document@3x.png";
  int numSolicitud;
  String name;
  var dateStar;
  String descSC;
  String marcaSC;
  String bancoSC;

  DetailsSolicitud({
    Key key,
    this.numSolicitud,
    this.name,
    this.dateStar,
    this.descSC,
    this.marcaSC,
    this.bancoSC,
  });
  @override
  State<StatefulWidget> createState() {
    return _DetailsSolicitud();
  }
}

class _DetailsSolicitud extends State<DetailsSolicitud> {
  String title = "Detalle";
  bool details = true;
  @override
  Widget build(BuildContext context) {
    IApplicationDetailRequest num_request = new IApplicationDetailRequest();
    num_request.applicatinId = widget.numSolicitud.toString();
    var detailsRequest = detailRequest(num_request);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final doc = Container(
      width: 18.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain, image: AssetImage(widget.imgDoc)),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 60), // width is infinity and 64 is the height
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.lightBlueAccent[400], Colors.lightBlue[600]],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 0.6),
              stops: [0.0, 0.0],
              tileMode: TileMode.clamp,
            )),
          ),
          elevation: 0.0,
          leading: Container(
            margin: EdgeInsets.only(top: 13.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(Icons.chevron_left, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "DIN",
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: screenWidth * 0.122,
                    child: RaisedButton(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: doc,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Documents(widget.numSolicitud)));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            color: Colors.grey[200],
            child: FutureBuilder(
              future: detailsRequest,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Container(
                      child: Center(
                        child: Text("Error, ${snapshot.error}"),
                      ),
                    );
                  }
                  if (snapshot.data == CONNECTION_ERROR) {
                    return Container(
                      child: Center(
                        child: Text(snapshot.data),
                      ),
                    );
                  } else {
                    String year = snapshot.data['Anno'];
                    String modelo = snapshot.data['Modelo'];
                    String celular = snapshot.data['Celular'];
                    String telefono = snapshot.data['Telefono'];
                    String estadoProceso = snapshot.data['EstadoEnProceso'];
                    String respuesta = snapshot.data['Respuesta'];
                    String horaRespuesta = snapshot.data['HoraRespuesta'];
                    List comentario = snapshot.data['Comentario'];

                    return Details(
                      dateStar: widget.dateStar,
                      nameSolicitud: widget.name,
                      numSolicitud: widget.numSolicitud,
                      year: year,
                      modelo: modelo,
                      numCelular: celular,
                      numTelefono: telefono,
                      faseProceso: estadoProceso
                          .toString()
                          .substring(18, estadoProceso.length),
                      respuesta: respuesta,
                      fechaSolicitud: horaRespuesta,
                      descSC: widget.descSC,
                      coments: comentario
                          .toString()
                          .substring(1, comentario.toString().length - 1),
                    );
                  }
                }

                return Container(
                  //margin: EdgeInsets.only(top: screenHeight * 0.20),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: <Widget>[
              AppBarSolicitudes(
                details: details,
                numSolicitudes: widget.numSolicitud,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
