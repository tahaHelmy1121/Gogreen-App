import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../customwidget/constient/url.dart';
import '../../model/order/oredrmodel.dart';

class OrdersUserRepo {
  static Future<List<OrdersModel>?>? getUserOrders({customerId}) async {
    List<OrdersModel>? orders = [];
    Map<String, dynamic> body = {
      "customer_id": customerId,
    };
    var response = await http.post(Uri.http(passUrl, customerOrdersService),
        body: jsonEncode(body));
    if(response.statusCode==200){
      orders=ordersModelFromMap(response.body);
    }
    return orders;
  }
  static Future<OrdersDetailModel>? getUserOrdersDetails({var id,customerId}) async {
    OrdersDetailModel? ordersDetailModel = OrdersDetailModel();
    Map<String, dynamic> body = {
      "customer_id": customerId,
      "id":id,
    };
    var response = await http.post(Uri.http(passUrl, customerOrdersService),
        body: jsonEncode(body));
    if(response.statusCode==200){
      ordersDetailModel=ordersModelDetailsFromMap(response.body);
    }
    return ordersDetailModel;
  }
}
