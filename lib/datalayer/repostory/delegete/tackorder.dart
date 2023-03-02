import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../../customwidget/constient/url.dart';
import '../../model/delegete/tackorder.dart';


class TackOrderRepo {
 static Future<TackOrder>? tackOrderRepo({var delegateId,orderId })async {
    TackOrder? tackOrder = TackOrder();
    Map<String, dynamic> body = {"delegate_id": delegateId,"order_id":orderId};
    var response = await http.post(Uri.http(passUrl, tackOrderService),body: jsonEncode(body),);
    if(response.statusCode==200){
      tackOrder=tackOrderFromMap(response.body);
    }
    return tackOrder;
  }
}
