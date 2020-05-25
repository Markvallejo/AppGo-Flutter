import 'package:flutter/material.dart';
import 'Card_convertions_dashboard.dart';
import 'package:appgo/dashboard/ui/screen/solicitud.dart';

class CardListStatus extends StatelessWidget {
  var request;
  var dateStart;
  var salesman;

  CardListStatus({Key key, this.request, this.dateStart, this.salesman});
  @override
  Widget build(BuildContext context) {
    void onPress(String title) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Solicitud(
                    title: title,
                    numSolicitudes: 0,
                    categoria: null,
                    salesman: salesman,
                    dateStar: dateStart,
                  )));
    }

    final row1 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CardConvertions(
            description: request[0]['Description'],
            numSolicitudes: 0,
            onPressed: () {
              onPress(request[0]['Description']);
            }),
        CardConvertions(
            description: request[1]['Description'],
            numSolicitudes: 0,
            onPressed: () {
              onPress(request[1]['Description']);
            }),
      ],
    );

    final row2 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CardConvertions(
            description: request[2]['Description'],
            numSolicitudes: 0,
            onPressed: () {
              onPress(request[2]['Description']);
            }),
        CardConvertions(
            description: request[3]['Description'],
            numSolicitudes: 0,
            onPressed: () {
              onPress(request[3]['Description']);
            }),
      ],
    );

    final row3 = Row(
      children: <Widget>[
        CardConvertions(
            description: request[4]['Description'],
            numSolicitudes: 0,
            onPressed: () {
              onPress(request[4]['Description']);
            }),
      ],
    );

    return Container(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[row1, row2, row3],
      ),
    );
  }
}
