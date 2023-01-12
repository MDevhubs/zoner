import 'dart:async';

import 'package:coinzoner/bottom_nav.dart';
import 'package:coinzoner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Home extends StatefulWidget {
  static String route_name="coinzoner/home/";

   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loadingPercentage = 0;
  var url = load_url_login;
  var pressed=2;

  Future<bool> backpress() async{
    if(pressed<=0) return true;
    pressed=pressed-1;
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        pressed=2;
      });
    });
    Fluttertoast.showToast(msg: "press one  more time to exit",toastLength: Toast.LENGTH_SHORT,fontSize: getWidth(12),backgroundColor: color_primary,textColor: bg_color_primary_secondary);

    return false;
  }

  final controller=Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
       return backpress();
      },
      child: Scaffold(
          body: SafeArea(
              child: Hero(
                tag: "loadhome",
                child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(child:
                          WebView(
                            onWebViewCreated: (wcontroller) {
                              controller.complete(wcontroller);
                            },
                            javascriptMode: JavascriptMode.unrestricted,
                            initialUrl: "https://$url",
                            allowsInlineMediaPlayback: true,
                            zoomEnabled: false,
                            userAgent: "CoinzonerMobileAPP",
                            onPageStarted: (url) {
                              setState(() {
                                loadingPercentage = 0;
                              });
                            },
                            onProgress: (progress) {
                              setState(() {
                                loadingPercentage = progress;
                              });
                            },
                            onPageFinished: (url) {
                              setState(() {
                                loadingPercentage = 100;
                              });
                            },
                          ),),

                          NavigationControls(controller: controller)

                        ],
                      ),

                      if(loadingPercentage < 100)
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: width(context),
                              height: height(context),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(bg_color_primary_text.red,
                                    bg_color_primary_text.green,
                                    bg_color_primary_text.blue, .5),
                              ),
                              child: Column(children: [
                                Container(width: width(context),
                                    height: getHeight(8),
                                    color: bg_color_primary_text,
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: LinearProgressIndicator(
                                          color: bg_color_load_bar,
                                          backgroundColor: bg_color_primary_text,
                                          value: loadingPercentage / 100,)))


                              ],),
                            ))

                    ]
                ),
              )
          )
      ),
    );
  }






}


