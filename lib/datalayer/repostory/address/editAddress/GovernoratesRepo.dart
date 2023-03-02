import 'dart:convert';
import '../../../../customwidget/constient/url.dart';
import '../../../model/address/editaddress/goverorates.dart';
import 'package:http/http.dart' as http;

class GovRepo {
  static Future<List<Governorates>?>? getGov({var governorate}) async {
    List<Governorates>? myGov = [];
    Map<String, dynamic> body = {"governorate": governorate};
    var response = await http.post(Uri.http(passUrl, governoratesService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      myGov = governoratesFromMap(response.body);
    }
    return myGov;
  }
}
