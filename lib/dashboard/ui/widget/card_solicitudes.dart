import 'package:flutter/material.dart';

class CardSolicitudes extends StatefulWidget {
  int numSolicitudes;
  String nameSolicitud;
  String imgRecibidasWhite;
  String imgRecibidasBlue;
  final VoidCallback onPressed;
  bool col;
  CardSolicitudes(
      {this.numSolicitudes,
      this.nameSolicitud,
      this.imgRecibidasWhite,
      this.imgRecibidasBlue,
      this.onPressed,
      this.col});

  @override
  State<StatefulWidget> createState() {
    return _CardSolicitudes();
  }
}

class _CardSolicitudes extends State<CardSolicitudes> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWith = MediaQuery.of(context).size.width;

    void onPresse() {
      setState(() {
        //   widget.col = !widget.col;
      });
    }

    final card = Container(
      height: screenHeight * 0.14,
      width: screenWith * 0.37,
      child: Card(
        borderOnForeground: false,
        color: widget.col ? Colors.lightBlue[700] : Colors.white,
        child: InkWell(
          onTap: widget.onPressed,
          onLongPress: () {
            onPresse();
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: widget.col
                              ? AssetImage(widget.imgRecibidasWhite)
                              : AssetImage(widget.imgRecibidasBlue),
                        ),
                      ),
                      child: Text(""),
                    ),
                    Text(
                      "${widget.numSolicitudes}",
                      style: TextStyle(
                          fontFamily: "DIN",
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  widget.nameSolicitud,
                  style: TextStyle(
                      color: widget.col ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );

    return card;
  }
}
