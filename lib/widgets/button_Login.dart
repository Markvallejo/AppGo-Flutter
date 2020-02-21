import 'package:flutter/material.dart';
import 'package:appgo/user/ui/screen/login.dart';
import 'package:appgo/dashboard/ui/screen/dashboard.dart';

class ButtonLogin extends StatefulWidget {
  String textLogin;
  bool enter;
  final VoidCallback onPress;

  ButtonLogin({Key key, this.textLogin, this.enter, this.onPress});

  @override
  State<StatefulWidget> createState() {
    return _ButtonLogin();
  }
}

class _ButtonLogin extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final ButtonLogin = Container(
        margin: widget.enter
            ? EdgeInsets.only(top: screenHeight * 0.08, left: 20.0, right: 20.0)
            : EdgeInsets.only(
                top: screenHeight * 0.82, left: 20.0, right: 20.0),
        width: screenWidth * 0.605,
        height: screenHeight * 0.0816,
        child: FlatButton.icon(
          color: Colors.blue[400],
          icon: Icon(
            Icons.accessibility_new,
            color: Colors.blue[400],
            size: 0.0,
          ),
          label: Text(widget.textLogin,
              style: TextStyle(
                  fontFamily: "DIN",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          onPressed: widget.onPress,
        ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[ButtonLogin],
    );
  }
}
