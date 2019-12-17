import 'package:flutter/material.dart';

class Document extends StatefulWidget {
  String documentTitle;
  int version;
  String subTitle;
  String status;
  String date;
  var color;

  Document(
      {Key key,
      this.documentTitle,
      this.subTitle,
      this.status,
      this.date,
      this.version});

  @override
  State<StatefulWidget> createState() {
    return _Document();
  }
}

class _Document extends State<Document> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.status == "Accepted") {
        widget.color = Colors.grey;
      }
      if (widget.status == "Pending verification") {
        widget.color = Colors.red[200];
      }
      if (widget.status == "Pending verification") {
        widget.color = Colors.lightBlue;
      }
    });

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final title = Container(
      margin: EdgeInsets.only(top: 16.0, left: 16.0),
      child: Text(
        widget.documentTitle,
        style: TextStyle(
            fontFamily: "DIN",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black54),
      ),
    );
    final subtitle = Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            widget.subTitle,
            style: TextStyle(
                fontFamily: "DIN",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black26),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "- Version ${widget.version}",
              style: TextStyle(
                  fontFamily: "DIN",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black26),
            ),
          ),
        ],
      ),
    );

    final estado = Container(
      margin: EdgeInsets.only(left: 16.0),
      padding: EdgeInsets.all(6.0),
      color: widget.color,
      child: Text(
        widget.status,
        style: TextStyle(
            fontFamily: "DIN",
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: Colors.white),
      ),
    );

    final fecha = Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fecha",
            style: TextStyle(
                fontFamily: "DIN",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black26),
          ),
          Text(
            widget.date,
            style: TextStyle(
                fontFamily: "DIN",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black45),
          ),
        ],
      ),
    );

    final stateDate = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[estado, fecha],
      ),
    );

    final document = Container(
      width: screenWidth,
      padding: EdgeInsets.only(bottom: 16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title,
          subtitle,
          stateDate,
        ],
      ),
    );

    return Column(
      children: <Widget>[
        document,
        Divider(
          height: 1.0,
          color: Colors.transparent,
        )
      ],
    );
  }
}
