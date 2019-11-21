import 'package:flutter/material.dart';
import 'package:appgo/widgets/gradient.dart';
import 'package:appgo/widgets/form_login.dart';

class Login extends StatelessWidget {
  // double margin = 30.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientLogin(null),
          FormLogin(),
        ],
      ),
    );
  }
}
