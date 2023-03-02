import 'dart:convert';

import 'package:project/datalayer/model/auth/forgetpassword.dart';
import 'package:http/http.dart' as http;

import '../../../../customwidget/constient/url.dart';

class ForgetPassWord {
 static Future<ForgetPassword>? getForgetRepo({var email}) async {
   ForgetPassword? forget = ForgetPassword();
    Map<String, dynamic> body = {
      "email": email,
    };
    var response =await
        http.post(Uri.http(passUrl, forgetPasswordService), body: jsonEncode(body));
    if(response.statusCode==200){
      forget = forgetPasswordFromMap(response.body);
    }
    return forget;
  }
}
