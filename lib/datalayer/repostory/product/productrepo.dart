import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project/datalayer/model/categorymodel/categorymodel.dart';
import 'package:project/datalayer/model/product/productmodel.dart';

import '../../../customwidget/constient/url.dart';

class ProductRepoistory {
  static Future<ProductsModel> getcategoryRepo({var customer , id}) async {
    ProductsModel products = ProductsModel();
    Map<String, dynamic> body = {"customer": customer,"category_id": id,};
    var response = await http.post(Uri.http(passUrl, productsService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      products = productsFromMap(response.body);
    }
    return products;
  }
}
