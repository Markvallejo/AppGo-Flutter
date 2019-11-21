import 'package:flutter/material.dart';
import 'package:appgo/widgets/gradient.dart';
import 'package:appgo/widgets/button_Login.dart';
import 'package:appgo/user/ui/widget/card_Image_Logo.dart';
import 'package:appgo/user/ui/widget/list-screen_login.dart';
import 'package:appgo/user/ui/screen/login.dart';

class SingIn extends StatelessWidget {
  String login = "LOG IN";
  bool enter = false;
  double margin = 30.0;

  @override
  Widget build(BuildContext context) {
    void onPress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    }

    return Scaffold(
      body: Stack(children: <Widget>[
        GradientLogin(null),
        CardImageLogo(margin),
        ListScreenLogin(),
        ButtonLogin(
          enter: enter,
          textLogin: login,
          onPress: onPress,
        )
      ]),
    );
  }
}
