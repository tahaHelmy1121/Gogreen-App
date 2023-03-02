
import 'package:http/http.dart'as http;

import '../../../../../customwidget/constient/url.dart';
import '../../../../model/auth/wevmodel/webmodel.dart';

class WebViewRepo {
  static Future<WebModel>? getUrl ()async{
    WebModel webModel =WebModel();
    var response = await http.post(Uri.http(passUrl,settingService));

    if(response.statusCode==200){
    webModel=webModelFromMap(response.body);
    }
    return webModel ;
  }
}