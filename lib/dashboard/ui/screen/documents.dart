import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/document_empty.dart';
import 'package:appgo/dashboard/ui/widget/documents_list.dart';

class Documents extends StatelessWidget {
  int idDocument;
  Documents(this.idDocument);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String title = "Documentos";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 60), // width is infinity and 60 is the height
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
            margin: EdgeInsets.only(top: 13.0, right: 5.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          title: new Container(
            margin: EdgeInsets.only(top: 15.0, right: screenWidth * 0.12),
            width: screenWidth,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "DIN",
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          DocumentsList(idDocument),
        ],
      ),
    );
  }
}
