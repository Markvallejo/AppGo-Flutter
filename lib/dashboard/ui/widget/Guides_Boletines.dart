import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/guides.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/widget/document_empty.dart';

class GuidesBoletines extends StatefulWidget {
  String title;
  var categoria;
  var request;
  GuidesBoletines({
    Key key,
    this.title,
    this.categoria,
    this.request,
  });

  @override
  State<StatefulWidget> createState() {
    return _GuidesBoletines();
  }
}

class _GuidesBoletines extends State<GuidesBoletines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        // width is infinity and the height is 60
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
          title: Center(
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.title,
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
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: widget.request,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List request = snapshot.data;

                    if (snapshot.data == CONNECTION_ERROR) {
                      return Container(
                        child: Center(
                          child: Text(snapshot.data),
                        ),
                      );
                    } else {
                      if (widget.categoria == "Guías Rápidas") {
                        return Scrollbar(
                          child: ListView(
                              children: request
                                  .map(
                                    (result) => result['Categoria'] ==
                                            widget.categoria
                                        ? Guides(
                                            idEncabezado:
                                                result['IdEncabezado'],
                                            encabezado: result['Encabezado'],
                                            fechaDocumento:
                                                result['FechaDocumento'],
                                            content: result['Contenido'],
                                            categoria: widget.categoria,
                                          )
                                        : Container(),
                                  )
                                  .toList()),
                        );
                      }
                      if (widget.categoria == "Boletines") {
                        return Scrollbar(
                          child: ListView(
                              children: request
                                  .map(
                                    (result) => result['Categoria'] ==
                                            widget.categoria
                                        ? Guides(
                                            idEncabezado:
                                                result['IdEncabezado'],
                                            encabezado: result['Encabezado'],
                                            fechaDocumento:
                                                result['FechaDocumento'],
                                            content: result['Contenido'],
                                            categoria: widget.categoria,
                                          )
                                        : Container(),
                                  )
                                  .toList()),
                        );
                      } else {
                        return DocumentEmpty("No hay ${widget.title}");
                      }
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white12,
                      valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
