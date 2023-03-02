import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/address/removeaddress.dart';


class RemoveAddRepo {
  static Future <RemoveAddress>? removeAddressRepo({var id}) async {
    RemoveAddress ?addresses=RemoveAddress() ;
    Map<String, dynamic> body = {
      "address_id": id,
    };
    var response = await http.post(Uri.https(passUrl,customerDelAddressService),
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      addresses = removeAddressFromMap(response.body);
    }
    return addresses;
  }
}
