
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../customwidget/constient/url.dart';
import '../../model/auth/registermodel.dart';
class RegisterRepository {
 static Future<List<RegisterModel>> getRegisterRepo(
      {var name, email, mobile, deviceId, acceptable, langId, password})async {
    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "device_id": deviceId,
      "acceptable": acceptable,
      "language_id": langId,
      "password": password,
    };
    List<RegisterModel> data = [];
    var response =
      await  http.post(Uri.http(passUrl, registerService), body: jsonEncode(body));
    if(response.statusCode==200){
      var jsonData = jsonDecode(response.body);
      data.add(RegisterModel.fromMap(jsonData));
    }
    return data;
  }
}
