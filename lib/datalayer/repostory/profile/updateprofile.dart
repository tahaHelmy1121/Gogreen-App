import 'dart:convert';

import 'package:project/customwidget/constient/url.dart';
import 'package:project/datalayer/model/profile/ubdateprofile.dart';
import 'package:http/http.dart' as http;

class UpdateProfileRepo {
 static Future<UpdateProfile>? getUpdateProfileRepo(
      {var name, email, mobile, password, customerId}) async {
    UpdateProfile updateProfile = UpdateProfile();
    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "device_id": 1,
      "acceptable": 1,
      "language_id": 1,
      "customer_id": customerId
    };
    var response = await http.post(
        Uri.http(passUrl, customerUpdateProfileService),
        body: jsonEncode(body));
    if(response.statusCode==200){
      updateProfile = updateProfileFromMap(response.body);
    }
    return updateProfile;
  }
}
