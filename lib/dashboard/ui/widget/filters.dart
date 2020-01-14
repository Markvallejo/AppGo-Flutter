import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  String filterName;
  String filterType;
  bool isSelect;
  Filters(this.filterName, this.filterType, this.isSelect);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenWidth * 0.40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              filterName,
              style: TextStyle(
                  fontFamily: "DIN",
                  letterSpacing: 0.1,
                  wordSpacing: 0.2,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              filterType,
              style: TextStyle(
                  fontFamily: "DIN",
                  letterSpacing: 0.1,
                  wordSpacing: 0.2,
                  color: isSelect ? Colors.white : Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
