import 'package:coinzoner/home.dart';
import 'package:coinzoner/utils/constants.dart';
import 'package:flutter/material.dart';


 class SplashScreen extends StatefulWidget {

  static final String route_name="/coinzoner/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showImage=false;
  bool showText=false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
     setState(() {
       showImage=true;
     });
     Future.delayed(Duration(seconds: 4),(){
       setState(() {
         showText=true;
       });
     });

     Future.delayed(Duration(seconds: 7),(){
      setState(() {
       showImage=false;
      });
      Future.delayed(Duration(seconds: 1),(){
       Navigator.pushReplacementNamed(context, Home.route_name,arguments: {"url":load_url_login});
      });
     });

    });
  }

  @override
  Widget build(BuildContext context) {

  Config.initials(context);
    return Scaffold(
     backgroundColor: bg_color_primary,
     body: SafeArea(
      child: Hero(
        tag: "loadhome",
        child: Center(
          child: Builder(builder: (context) {
           return showImage? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset(getIcons("logo.png",),width:getWidth(70) ,height:getHeight(50),)
             ,SizedBox(height: getHeight(10),)
             ,
              if(showText)
              Text("Invest for The Future in Stable Platform and Make Fast Profit",
              style: TextStyle(color: bg_color_primary_text,fontSize: getWidth(10),fontWeight: FontWeight.bold)
              ,textAlign: TextAlign.center,)

            ],
           ):Container();

          },)
        ),
      ),
     ),

    );
  }
}
