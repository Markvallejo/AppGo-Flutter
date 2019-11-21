import 'package:flutter/material.dart';

class GradientLogin extends StatelessWidget {
  double height;
  GradientLogin(this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.lightBlue, Colors.blue[700]],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 0.6),
        stops: [0.0, 0.8],
        tileMode: TileMode.clamp,
      )),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}
