import 'package:flutter/material.dart';
import 'package:appgo/user/model/user.dart';
import 'package:appgo/widgets/button_Login.dart';
import 'package:appgo/Service/salesman_list_request.dart';
import 'package:appgo/dashboard/ui/screen/dashboard.dart';

class InputLabel extends StatefulWidget {
  @override
  _InputLabel createState() => _InputLabel();
}

class _InputLabel extends State<InputLabel> {
  User user = new User();
  var salesman = salesmanListRequest();
  int maxLines = 1;
  bool validate = false;
  bool enter = true;
  bool indicator = false;
  FocusNode _focusNodeDistribuidor = new FocusNode();
  FocusNode _focusNodeIdVendedor = new FocusNode();
  FocusNode _focusNodePass = new FocusNode();

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
    void _showAlertDialog(text) {
      showDialog(
          context: context,
          builder: (buildcontext) {
            return AlertDialog(
              title: Center(child: Text("ERROR")),
              content: Text(
                text,
                style: TextStyle(fontFamily: "DIN"),
              ),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Center(
                    child: Text(
                      "CERRAR",
                      style: TextStyle(color: Colors.white, fontFamily: "DIN"),
                    ),
                  ),
                  colorBrightness: Brightness.light,
                  onPressed: () {
                    setState(() {
                      indicator = false;
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    onPress() {
      _controllerDistribuidor.text = 'TEST003';
      _controllerIdVendedor.text = '99998';
      _controllerPass.text = 'Password00';
      setState(() {
        indicator = true;
      });

      salesmanListRequest().catchError((error) {
        _showAlertDialog(error.toString());
        return error;
      });

      salesman.then((resp) {
        List response = resp;
        for (var i = 0; i < response.length; i++) {
          if (response[i]['NombreVendedor'] == user.sSalesManInfo) {
            if (_controllerDistribuidor.text.isEmpty ||
                _controllerIdVendedor.text.isEmpty ||
                _controllerPass.text.isEmpty) {
              _showAlertDialog("Debes llenar todos los campos");
            } else if (_controllerDistribuidor.text !=
                    response[i]['NombreVendedor'] ||
                _controllerIdVendedor.text != user.sDealerNumber ||
                _controllerPass.text != user.sPassword) {
              _showAlertDialog(
                  "Los datos ingresados no son correctos. Intenta nuevamente");
              validate = true;
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Dashboard(
                            salesman: response[i]['NombreVendedor'],
                          )),
                  ModalRoute.withName('/Dashboard'));
            }
          }
        }
      });
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
            return null;
          }
          if (val.toString() != user.sSalesManInfo) {
            return "Invalid Username";
          }
          return null;
        },
        autovalidate: validate ? true : false,
        autofocus: false,
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
          hintText: 'TEST003',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
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
            return null;
          }
          if (val.toString() != user.sDealerNumber) {
            return "Invalid ID";
          }
          return null;
        },
        autovalidate: validate ? true : false,
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
          hintText: "99998",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5), width: 10.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
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
            return null;
          }
          if (val.toString() != user.sPassword) {
            return "Password00";
          }
          return null;
        },
        autovalidate: validate ? true : false,
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
          hintText: 'Password00',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
      ),
    );

    String login = "ENTRAR";
    final circleindicator = Container(
      padding: EdgeInsets.all(10.0),
      height: 50.0,
      width: 50.0,
      child: CircularProgressIndicator(
          backgroundColor: Colors.white70,
          valueColor: AlwaysStoppedAnimation(Colors.lightBlue)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        labelDistribuidor,
        labelId,
        labelPass,
        indicator ? circleindicator : Container(),
        ButtonLogin(
          enter: enter,
          textLogin: login,
          onPress: onPress,
          indicator: indicator,
        ),
      ],
    );
  }
}
