import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/drawer_left.dart';
import 'package:appgo/question/question_model.dart';
import 'package:appgo/question/Answers.dart';

class Question extends StatelessWidget {
  String salesman;
  Question(this.salesman);
  @override
  Widget build(BuildContext context) {
    String title = "Preguntas Frecuentes";
    double screenWidth = MediaQuery.of(context).size.width;

    QuestionModel question = new QuestionModel();

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: DrawerLeft(
            salesman: salesman,
          )),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
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
                  icon: new Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
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
      body: Container(
        child: ListView.builder(
          itemCount: question.sortByQuestion.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Answers(
                                question.sortByQuestion[index].encabezado,
                                question.sortByQuestion[index].contenido)));
                  },
                  title: Text(
                    question.sortByQuestion[index].encabezado,
                    style: TextStyle(
                        fontFamily: "INPro-Bold",
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: new Icon(
                    Icons.chevron_right,
                    color: Colors.lightBlue,
                  ),
                ),
                Divider(
                  color: Colors.black54,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
