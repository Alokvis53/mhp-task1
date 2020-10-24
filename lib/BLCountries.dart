import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app_sample_mahapatra/app_constants.dart';
import 'package:flutter_app_sample_mahapatra/models.dart';
import 'package:flutter_app_sample_mahapatra/utilities.dart';

class BLCountries{
  /*static final BLCountries _singleton = BLCountries._internal();

  factory BLCountries() {
    return _singleton;
  }

  BLCountries._internal(){
    // init logic goes here, if any
  }
  */

  Future<List<Country>> fetchCountryOfRegion(Region region) async {
    final response = await NetworkHelper.get("${ApiConstants.BASE_URL}${ApiConstants.COMP_REGION}${region.name}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log('Response Body is printing, length is  ${response.contentLength}');
      //log('Response Body ${response.body}');
      //return Country.fromJson(jsonDecode(response.body));
      return Country.listFromJson(jsonDecode(response.body), region: region);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception, it can be customised.
      log('Response Code - > ${response.statusCode}');
      throw Exception('Failed to load Country');
    }
  }

}