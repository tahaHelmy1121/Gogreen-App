import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../../customwidget/constient/url.dart';
import '../../model/delegete/orderavalable.dart';

class OrderAvailableRepoX {

 static Future<List<OrderAvailableModel>?>? getOrderAvailableRepo ({var delegateId})async{

    List<OrderAvailableModel>? ordersAvailable=[] ;
    Map<String,dynamic>body ={
      "delegate_id":delegateId,
    };
    var response =await http.post(Uri.http(passUrl,orderAvailableService),body:jsonEncode(body));

    if(response.statusCode==200){
      ordersAvailable =orderAvailableModelFromMap(response.body);
    }
    return ordersAvailable;
  }
}
