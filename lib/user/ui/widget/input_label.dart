import 'package:flutter/material.dart';
import 'package:appgo/user/model/user.dart';
import 'package:appgo/user/ui/screen/login_screen_presenter.dart';
import 'package:appgo/dashboard/ui/screen/dashboard.dart';
import 'package:appgo/widgets/button_Login.dart';

class InputLabel extends StatefulWidget {
  @override
  _InputLabel createState() => _InputLabel();
}

class _InputLabel extends State<InputLabel> {
  User user = new User();
  int maxLines = 1;

  FocusNode _focusNodeDistribuidor = new FocusNode();
  FocusNode _focusNodeIdVendedor = new FocusNode();
  FocusNode _focusNodePass = new FocusNode();
  LoginScreenPresenter _presenter;

  @override
  void iniState() {
    super.initState();
    _focusNodeDistribuidor = FocusNode();
    _focusNodeIdVendedor = FocusNode();
    _focusNodePass = FocusNode();
  }

  @override
  void dispose() {
    _focusNodeDistribuidor.dispose();
    _focusNodeIdVendedor.dispose();
    _focusNodePass.dispose();

    super.dispose();
  }

  final TextEditingController _controllerDistribuidor =
      new TextEditingController();
  final TextEditingController _controllerIdVendedor =
      new TextEditingController();
  final TextEditingController _controllerPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    void _showAlertDialog() {
      showDialog(
          context: context,
          builder: (buildcontext) {
            return AlertDialog(
              title: Center(child: Text("ERROR")),
              content: Text(
                "Los datos ingresados no son correctos. Intenta nuevamente",
                style: TextStyle(fontFamily: "DIN"),
              ),
              actions: <Widget>[
                RaisedButton(
                  child: Center(
                    child: Text(
                      "CERRAR",
                      style: TextStyle(color: Colors.white, fontFamily: "DIN"),
                    ),
                  ),
                  colorBrightness: Brightness.light,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    Future onPress() async {
      if (_controllerDistribuidor.text != user.sSalesManInfo ||
          _controllerIdVendedor.text != user.sDealerNumber ||
          _controllerPass.text != user.sPassword) {
        _showAlertDialog();
      } else
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => DashBoard()));
    }

    final labelDistribuidor = Container(
      margin: EdgeInsets.only(top: screenHeight * 0.070),
      width: screenWidth * 0.605,
      child: TextFormField(
        controller: _controllerDistribuidor,
        textInputAction: TextInputAction.next,
        maxLines: maxLines,
        onSaved: (val) => _controllerDistribuidor.text = val,
        validator: (val) {
          if (val.isEmpty) {
            return "Username Empty";
          }
          if (val.toString() != user.sSalesManInfo) {
            return "Invalid Username";
          }
          return null;
        },
        autovalidate: _controllerDistribuidor.text.isEmpty ? false : true,
        autofocus: false,
        keyboardType: TextInputType.numberWithOptions(signed: true),
        focusNode: _focusNodeDistribuidor,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_focusNodeIdVendedor);
        },
        style: TextStyle(
            fontSize: 12.0,
            fontFamily: "DIN",
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: 'Distribuidor',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        onEditingComplete: () {},
      ),
    );

    final labelId = Container(
      margin: EdgeInsets.only(top: screenHeight * 0.0275),
      width: screenWidth * 0.605,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: _controllerIdVendedor,
        focusNode: _focusNodeIdVendedor,
        autofocus: false,
        maxLines: maxLines,
        onSaved: (val) => _controllerIdVendedor.text = val,
        validator: (val) {
          if (val.isEmpty) {
            return "ID is Empty";
          }
          if (val.toString() != user.sDealerNumber) {
            return "Invalid ID";
          }
          return null;
        },
        autovalidate: _controllerIdVendedor.text.isEmpty ? false : true,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_focusNodePass);
        },
        style: TextStyle(
            fontSize: 12.0,
            fontFamily: 'DIN',
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: "ID del Vendedor",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5), width: 10.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        onEditingComplete: () {},
      ),
    );
    final labelPass = Container(
      margin: EdgeInsets.only(top: screenHeight * 0.0275),
      width: screenWidth * 0.605,
      child: TextFormField(
        controller: _controllerPass,
        focusNode: _focusNodePass,
        textInputAction: TextInputAction.send,
        onSaved: (val) => _controllerPass.text = val,
        validator: (val) {
          if (val.isEmpty) {
            return "Password is Empty";
          }
          if (val.toString() != user.sPassword) {
            return "Invalid Password";
          }
          return null;
        },
        autovalidate: _controllerPass.text.isEmpty ? false : true,
        autofocus: false,
        maxLines: maxLines,
        obscureText: true,
        style: TextStyle(
            fontSize: 12.0,
            fontFamily: "DIN",
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: 'Contraseña',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
      ),
    );

    String login = "ENTRAR";
    bool enter = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        labelDistribuidor,
        labelId,
        labelPass,
        ButtonLogin(
          enter: enter,
          textLogin: login,
          onPress: onPress,
        ),
      ],
    );
  }
}
