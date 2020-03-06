import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/screen/Estatus_Conversion.dart';

class ListConvertionStatus extends StatelessWidget {
  String description;
  int idStatus;
  var dateStar;

  ListConvertionStatus({
    Key key,
    this.description,
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
              Navigator.pop(context, description);
              String value = await Navigator.push(context,
                  MaterialPageRoute<String>(builder: (BuildContext context) {
                return Status(
                  id: idStatus,
                  dateStar: dateStar,
                  description: description,
                );
              }));
              print("valor: $value");
            },
            child: description == "Sin Estatus"
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        description,
                        style: TextStyle(
                            fontFamily: "DIN",
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
          color: description == "Sin Estatus"
              ? Colors.transparent
              : Colors.black45,
        ),
      ],
    );
  }
}
