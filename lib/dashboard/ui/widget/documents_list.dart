import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/document.dart';
import 'package:appgo/Service/documents_request.dart';
import 'package:appgo/dashboard/ui/widget/document_empty.dart';

class DocumentsList extends StatelessWidget {
  int idDocument;
  DocumentsList(this.idDocument);

  @override
  Widget build(BuildContext context) {
    var documents = documentsRequest(idDocument);
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: documents,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List documentsList = snapshot.data;
            if (documentsList.isEmpty) {
              return Container(
                child: DocumentEmpty("No hay Documentos"),
              );
            } else {
              return Container(
                child: Scrollbar(
                  child: ListView(
                      children: documentsList
                          .map((documentsList) => Document(
                                documentTitle: documentsList['TipoDocumento'],
                                subTitle: documentsList['RoleSolicitud'],
                                version: documentsList['VersionDocumento'],
                                status: documentsList['Status'],
                                date: documentsList['FechaCreacion'],
                              ))
                          .toList()),
                ),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text("No se encontro Resultados"),
              ),
            );
          }
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.030),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              ),
            ),
          );
        });
  }
}
