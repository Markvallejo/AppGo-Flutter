import 'package:flutter/material.dart';
import 'package:appgo/Service/get-conversion-status-request.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/widget/List_Estatus.dart';

class Status extends StatefulWidget {
  var id;
  var dateStar;
  var descSC;
  var descriptionStatus;

  Status({
    Key key,
    this.id,
    this.dateStar,
    this.descSC,
    this.descriptionStatus,
  });
  @override
  State<StatefulWidget> createState() {
    return _Status();
  }
}

class _Status extends State<Status> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    String title = "Estatus de Conversión";

    IGetConversionStatusRequest data = new IGetConversionStatusRequest();
    data.id = widget.id;
    var status = getConversionStatus(data);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, 60), // width is infinity and the height is 60
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
      body: Stack(
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: status,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List request = snapshot.data;
                    if (snapshot.data == CONNECTION_ERROR) {
                      return Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.30),
                        child: Center(
                          child: Text(snapshot.data),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ListView(
                            children: request
                                .map((status) => ListStatus(
                                      descriptionStatus: status['desc'],
                                      idStatus: status['id'],
                                      description: widget.descSC,
                                      childs: status['childs'],
                                    ))
                                .toList()),
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
