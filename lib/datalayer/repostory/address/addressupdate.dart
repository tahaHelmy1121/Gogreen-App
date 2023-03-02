import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/address/addressupdate.dart';

class UpAddressRepo {
  static Future<UpdateAddress?> responseUpdate({
    var customerId,
    streetAddress,
    specialMarque,
    buildingNumber,
    roleNumber,
    governorateId,
    regionId,
    districtId,
    isDefault,
    id,
    longitude,
    latitude
  }) async {
    UpdateAddress? updateAddress =UpdateAddress() ;
    Map<String,dynamic> body = {
      "customer_id": customerId,
      "street_address": streetAddress,
      "special_marque": specialMarque,
      "building_number": buildingNumber,
      "role_number": roleNumber,
      "governorate_id":governorateId,
      "region_id":regionId,
      "district_id":districtId,
      "is_default":isDefault,
      "id":id,
      "longitude":longitude,
      "latitude":latitude
    };
    var response = await http.post(Uri.http(passUrl,customerUpdateAddressService),
        body: jsonEncode(body));
    if(response.statusCode==200){
      updateAddress=updateAddressFromMap(response.body);
    }
    return updateAddress;
  }
}
