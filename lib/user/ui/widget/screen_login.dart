import 'package:flutter/material.dart';
import 'package:appgo/user/ui/screen/info_login.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InfoLogin("BIENVENIDO A", "APPGO",
            "La aplicacion para conocer el progreso y estado de tus solicitudes de forma facil y rapida. Ingresa con tus datos de RightLink."));
  }
}
