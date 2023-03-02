import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../customwidget/style.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DrewWeb extends StatefulWidget {
  String url;

  DrewWeb({Key? key, required this.url}) : super(key: key);

  @override
  State<DrewWeb> createState() => _DrewWebState();
}

class _DrewWebState extends State<DrewWeb> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "الشروط والاحكام",
          style:
              CustomTitleStyle.customTitleStyle(color: Colors.green, size: 16),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
