import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/document.dart';

class DocumentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String documentTitle = "Calendario Pagos(Copia GMF)-Detalle de Op.";
    String subTitle = "Acreditado - Version 1";
    String status = "Accepted";
    String date = "2019-06-20    16:38 PM";

    return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print(documentTitle);
            },
            child: Document(
              documentTitle: documentTitle,
              subTitle: subTitle,
              status: status,
              date: date,
            ),
          ),
        ].toList());
  }
}
