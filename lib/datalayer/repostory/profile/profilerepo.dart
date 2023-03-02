import 'dart:convert';

import 'package:project/customwidget/constient/url.dart';
import 'package:http/http.dart' as http;

import '../../model/profile/profilemodel.dart';

class ProfileRepo {
 static Future<Profile>? getProfileRepo({var customerId}) async{
    Profile profile = Profile();
    Map<String, dynamic> body = {
      "customer_id": customerId,
    };
    var response =await
        http.post(Uri.http(passUrl, profileService), body: jsonEncode(body));
          if(response.statusCode==200){
            profile = profileFromMap(response.body);
          }
          return profile;
  }
}
