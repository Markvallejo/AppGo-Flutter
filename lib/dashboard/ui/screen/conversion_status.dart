import 'package:flutter/material.dart';
import 'package:appgo/Service/conversion-status-dashboard-request.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/widget/list_convertion-status.dart';

class StatusConvertion extends StatefulWidget {
  var dateStart;

  StatusConvertion({Key key, this.dateStart});
  @override
  State<StatefulWidget> createState() {
    return _StatusConvertion();
  }
}

class _StatusConvertion extends State<StatusConvertion> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    String title = "Estatus de Conversión";

    IGetConversionStatusDashboardDataRequest data =
        new IGetConversionStatusDashboardDataRequest();
    data.days = widget.dateStart.toString();

    var convertionStatus = getConversionStatusDashboardData(data);

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
                future: convertionStatus,
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
                                .map((status) => ListConvertionStatus(
                                      descSC: status['Description'],
                                      idStatus: status['StatusConversionId'],
                                      dateStar: widget.dateStart,
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
