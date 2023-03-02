
import 'package:http/http.dart'as http;
import 'dart:convert';

import '../../../customwidget/constient/url.dart';
import '../../model/delegete/orderstatus.dart';
class OrderStateRepo {
 static Future <DelegateOrderStatus?>? orderStatus({var orderId,orderStatus,reasonRefuse})async{
    DelegateOrderStatus? delegateOrderStatus ;
    Map<String,dynamic>body = {
      "order_id":orderId,
      "order_status":orderStatus,
      "reason_refuse":reasonRefuse,
    };
    var response = await http.post(Uri.http(passUrl, delegateOrderStatusService),body: jsonEncode(body),);
    if(response.statusCode==200){
      delegateOrderStatus=delegateOrderStatusFromMap(response.body);
    }
    return delegateOrderStatus;
  }
}