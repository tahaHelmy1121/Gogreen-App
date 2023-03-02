import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/auth/loginmodel.dart';

class LoginRepository {
 static Future<List<LoginModel>> getLogin(var userName, password, deviceId)async {
   List<LoginModel> datap = [];
    Map<String, dynamic> data = {
      "user_name": userName,
      "password": password,
      "device_id": deviceId,
    };

    var response =await
        http.post(Uri.http(passUrl, loginService),
            body: jsonEncode(data));
   if(response.statusCode==200){
     var jsonData = jsonDecode(response.body);
     datap.add(LoginModel.fromMap(jsonData));
   }
    return datap;
  }

}
