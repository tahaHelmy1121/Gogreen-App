import '../../../customwidget/constient/url.dart';
import '../../model/cart/addcart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCartRepo {

 static Future<AddCartModel> addCart({var customerId, productId, quantity}) async {
    AddCartModel addCartModel = AddCartModel();
    Map<String, dynamic>body = {
      "customer_id": customerId,
      "product_id": productId,
      "quantity": quantity,
    };
    var response = await http.post(
        Uri.http(passUrl, customerAddCartService), body: jsonEncode(body));

    if (response.statusCode==200) {
      addCartModel =addCartFromMap(response.body) ;
    }
    return   addCartModel;
    }
  }

