import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  String filterName;
  String filterDescription;
  bool isSelect;
  Filters({this.filterName, this.filterDescription, this.isSelect});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 70.0),
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
            filterDescription,
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
    );
  }
}
