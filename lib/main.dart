import 'package:coinzoner/home.dart';
import 'package:coinzoner/splash.dart';
import 'package:coinzoner/utils/constants.dart';
import "package:flutter/material.dart";
import 'package:coinzoner/utils/routes.dart' ;
import 'package:flutter/services.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "$app_name",
    routes: routes,
    initialRoute: SplashScreen.route_name,
    theme: ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: "sofia"),
        bodyText2: TextStyle(fontFamily: "sofia"),
        headline1: TextStyle(fontFamily: "sofia"),
        headline2: TextStyle(fontFamily: "sofia"),
        headline3: TextStyle(fontFamily: "sofia"),
        headline4: TextStyle(fontFamily: "sofia"),
        headline5: TextStyle(fontFamily: "sofia"),
        headline6: TextStyle(fontFamily: "sofia"),
      )
    ),

  ));

}