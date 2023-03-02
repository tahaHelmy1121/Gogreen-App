import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/order/ordersuremodel.dart';

class OrderSureRepo {
static Future<OrderSure>?  getResponseOrderSure({var customerId, addressId}) async {
  OrderSure? orderSure =OrderSure();
    Map<String,dynamic> body = {
      "customer_id": customerId,
      "address_id": addressId,
    };
    var response =await http.post(Uri.http(passUrl, customerNewOrderFromCartService),
        body: jsonEncode(body));
    if(response.statusCode==200){
      orderSure=orderSureFromMap(response.body);
    }
    return orderSure;
  }
}
