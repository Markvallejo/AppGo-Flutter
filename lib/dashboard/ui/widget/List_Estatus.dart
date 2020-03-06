import 'package:flutter/material.dart';
import 'package:appgo/Service/get-conversion-status-request.dart';
import 'package:appgo/dashboard/ui/widget/EstatusRequest.dart';

class ListStatus extends StatelessWidget {
  String descriptionStatus;
  var description;
  int idStatus;
  var childs;

  ListStatus({
    Key key,
    this.descriptionStatus,
    this.idStatus,
    this.description,
    this.childs,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () async {
              IGetConversionStatusRequest data =
                  new IGetConversionStatusRequest();
              data.id = idStatus;
              var request = getConversionStatus(data);
              if (childs != 0) {
                Navigator.pop(context);
                String response = await Navigator.push(context,
                    MaterialPageRoute<String>(builder: (BuildContext context) {
                  return EstatusRequest(
                    request: request,
                    description: descriptionStatus,
                  );
                }));
                print("Result: $response");
              } else {
                print("GoBack to details");
                description = description + " - " + descriptionStatus;
                Navigator.pop(context, description);
              }
            },
            child: childs != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        descriptionStatus,
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
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        descriptionStatus,
                        style: TextStyle(
                            fontFamily: "DIN",
                            fontSize: 16.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
          ),
        ),
        Divider(
          color: Colors.black45,
        ),
      ],
    );
  }
}
