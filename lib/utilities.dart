import 'package:flutter/material.dart';

import 'models.dart';
import 'package:http/http.dart' as http;

// enhancement can be apply
class ColorHelper {
  static const int LEVEL_REGION = 0;
  static const int LEVEL_COUNTRIES = 1;
  static const int LEVEL_COUNTRY_DETAILS = 2;
  static const int LEVEL_COUNTRIES_SELECTED = 3;
  static const int LEVEL_COUNTRIES_NOT_SELECTED = 4;

  ColorHelper._();

  static Color generateColor({@required int level, Clr clr}) {
    switch (level) {
      case LEVEL_REGION:
        clr.a = 255;
        return getColor(clr: clr);
      case LEVEL_COUNTRIES:
        clr.a = 230;
        return getColor(clr: clr);
      case LEVEL_COUNTRIES_SELECTED:
        clr.a = 170;
        return getColor(clr: clr);
      case LEVEL_COUNTRIES_NOT_SELECTED:
        clr.a = 70;
        return getColor(clr: clr);
      case LEVEL_COUNTRY_DETAILS:
        clr.a = 205;
        return getColor(clr: clr);
    }
  }

  static Color getColor({int a, int r, int g, int b, Clr clr}) {
    if(clr != null){
      return Color.fromARGB(clr.a, clr.r, clr.g, clr.b);
    }
    return Color.fromARGB(a, r, g, b);
  }
}

class NetworkHelper{

  static Future<http.Response> get(String url){
    return http.get(url);
  }

}