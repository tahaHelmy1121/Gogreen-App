import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/address/Address.dart';
import '../../model/address/addressone.dart';


class AddressRepo {
  static Future<List<Addresses>?>? getAddressRepo({var customerId}) async {
    List<Addresses>?addresses=[] ;
    Map<String, dynamic> body = {
      "customer_id": customerId,
    };
    var response = await http.post(Uri.https(passUrl,customerAddressesService),
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      addresses = addressesFromMap(response.body);
    }
    return addresses;
  }
  static Future<AddressOne>? getOneAddressRepo({var customerId,id}) async {
    AddressOne?oneAddress=AddressOne() ;
    Map<String, dynamic> body = {
      "customer_id": customerId,
      "id":id,
    };
    var response = await http.post(Uri.http(passUrl,customerAddressesService),
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      oneAddress = addresOneFromMap(response.body);
    }
    return oneAddress;
  }

}
