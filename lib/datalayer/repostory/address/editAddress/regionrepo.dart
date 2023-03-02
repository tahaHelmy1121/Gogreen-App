

import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../../../customwidget/constient/url.dart';
import '../../../model/address/editaddress/region.dart';

class RegionRepo {

  static Future<List<Region>> getRegion({var governId,regions})async{
    List<Region>? region = [];
    Map<String,dynamic>body={
      "governorate_id":governId,
      "region":regions
    };
    var response =await http.post(Uri.http(passUrl, regionsService),body: jsonEncode(body),);
    if(response.statusCode==200){
      region=regionsFromMap(response.body);
    }
    return region;
  }


}