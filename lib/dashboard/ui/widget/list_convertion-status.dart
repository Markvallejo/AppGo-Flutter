import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/screen/Estatus_Conversion.dart';

class ListConvertionStatus extends StatelessWidget {
  String descSC;
  int idStatus;
  var dateStar;

  ListConvertionStatus({
    Key key,
    this.descSC,
    this.idStatus,
    this.dateStar,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child: InkWell(
            onTap: () async {
              String value;
              Navigator.pop(context, descSC);
              if (value == null) {
                value = await Navigator.push(context,
                    MaterialPageRoute<String>(builder: (BuildContext context) {
                  return Status(
                    id: idStatus,
                    dateStar: dateStar,
                    descSC: descSC,
                  );
                })).then((response) {
                  print("estado de conversion: $response");
                  Navigator.pop(context, response);
                  return response;
                });
                Navigator.pop(context, value);
              }
              Navigator.pop(context, value);
              print("valor: $value");
            },
            child: descSC == "Sin Estatus"
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        descSC,
                        style: TextStyle(
                            fontFamily: "INPro-Bold",
                            fontSize: 16.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                      Builder(
                        builder: (context) => IconButton(
                          icon: new Icon(
                            Icons.chevron_right,
                            color: Colors.lightBlue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        Divider(
          color: descSC == "Sin Estatus" ? Colors.transparent : Colors.black45,
        ),
      ],
    );
  }
}
