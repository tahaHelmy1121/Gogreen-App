import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../customwidget/constient/url.dart';
import '../../../model/address/editaddress/districts.dart';

class DistrictsRepo {
  static Future<List<Districts>> getDis({var regionId, dis}) async {
    List<Districts>? disData = [];
    Map<String, dynamic> body = {"region_id": regionId,"district": dis};
    var response = await http.post(Uri.http(passUrl, districtsService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      disData = districtsFromMap(response.body);
    }
    return disData;
  }
}
