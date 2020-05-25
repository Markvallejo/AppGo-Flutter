import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  String encabezado;
  String contenido;

  Answers(this.encabezado, this.contenido);
  @override
  Widget build(BuildContext context) {
    String title = "Preguntas Frecuentes";
    double screenWidth = MediaQuery.of(context).size.width;

    final header = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 15.0),
      child: Text(
        encabezado,
        style: TextStyle(
            fontFamily: "INPro-Bold",
            fontSize: 15.0,
            color: Colors.black87,
            fontWeight: FontWeight.w500),
      ),
    );

    final content = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 15.0),
      child: Text(
        contenido,
        style: TextStyle(
            fontFamily: "INPro-Bold",
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            color: Colors.black54),
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.lightBlueAccent[400], Colors.lightBlue[600]],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 0.6),
              stops: [0.0, 0.0],
              tileMode: TileMode.clamp,
            )),
          ),
          elevation: 0.0,
          leading: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "INPro-Bold",
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        width: screenWidth,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            header,
            content,
          ],
        ),
      ),
    );
  }
}
