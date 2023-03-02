import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/cart/cartmodel.dart';

class IconCartRepo {
  static Future <CartModel?> getTotalCartRepo({var customerId}) async {
    CartModel? cartModel= CartModel() ;
    Map<String, dynamic> body = {
      "customer_id": customerId,
    };
    var response = await http.post(Uri.http(passUrl, customerCartService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      cartModel = cartModelFromMap(response.body);
    }
    return cartModel;
  }
}
