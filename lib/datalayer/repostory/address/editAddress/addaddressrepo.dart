import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../customwidget/constient/url.dart';
import '../../../model/address/editaddress/addaddressmodel.dart';

class AddAddressRepo {
  static Future<AddAddressModel>? responseAdd(
      {var customerId,
      streetAddress,
      specialMarque,
      buildingNumber,
      roleNumber,
      governorateId,
      regionId,
      districtId,
      isDefault,
      lat,
      long}) async {
    AddAddressModel? addAddressModel = AddAddressModel();
    Map<String, dynamic> body = {
      "customer_id": customerId,
      "street_address": streetAddress,
      "special_marque": specialMarque,
      "building_number": buildingNumber,
      "role_number": roleNumber,
      "governorate_id": governorateId,
      "region_id": regionId,
      "district_id": districtId,
      "is_default": isDefault,
      "latitude": lat,
      "longitude": long,
    };
    var response = await http.post(Uri.http(passUrl, customerNewAddressService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      addAddressModel = addAddressModelFromMap(response.body);
    }
    return addAddressModel;
  }
}
