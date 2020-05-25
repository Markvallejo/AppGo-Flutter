import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appgo/user/ui/screen/singIn.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/dashboard/ui/screen/dashboard.dart';
import 'package:appgo/filtros/filters_test.dart';
import 'package:appgo/dashboard/ui/screen/details_solicitud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]); // bloquea rotacion de pantalla
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('he'),
        const Locale('es'), //spanish
        const Locale.fromSubtags(languageCode: 'es'),
      ],
      debugShowCheckedModeBanner: false, // delete debug from view
      title: 'Flutter Demo',
      // home: FiltersTest(),
      home: SingIn(),
      //home: Service(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new SingIn(),
        '/DashBoard': (BuildContext context) => new Dashboard(),
        '/DetailsSolicitud': (BuildContext context) => new DetailsSolicitud(),
      },

      theme: ThemeData(
        //Se indica que el tema tiene un brillo luminoso/claro
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(
        //Se indica que el tema tiene un brillo oscuro
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
    );
  }
}
