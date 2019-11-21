import 'package:flutter/material.dart';

class CardImageLogo extends StatelessWidget {
  String urlImage = "assets/images/images_for_Login/logo@2x.png";
  double margin;
  CardImageLogo(this.margin);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final imageLogo = Container(
      margin: EdgeInsets.only(top: margin, right: 15.0),
      width: screenWidth * 0.60,
      height: screenHeight * 0.135,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(urlImage),
            alignment: Alignment.center),
      ),
    );

    final logo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[imageLogo],
    );

    return logo;
  }
}
