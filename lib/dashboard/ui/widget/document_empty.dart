import 'package:flutter/material.dart';

class DocumentEmpty extends StatelessWidget {
  String documentEmpty = "assets/images/images_for_dashboard/warning@3x.png";
  String title;
  DocumentEmpty(this.title);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.877,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: screenHeight * 0.10,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(documentEmpty))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "DIN",
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
