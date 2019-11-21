import 'package:flutter/material.dart';
import 'package:appgo/user/ui/widget/screen_login.dart';
import 'package:appgo/user/ui/widget/screen_login2.dart';
import 'package:appgo/user/ui/widget/screen_login3.dart';
import 'package:appgo/user/ui/widget/screen_login4.dart';
import 'package:page_indicator/page_indicator.dart';

class ListScreenLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListScreenLogin();
  }
}

class _ListScreenLogin extends State<ListScreenLogin> {
  @override
  Widget build(BuildContext context) {
    final PageController _controller = new PageController();
    double screenHeight = MediaQuery.of(context).size.height;

    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    final indicador = Container(
      height: screenHeight * 0.76,
      child: PageIndicatorContainer(
        length: 4,
        indicatorSpace: 40.0,
        shape: IndicatorShape.circle(size: 12),
        indicatorSelectorColor: Colors.green,
        indicatorColor: Colors.black38,
        padding: EdgeInsets.all(5.0),
        child: PageView(children: <Widget>[
          ScreenLogin(),
          ScreenLogin2(),
          ScreenLogin3(),
          ScreenLogin4()
        ], controller: _controller),
      ),
    );

    return indicador;
  }
}
