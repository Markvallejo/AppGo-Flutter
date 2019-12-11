import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/card_solicitudes.dart';
import 'package:appgo/dashboard/ui/screen/solicitud.dart';
import 'package:appgo/Service/active_application-request.dart';
import 'package:appgo/Service/pendientes_application-request.dart';
import 'package:appgo/Service/compradas_application-request.dart';
import 'package:appgo/Service/rechazadas_applications_request.dart';
import 'package:appgo/Service/calificadas_applications_request.dart';
import 'package:appgo/Service/h_Offering_request.dart';
import 'package:appgo/Service/aprobadas_applications-request.dart';

class ListCardSolicitudes extends StatefulWidget {
  int numRecibidas;
  int numCompradas;
  int numPendientes;
  int numRechazadas;
  int numActivas;
  int numHeld;
  int numCalificadas;
  int numAprobadas;

  ListCardSolicitudes(
      {this.numActivas,
      this.numAprobadas,
      this.numCalificadas,
      this.numCompradas,
      this.numHeld,
      this.numPendientes,
      this.numRechazadas,
      this.numRecibidas});
  @override
  State<StatefulWidget> createState() {
    return _ListCardSolicitudes();
  }
}

class _ListCardSolicitudes extends State<ListCardSolicitudes> {
  var activasList = activeApplication();
  var pendientesList = pendientesApplication();
  var compradasList = compradasApplication();
  var calificadasList = calificadasApplication();
  var hOfferingList = heldOfferingApplication();
  var aprobadasList = aprobadasApplication();
  var rechazadasList = rechazadasApplication();

  String solicitudesRecibidas = "RECIBIDAS";
  String imgRecibidas =
      "assets/images/images_for_dashboard/recibidas_white.png";
  String imgRecibidasblue =
      "assets/images/images_for_dashboard/recibidas_blue.png";

  String solicitudesPendientes = "PENDIENTES";
  String imgPendientes = "assets/images/images_for_dashboard/pendientes.png";
  String imgPendientesBlue =
      "assets/images/images_for_dashboard/pendientes_blue.png";

  String solicitudesCalificadas = "CALIFICADAS";
  String imgCalifiacadas = "assets/images/images_for_dashboard/calificadas.png";
  String imgCalificadasBlue =
      "assets/images/images_for_dashboard/calificadas_blue.png";

  String solicitudesAprobadas = "APROBADAS";
  String imgAprobadas = "assets/images/images_for_dashboard/aprobadas.png";
  String imgAprobadasBlue =
      "assets/images/images_for_dashboard/aprobadas_blue.png";

  String solicitudesActivas = "ACTIVAS";
  String imgActivas = "assets/images/images_for_dashboard/activas.png";
  String imgActivasBlue = "assets/images/images_for_dashboard/activas_blue.png";

  String solicitudesHeld = "HELD OFFERING";
  String imgHeld = "assets/images/images_for_dashboard/held.png";
  String imgHeldBlue = "assets/images/images_for_dashboard/held_blue.png";

  String solicitudesRechazadas = "RECHAZADAS";
  String imgRechazadas = "assets/images/images_for_dashboard/rechazadas.png";
  String imgRechazadasBlue =
      "assets/images/images_for_dashboard/rechazadas_blue.png";

  String solicitudesCompradas = "COMPRADAS";
  String imgCompradas = "assets/images/images_for_dashboard/compradas.png";
  String imgCompradasBlue =
      "assets/images/images_for_dashboard/compradas_blue.png";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screeHeight = MediaQuery.of(context).size.height;

    void onPressedRecibidas() {}

    void onPressedPendientes() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Pendientes",
                    numSolicitudes: widget.numPendientes,
                    categoria: pendientesList,
                  )));
    }

    void onPressedCalificadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Calificadas",
                    numSolicitudes: widget.numCalificadas,
                    categoria: calificadasList,
                  )));
    }

    void onPressedAprobadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Aprobadas",
                    numSolicitudes: widget.numAprobadas,
                    categoria: aprobadasList,
                  )));
    }

    void onPressedActivas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Activas",
                    numSolicitudes: widget.numActivas,
                    categoria: activasList,
                  )));
    }

    void onPressedHeld() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Held Offering",
                    numSolicitudes: widget.numHeld,
                    categoria: hOfferingList,
                  )));
    }

    void onPressedRechazadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Rechazadas",
                    numSolicitudes: widget.numRechazadas,
                    categoria: rechazadasList,
                  )));
    }

    void onPressedCompradas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: "Compradas",
                    numSolicitudes: widget.numCompradas,
                    categoria: compradasList,
                  )));
    }

    final recibidas = Container(
      child: CardSolicitudes(
          numSolicitudes: widget.numRecibidas,
          nameSolicitud: solicitudesRecibidas,
          imgRecibidasWhite: imgRecibidas,
          imgRecibidasBlue: imgRecibidasblue,
          onPressed: onPressedRecibidas,
          col: true),
    );
    final pendientes = Container(
      child: CardSolicitudes(
        numSolicitudes: widget.numPendientes,
        nameSolicitud: solicitudesPendientes,
        imgRecibidasWhite: imgPendientes,
        imgRecibidasBlue: imgPendientesBlue,
        onPressed: onPressedPendientes,
        col: false,
      ),
    );

    final calificadas = Container(
      child: CardSolicitudes(
        numSolicitudes: widget.numCalificadas,
        nameSolicitud: solicitudesCalificadas,
        imgRecibidasWhite: imgCalifiacadas,
        imgRecibidasBlue: imgCalificadasBlue,
        onPressed: onPressedCalificadas,
        col: false,
      ),
    );
    final aprobadas = Container(
      child: CardSolicitudes(
        numSolicitudes: widget.numAprobadas,
        nameSolicitud: solicitudesAprobadas,
        imgRecibidasWhite: imgAprobadas,
        imgRecibidasBlue: imgAprobadasBlue,
        onPressed: onPressedAprobadas,
        col: false,
      ),
    );

    final activas = Container(
      child: CardSolicitudes(
        numSolicitudes: widget.numActivas,
        nameSolicitud: solicitudesActivas,
        imgRecibidasWhite: imgActivas,
        imgRecibidasBlue: imgActivasBlue,
        onPressed: onPressedActivas,
        col: false,
      ),
    );

    final held = Container(
      child: CardSolicitudes(
        numSolicitudes: widget.numHeld,
        nameSolicitud: solicitudesHeld,
        imgRecibidasWhite: imgHeld,
        imgRecibidasBlue: imgHeldBlue,
        onPressed: onPressedHeld,
        col: false,
      ),
    );

    final rechazadas = Container(
      child: CardSolicitudes(
        numSolicitudes: widget.numRechazadas,
        nameSolicitud: solicitudesRechazadas,
        imgRecibidasWhite: imgRechazadas,
        imgRecibidasBlue: imgRechazadasBlue,
        onPressed: onPressedRechazadas,
        col: false,
      ),
    );

    final compradas = Container(
      child: CardSolicitudes(
          numSolicitudes: widget.numCompradas,
          nameSolicitud: solicitudesCompradas,
          imgRecibidasWhite: imgCompradas,
          imgRecibidasBlue: imgCompradasBlue,
          onPressed: onPressedCompradas,
          col: false),
    );

    final row1 = Container(
      margin: EdgeInsets.only(top: screeHeight * 0.044),
      width: screenWidth * 0.864,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[recibidas, pendientes],
      ),
    );

    final row2 = Container(
      margin: EdgeInsets.only(top: screeHeight * 0.044),
      width: screenWidth * 0.864,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[calificadas, aprobadas],
      ),
    );

    final row3 = Container(
      margin: EdgeInsets.only(top: screeHeight * 0.044),
      width: screenWidth * 0.864,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[activas, held],
      ),
    );

    final row4 = Container(
      margin: EdgeInsets.only(top: screeHeight * 0.044),
      width: screenWidth * 0.864,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[rechazadas, compradas],
      ),
    );

    return Column(
      children: <Widget>[row1, row2, row3, row4],
    );
  }
}
