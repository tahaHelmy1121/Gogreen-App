import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../customwidget/constient/url.dart';
import '../../model/about/aboutModel.dart';
class AboutRepo {
  static Future<List<AboutModel>?>? getAbout({var id}) async {
    List<AboutModel>? about;
    Map<String, dynamic> body = {"id": id};
    var response = await http.post(Uri.http(passUrl, pagesService),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      about = aboutFromMap(response.body);
    }
    return about;
  }
}
