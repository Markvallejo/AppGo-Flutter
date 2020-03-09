import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/screen/webView.dart';

class Guides extends StatefulWidget {
  var idEncabezado;
  var encabezado;
  var fechaDocumento;
  var content;
  var categoria;

  Guides({
    this.idEncabezado,
    this.encabezado,
    this.fechaDocumento,
    this.content,
    this.categoria,
  });
  @override
  State<StatefulWidget> createState() {
    return _Guides();
  }
}

class _Guides extends State<Guides> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final encabezado = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Titulo:",
            style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.normal),
          ),
          widget.encabezado != null
              ? Text(
                  widget.encabezado,
                  style: TextStyle(
                      fontFamily: "DIN",
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                )
              : Text(""),
        ],
      ),
    );

    final fecha = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fecha:",
            style: TextStyle(
                fontFamily: "DIN",
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.normal),
          ),
          widget.fechaDocumento != null
              ? Text(
                  widget.fechaDocumento,
                  style: TextStyle(
                      fontFamily: "DIN",
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                )
              : Text(""),
        ],
      ),
    );
    final content = Container(
      child: widget.content != null
          ? Text(
              widget.content,
              style: TextStyle(
                  fontFamily: "DIN",
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.normal),
            )
          : Text(""),
    );

    final contenido = Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          encabezado,
          fecha,
          content,
        ],
      ),
    );

    return widget.content != null
        ? Container(
            width: screenWidth,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MyWebView(widget.content, widget.categoria)));
              },
              child: Column(
                children: <Widget>[contenido, Divider(color: Colors.black45)],
              ),
            ))
        : Container();
  }
}
