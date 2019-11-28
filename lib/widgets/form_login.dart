import 'package:flutter/material.dart';
import 'package:appgo/user/ui/widget/input_label.dart';
import 'package:appgo/widgets/button_cancelar.dart';
import 'package:appgo/user/ui/widget/card_Image_Logo.dart';

class FormLogin extends StatefulWidget {
  final String sesion = "INICIAR SESIÓN";

  @override
  State<StatefulWidget> createState() {
    return _FormLogin();
  }
}

class _FormLogin extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double margin = 30.0;

    final textSesion = Container(
      width: screenWidth * 0.70,
      margin: EdgeInsets.only(top: screenHeight * 0.05),
      child: Text(
        widget.sesion,
        style: TextStyle(
            letterSpacing: 2.0,
            fontFamily: "DIN",
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),
    );

    final formLogin = Container(
      height: screenHeight,
      width: screenWidth,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CardImageLogo(margin),
              textSesion,
              InputLabel(),
              ButtonCancel()
            ],
          ),
        ),
      ),
    );

    return formLogin;
  }
}
