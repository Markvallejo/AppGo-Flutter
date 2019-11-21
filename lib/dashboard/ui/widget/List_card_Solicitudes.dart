import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/card_solicitudes.dart';
import 'package:appgo/dashboard/ui/screen/solicitud.dart';

class ListCardSolicitudes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListCardSolicitudes();
  }
}

class _ListCardSolicitudes extends State<ListCardSolicitudes> {
  String solicitudesRecibidas = "RECIBIDAS";
  int numRecibidas = 0438;
  String imgRecibidas =
      "assets/images/images_for_dashboard/recibidas_white.png";
  String imgRecibidasblue =
      "assets/images/images_for_dashboard/recibidas_blue.png";

  String solicitudesPendientes = "PENDIENTES";
  int numPendientes = 0193;
  String imgPendientes = "assets/images/images_for_dashboard/pendientes.png";
  String imgPendientesBlue =
      "assets/images/images_for_dashboard/pendientes_blue.png";

  String solicitudesCalificadas = "CALIFICADAS";
  int numCalficadas = 0009;
  String imgCalifiacadas = "assets/images/images_for_dashboard/calificadas.png";
  String imgCalificadasBlue =
      "assets/images/images_for_dashboard/calificadas_blue.png";

  String solicitudesAprobadas = "APROBADAS";
  int numAprobadas = 0180;
  String imgAprobadas = "assets/images/images_for_dashboard/aprobadas.png";
  String imgAprobadasBlue =
      "assets/images/images_for_dashboard/aprobadas_blue.png";

  String solicitudesActivas = "ACTIVAS";
  int numActivas = 0048;
  String imgActivas = "assets/images/images_for_dashboard/activas.png";
  String imgActivasBlue = "assets/images/images_for_dashboard/activas_blue.png";

  String solicitudesHeld = "HELD OFFERING";
  int numHeld = 0002;
  String imgHeld = "assets/images/images_for_dashboard/held.png";
  String imgHeldBlue = "assets/images/images_for_dashboard/held_blue.png";

  String solicitudesRechazadas = "RECHAZADAS";
  int numRechazadas = 0006;
  String imgRechazadas = "assets/images/images_for_dashboard/rechazadas.png";
  String imgRechazadasBlue =
      "assets/images/images_for_dashboard/rechazadas_blue.png";

  String solicitudesCompradas = "COMPRADAS";
  int numCompradas = 0000;
  String imgCompradas = "assets/images/images_for_dashboard/compradas.png";
  String imgCompradasBlue =
      "assets/images/images_for_dashboard/compradas_blue.png";

  @override
  Widget build(BuildContext context) {
    void onPressedRecibidas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Solicitud(title: "Recibidas", numSolicitudes: numRecibidas)));
    }

    void onPressedPendientes() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Pendientes", numSolicitudes: numPendientes)));
    }

    void onPressedCalificadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Calificadas", numSolicitudes: numCalficadas)));
    }

    void onPressedAprobadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Solicitud(title: "Aprobadas", numSolicitudes: numAprobadas)));
    }

    void onPressedActivas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Solicitud(title: "Activas", numSolicitudes: numActivas)));
    }

    void onPressedHeld() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Solicitud(title: "Held Offering", numSolicitudes: numHeld)));
    }

    void onPressedRechazadas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                  title: "Rechazadas", numSolicitudes: numRechazadas)));
    }

    void onPressedCompradas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Solicitud(title: "Compradas", numSolicitudes: numCompradas)));
    }

    final recibidas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(numRecibidas, solicitudesRecibidas, imgRecibidas,
          imgRecibidasblue, onPressedRecibidas),
    );
    final pendientes = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(numPendientes, solicitudesPendientes,
          imgPendientes, imgPendientesBlue, onPressedPendientes),
    );

    final calificadas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(numCalficadas, solicitudesCalificadas,
          imgCalifiacadas, imgCalificadasBlue, onPressedCalificadas),
    );
    final aprobadas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(numAprobadas, solicitudesAprobadas, imgAprobadas,
          imgAprobadasBlue, onPressedAprobadas),
    );

    final activas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(numActivas, solicitudesActivas, imgActivas,
          imgActivasBlue, onPressedActivas),
    );

    final held = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(
          numHeld, solicitudesHeld, imgHeld, imgHeldBlue, onPressedHeld),
    );

    final rechazadas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 40),
      child: CardSolicitudes(numRechazadas, solicitudesRechazadas,
          imgRechazadas, imgRechazadasBlue, onPressedRechazadas),
    );

    final compradas = Container(
      margin: EdgeInsets.only(top: 30.0, left: 25),
      child: CardSolicitudes(numCompradas, solicitudesCompradas, imgCompradas,
          imgCompradasBlue, onPressedCompradas),
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
