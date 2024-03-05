import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScren extends StatelessWidget {
  final String urlWebViewScreen;
  const WebViewScren(this.urlWebViewScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebView(initialUrl: urlWebViewScreen.toString()));
  }
}
