import 'dart:convert';

import '../../../customwidget/constient/url.dart';
import '../../model/cart/removecartmodel.dart';
import 'package:http/http.dart' as http;
class RemoveCartRepo {
static  Future<RemoveCartModel>removeCartRepo({var id})async  {
    RemoveCartModel removeCartModel = RemoveCartModel();
    Map<String, dynamic> body = {
      "id": id};
    var response =await http.post(Uri.http(passUrl, customerRemoveCartService),
        body: jsonEncode(body));
    if(response.statusCode==200){
      removeCartModel=removeCartModelFromMap(response.body);
    }
    return removeCartModel;
  }
}
