import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project/datalayer/model/categorymodel/categorymodel.dart';

import '../../../customwidget/constient/url.dart';

class CategoryRepoistory {
  static Future<List<CategoryModel>> getcategoryRepo({var customer}) async {
    Map<String, dynamic> body = {"customer": customer};
    List<CategoryModel> listcat = [];
    var response = await http.post(Uri.http(passUrl, categoryService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      listcat = categoryModelRouteFromMap(response.body);
    }
    return listcat;
  }
}
