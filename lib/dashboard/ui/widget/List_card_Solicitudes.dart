import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/card_solicitudes.dart';
import 'package:appgo/dashboard/ui/screen/solicitud.dart';
import 'package:appgo/Service/active_application-request.dart';

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
    void onPressedRecibidas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Recibidas", numSolicitudes: widget.numRecibidas)));
    }

    void onPressedPendientes() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Pendientes", numSolicitudes: widget.numPendientes)));
    }

    void onPressedCalificadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Calificadas",
                  numSolicitudes: widget.numCalificadas)));
    }

    void onPressedAprobadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Aprobadas", numSolicitudes: widget.numAprobadas)));
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
                  title: "Held Offering", numSolicitudes: widget.numHeld)));
    }

    void onPressedRechazadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Rechazadas", numSolicitudes: widget.numRechazadas)));
    }

    void onPressedCompradas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Compradas", numSolicitudes: widget.numCompradas)));
    }

    final recibidas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(widget.numRecibidas, solicitudesRecibidas,
          imgRecibidas, imgRecibidasblue, onPressedRecibidas),
    );
    final pendientes = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(widget.numPendientes, solicitudesPendientes,
          imgPendientes, imgPendientesBlue, onPressedPendientes),
    );

    final calificadas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(widget.numCalificadas, solicitudesCalificadas,
          imgCalifiacadas, imgCalificadasBlue, onPressedCalificadas),
    );
    final aprobadas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(widget.numAprobadas, solicitudesAprobadas,
          imgAprobadas, imgAprobadasBlue, onPressedAprobadas),
    );

    final activas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(widget.numActivas, solicitudesActivas, imgActivas,
          imgActivasBlue, onPressedActivas),
    );

    final held = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(
          widget.numHeld, solicitudesHeld, imgHeld, imgHeldBlue, onPressedHeld),
    );

    final rechazadas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(widget.numRechazadas, solicitudesRechazadas,
          imgRechazadas, imgRechazadasBlue, onPressedRechazadas),
    );

    final compradas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(widget.numCompradas, solicitudesCompradas,
          imgCompradas, imgCompradasBlue, onPressedCompradas),
    );

    final row1 = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[recibidas, pendientes],
    );

    final row2 = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[calificadas, aprobadas],
    );

    final row3 = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[activas, held],
    );

    final row4 = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[rechazadas, compradas],
    );

    return Column(
      children: <Widget>[row1, row2, row3, row4],
    );
  }
}
