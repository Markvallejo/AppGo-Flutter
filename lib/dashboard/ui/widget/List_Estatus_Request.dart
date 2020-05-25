import 'package:flutter/material.dart';

class ListEstatusRequest extends StatelessWidget {
  var description;
  var desc;
  ListEstatusRequest({this.description, this.desc});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            description = description + " - " + desc;
            Navigator.pop(context, description);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10.0, left: 20.0),
            child: Text(
              desc,
              style: TextStyle(
                  fontFamily: "INPro-Bold",
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Divider(
          color: Colors.black45,
        )
      ],
    );
  }
}
