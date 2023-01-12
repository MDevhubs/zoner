import 'dart:async';
import 'package:coinzoner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatefulWidget {
   NavigationControls({required this.controller, super.key});
  final Completer<WebViewController> controller;

  @override
  State<NavigationControls> createState() => _NavigationControlsState();
}

class _NavigationControlsState extends State<NavigationControls> {
  bool cangoBack=false;

  bool cangoForward=false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: widget.controller.future,
      builder: (context, snapshot) {
        final WebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return  Container(width: width(context), height: getHeight(50),
            decoration: BoxDecoration(color: bg_color_primary_secondary,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () async {
                },
                  icon: Icon(Icons.home),
                  color: bg_color_primary,),
                IconButton(onPressed: () async {
                },
                  icon: Icon(Icons.wallet),
                  color: bg_color_primary,),
                IconButton(onPressed: () async {},
                  icon: Icon(Icons.login),
                  color: bg_color_primary,),
                IconButton(onPressed: () async {},
                  icon: Icon(Icons.dashboard),
                  color: bg_color_primary,),
                IconButton(onPressed: () async {},
                  icon: Icon(Icons.chat),
                  color: bg_color_primary,),
              ],),
          );
        }


        return Container(width: width(context), height: getHeight(50),
          decoration: BoxDecoration(color: bg_color_primary_secondary,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if(cangoBack)
              IconButton(onPressed: () async {
                controller.canGoBack().then((value){
                  if(value) {
                    controller.goBack();
                    setState(() {
                      cangoForward=true;
                    });
                  }else{
                    setState(() {
                      cangoBack=false;
                    });
                  }

                });

                },
                icon: Icon(Icons.arrow_back),
                color: color_primary,),

              if(cangoForward)
              IconButton(onPressed: () async {
                controller.canGoForward().then((value){
                  if(value) {
                   setState(() {
                     cangoBack=true;
                   });
                    controller.goForward();
                  }else setState(() {
                    cangoForward=false;
                  });
                });
              },
                icon: Icon(Icons.arrow_forward),
                color: color_primary,),


              IconButton(onPressed: () async {
                gotoPlan(controller);
                setState(() {
                  cangoBack=true;
                });
              },
                icon: Icon(Icons.wallet),
                color: color_primary,),


              IconButton(onPressed: () async {
              gotoLogin(controller);
              setState(() {
                cangoBack=true;
              });

              },
                icon: Icon(Icons.login),
                color: color_primary,),


              IconButton(onPressed: () async {
                gotoDashboard(controller);
              },
                icon: Icon(Icons.dashboard),
                color: color_primary,),

            ],),
        );
      },
    );
  }
}

