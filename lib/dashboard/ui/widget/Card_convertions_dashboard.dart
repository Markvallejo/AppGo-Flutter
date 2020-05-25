import 'package:flutter/material.dart';

class CardConvertions extends StatefulWidget {
  var description;
  int numSolicitudes;
  final VoidCallback onPressed;
  CardConvertions(
      {Key key, this.description, this.numSolicitudes, this.onPressed});
  @override
  State<StatefulWidget> createState() {
    return _CardConvertions();
  }
}

class _CardConvertions extends State<CardConvertions> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final card = Container(
      margin: EdgeInsets.only(bottom: 30.0),
      height: screenHeight * 0.14,
      width: screenWidth * 0.37,
      child: Card(
        borderOnForeground: false,
        color: Colors.white,
        child: InkWell(
          onTap: widget.onPressed,
          child: Container(
            padding: EdgeInsets.only(left: 7.0, right: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.description == null
                    ? Text("")
                    : Text(
                        "${widget.numSolicitudes}",
                        style: TextStyle(
                            fontFamily: "DIN",
                            fontSize: 30.0,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold),
                      ),
                widget.description == null
                    ? Text("")
                    : Text(
                        widget.description.toString().toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );

    return widget.description != null ? card : Container();
  }
}
