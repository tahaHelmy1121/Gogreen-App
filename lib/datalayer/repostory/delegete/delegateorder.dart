
import 'package:http/http.dart'as http;
import 'dart:convert';

import '../../../customwidget/constient/url.dart';
import '../../model/delegete/orderdelegate.dart';


class DelegateOrderRepo {
static  Future<List<DelegateOrder>?>? getMyOrder ({var delegateId,orderStatus,start,end})async{
    List<DelegateOrder>? myOrder = [];
    Map<String,dynamic>body ={
      "delegate_id":delegateId,
      "order_status":orderStatus,
      "start_date":start,
      "end_date":end,
    };
    var response =await http.post(Uri.http(passUrl, delegateOrderService),body: jsonEncode(body));

    if(response.statusCode==200){

      myOrder=delegateOrderFromMap(response.body);

    }
    return myOrder;
  }
}