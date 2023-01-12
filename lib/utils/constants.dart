import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';

const app_name="Coinzoner";
const load_url_home="coinzoner.com";
const load_url_plan="coinzoner.com/plan";
const load_url_about="coinzoner.com/about";
const load_url_login="coinzoner.com/login";


const load_url_dashboard="coinzoner.com/user/dashboard";


const bg_color_primary=Color(0xFF0B1325);
const bg_color_primary_text=Color(0xffffffff);
const bg_color_primary_secondary=Color(0xffffffff);
const color_primary=Color(0xff247eea);
const bg_color_load_bar=Color(0xffee7545);
const animation_duration=Duration(microseconds: 300);



String getBanners(banner){
  return "assets/images/banners/$banner";
}
String getIcons(icon){
  return "assets/images/icons/$icon";
}
String getImage(img){
  return "assets/images/imgs/$img";
}




void gotoLogin(controller){
  controller.loadRequest(WebViewRequest(uri: Uri.parse("https://$load_url_login"), method: WebViewRequestMethod.get));
}
void gotoPlan(controller){
  controller.loadRequest(WebViewRequest(uri: Uri.parse("https://$load_url_plan"), method: WebViewRequestMethod.get));
}

void gotoDashboard(controller){
  controller.loadRequest(WebViewRequest(uri: Uri.parse("https://$load_url_dashboard"), method: WebViewRequestMethod.get));
}

class Config{
  static MediaQueryData? data;
  static double? width,height;
  static Orientation? orientation;

  static void initials(BuildContext context){
    data=MediaQuery.of(context);
    width=data!.size.width;
    height=data!.size.height;
    orientation=data!.orientation;
  }
}


double getWidth(size){
  return (size/375)*Config.width;
}
double getHeight(size){
  return (size/812)*Config.height;
}


double width(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context){
  return MediaQuery.of(context).size.height;
}